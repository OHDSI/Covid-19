--reset phenotype concept list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
;

--reset Standard concepts Included list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
    AND criteria = 'inclusion'
;

--List of Standard concepts Included
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Chronic lung disease, not asthma (all but acute)', 'inclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
--Put concept_ids here
320136	--	50043002	Condition	Disorder of respiratory system	SNOMED

    )
;

--List of Standard concepts Included for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
    AND criteria = 'inclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Included
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
    AND criteria = 'inclusion'
GROUP BY domain_id, concept_id, concept_name, concept_code, vocabulary_id
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Retrieve concepts from source vocabularies mapped to Standard concepts Included or any of its child
--Mapping list
with mappings as (

SELECT DISTINCT c1.domain_id,
                c1.concept_id,
                c1.concept_name,
                c1.vocabulary_id,
                c2.vocabulary_id as source_vocabulary_id,
                string_agg (DISTINCT c2.concept_code, '; ' ORDER BY c2.concept_code) as source_code
FROM @vocabulary_database_schema.concept_ancestor ca1
JOIN @vocabulary_database_schema.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN @vocabulary_database_schema.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN @vocabulary_database_schema.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM @target_database_schema.concept_phenotypes
    WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
        AND criteria = 'inclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC'))

GROUP BY    1,2,3,4,5
)

--list
/*SELECT domain_id, concept_id, concept_name, vocabulary_id, source_vocabulary_id, source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id*/

--markdown-friendly list
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || vocabulary_id || '|' || source_vocabulary_id || '|' || source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id
;


--Retrieve concepts from source vocabularies mapped to Standard concepts Included or any of its child
--Detailed Mapping list
with mappings as (

SELECT DISTINCT c2.concept_name as source_code_description,
                c2.concept_code as source_code,
                c2.vocabulary_id as source_vocabulary_id,
                c1.concept_id,
                c1.concept_code,
                c1.concept_name,
                c1.concept_class_id,
                c1.standard_concept,
                c1.invalid_reason,
                c1.domain_id,
                c1.vocabulary_id

FROM @vocabulary_database_schema.concept_ancestor ca1
JOIN @vocabulary_database_schema.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN @vocabulary_database_schema.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN @vocabulary_database_schema.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM @target_database_schema.concept_phenotypes
    WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
        AND criteria = 'inclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC'))
--AND lower(c1.concept_name) != lower (c2.concept_name)
)

--list
/*SELECT *
FROM mappings
ORDER BY source_code,
         source_code_description,
         source_vocabulary_id,
         concept_id,
         concept_code,
         concept_name,
         concept_class_id,
         standard_concept,
         invalid_reason,
         domain_id,
         vocabulary_id*/

--markdown-friendly list
SELECT source_code_description || '|' ||
       source_code || '|' ||
       source_vocabulary_id || '|' ||
       concept_id || '|' ||
       concept_name || '|' ||
       concept_code || '|' ||
       concept_class_id || '|' ||
       --COALESCE (standard_concept, '') || '|' ||
       --COALESCE (invalid_reason, '') || '|' ||
       domain_id || '|' ||
       vocabulary_id
FROM mappings
ORDER BY source_code,
         source_code_description,
         source_vocabulary_id,
         concept_id,
         concept_code,
         concept_name,
         concept_class_id,
         standard_concept,
         invalid_reason,
         domain_id,
         vocabulary_id
;

--reset uncovered concept list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
    AND criteria = 'not_mapped'
;

--searching for uncovered concepts in Standard and Source_vocabularies
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Chronic lung disease, not asthma (all but acute)',
       'not_mapped',
       c.*
FROM @vocabulary_database_schema.concept c

WHERE (
        --To select the specific codes in specific vocabularies
        --(c.concept_code ~* '^00000|^00000|^00000' AND c.vocabulary_id IN (/*'EDI'*//*, 'KCD7'*/)  ) OR

        --Mask to detect uncovered concepts
        (c.concept_name ~* 'Chronic lung|Chronic pulmonary'

        --Masks to exclude
        AND c.concept_name !~* 'pulmonary embolism|cosis|mosis|heart'

        AND c.domain_id IN ('Condition', 'Observation'/*,'Procedure'*/ /*,'Measurement'*/) --adjust Domains of interest

        AND c.concept_class_id NOT IN ('Substance', 'Organism', 'LOINC Component', 'LOINC System', 'Qualifier Value', 'Answer'/*, 'Morph Abnormality'*/) --exclude useless concept_classes

        AND c.vocabulary_id NOT IN ('MedDRA', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC') --exclude useless vocabularies
        AND NOT (c.vocabulary_id = 'SNOMED' AND c.invalid_reason IS NOT NULL) --exclude SNOMED invalid concepts
        AND NOT (c.concept_class_id ~* 'Hierarchy|chapter' AND c.vocabulary_id NOT IN ('EDI', 'KCD7')) --exclude hierarchical concept_classes
        AND NOT (c.vocabulary_id = 'ICD10CM' AND c.valid_end_date < to_date('20151001', 'YYYYMMDD')) --exclude pre-release ICD10CM codes
        )
    )
    AND NOT EXISTS ( --exclude what is already mapped to Included/Excluded parents (except 'EDI', 'KCD7')
            SELECT 1
            FROM @vocabulary_database_schema.concept_ancestor ca1
            JOIN @vocabulary_database_schema.concept c1
                ON ca1.descendant_concept_id = c1.concept_id
            JOIN @vocabulary_database_schema.concept_relationship cr1
                ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
            JOIN @vocabulary_database_schema.concept c2
                ON cr1.concept_id_1 = c2.concept_id

            WHERE ca1.ancestor_concept_id IN (
                SELECT concept_id
                FROM @target_database_schema.concept_phenotypes
                WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
                    AND criteria IN ('inclusion', 'exclusion')
                    AND concept_id IS NOT NULL
                    AND criteria IS NOT NULL
                )
                AND c2.vocabulary_id NOT IN ('EDI', 'KCD7')
                AND (c.concept_id = c1.concept_id OR c.concept_id = c2.concept_id)
        )
    AND NOT EXISTS ( --exclude what is already mapped to Included parents ('EDI', 'KCD7')
            SELECT 1
            FROM @vocabulary_database_schema.concept_ancestor ca1
            JOIN @vocabulary_database_schema.concept c1
                ON ca1.descendant_concept_id = c1.concept_id
            JOIN @vocabulary_database_schema.concept_relationship cr1
                ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
            JOIN @vocabulary_database_schema.concept c2
                ON cr1.concept_id_1 = c2.concept_id

            WHERE ca1.ancestor_concept_id IN (
                SELECT concept_id
                FROM @target_database_schema.concept_phenotypes
                WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
                    AND criteria IN ('inclusion')
                    AND concept_id IS NOT NULL
                    AND criteria IS NOT NULL
                )
                AND c2.vocabulary_id IN ('EDI', 'KCD7')
                AND (c.concept_id = c1.concept_id OR c.concept_id = c2.concept_id)
        )
;

--reset Standard concepts Excluded list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
    AND criteria = 'exclusion'
;

--List of Standard concepts Excluded
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Chronic lung disease, not asthma (all but acute)', 'exclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
--Put concept_ids here
44808497,	--	849571000000102	Condition	Acute bacterial laryngitis	SNOMED
4148242,	--	266403005	Condition	Acute chemical bronchitis	SNOMED
254062,	--	372146004	Condition	Acute chest syndrome	SNOMED
765385,	--	128431000119106	Condition	Acute chest syndrome due to sickle cell-hemoglobin C disease with crisis	SNOMED
4112924,	--	196077006	Condition	Acute dry pleurisy	SNOMED
4110359,	--	195667003	Condition	Acute follicular tonsillitis	SNOMED
4112678,	--	196021009	Condition	Acute pneumonitis due to chemical fumes	SNOMED
4055650,	--	196189005	Condition	Acute pulmonary insufficiency following nonthoracic surgery	SNOMED
4055481,	--	196188002	Condition	Acute pulmonary insufficiency following thoracic surgery	SNOMED
4110644,	--	196046009	Condition	Acute pulmonary radiation disease	SNOMED
260434,	--	196047000	Condition	Acute radiation pneumonitis	SNOMED
4006969,	--	111273006	Condition	Acute respiratory disease	SNOMED
4124544,	--	233760007	Condition	Acute silicosis	SNOMED
317009,	--	195967001	Condition	Asthma	SNOMED
4170900,	--	41997000	Condition	Asthmatic pulmonary alveolitis	SNOMED
252942,	--	233691007	Condition	Asthmatic pulmonary eosinophilia	SNOMED
4060429,	--	199293005	Condition	Disease of the respiratory system complicating pregnancy, childbirth and/or the puerperium	SNOMED
22350,	--	51599000	Condition	Edema of larynx	SNOMED
4279553,	--	367542003	Condition	Eosinophilic asthma	SNOMED
4094822,	--	262599003	Condition	Foreign body in respiratory tract	SNOMED
4274981,	--	65141002	Condition	Foreign body pneumonia	SNOMED
4248811,	--	408688009	Condition	Healthcare associated severe acute respiratory syndrome	SNOMED
37110135,	--	724229002	Condition	Infantile apnea	SNOMED
4132080,	--	127275008	Condition	Injury of respiratory system	SNOMED
4313254,	--	217810002	Condition	Interruption of respiration caused by foreign body in esophagus	SNOMED
437904,	--	406444002	Condition	Laryngeal spasm	SNOMED
46269779,	--	10676111000119102	Condition	Mild persistent asthma controlled co-occurrent with allergic rhinitis	SNOMED
46269782,	--	10676231000119102	Condition	Mild persistent asthma uncontrolled co-occurrent with allergic rhinitis	SNOMED
46269789,	--	10676671000119102	Condition	Moderate persistent asthma uncontrolled co-occurrent with allergic rhinitis	SNOMED
46269787,	--	10676591000119100	Condition	Moderate persistent controlled asthma co-occurrent with allergic rhinitis	SNOMED
4181199,	--	363225006	Condition	Neonatal respiratory system disorder	SNOMED
253796,	--	36118008	Condition	Pneumothorax	SNOMED
317109,	--	87317003	Condition	Respiratory arrest	SNOMED
4317540,	--	217809007	Condition	Respiratory compression caused by foreign body in esophagus	SNOMED
319138,	--	17849001	Condition	Respiratory condition of fetus OR newborn	SNOMED
4319691,	--	217808004	Condition	Respiratory obstruction due to foreign body in esophagus	SNOMED
4317284,	--	95431003	Condition	Respiratory tract hemorrhage	SNOMED
46269773,	--	10675631000119109	Condition	Severe persistent asthma controlled co-occurrent with allergic rhinitis	SNOMED
46269775,	--	10675711000119106	Condition	Severe persistent asthma uncontrolled co-occurrent with allergic rhinitis	SNOMED
4208282,	--	326542006	Condition	Traumatic atelectasis	SNOMED
4052557,	--	233648002	Condition	Traumatic chylothorax	SNOMED
4175167,	--	42458003	Condition	Traumatic hemothorax	SNOMED
4119436,	--	233731003	Condition	Traumatic pneumonia	SNOMED
4124541,	--	233746005	Condition	Traumatic rupture of diaphragm	SNOMED
42598711,	--	337641000009101	Condition	Acute bovine pulmonary emphysema AND oedema	SNOMED Veterinary
42572526 	--	280771000009103	Condition	Acute rhinitis	SNOMED Veterinary

    )
;

--List of Standard concepts Excluded for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
    AND criteria = 'exclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Excluded
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
    AND criteria = 'exclusion'
GROUP BY domain_id, concept_id, concept_name, concept_code, vocabulary_id
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Retrieve concepts from source vocabularies mapped to Standard concepts Excluded or any of its child
--Mapping list
with mappings as (

SELECT DISTINCT c1.domain_id,
                c1.concept_id,
                c1.concept_name,
                c1.vocabulary_id,
                c2.vocabulary_id as source_vocabulary_id,
                string_agg (DISTINCT c2.concept_code, '; ' ORDER BY c2.concept_code) as source_code
FROM @vocabulary_database_schema.concept_ancestor ca1
JOIN @vocabulary_database_schema.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN @vocabulary_database_schema.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN @vocabulary_database_schema.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM @target_database_schema.concept_phenotypes
    WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
        AND criteria = 'exclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC'))

GROUP BY    1,2,3,4,5
)

--list
/*SELECT domain_id, concept_id, concept_name, vocabulary_id, source_vocabulary_id, source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id*/

--markdown-friendly list
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || vocabulary_id || '|' || source_vocabulary_id || '|' || source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id
;

--Concepts from source vocabularies mapped to Standard concepts Excluded or any of its child
--Detailed Mapping list
with mappings as (

SELECT DISTINCT c2.concept_name as source_code_description,
                c2.concept_code as source_code,
                c2.vocabulary_id as source_vocabulary_id,
                c1.concept_id,
                c1.concept_code,
                c1.concept_name,
                c1.concept_class_id,
                c1.standard_concept,
                c1.invalid_reason,
                c1.domain_id,
                c1.vocabulary_id

FROM @vocabulary_database_schema.concept_ancestor ca1
JOIN @vocabulary_database_schema.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN @vocabulary_database_schema.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN @vocabulary_database_schema.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM @target_database_schema.concept_phenotypes
    WHERE phenotype = 'Chronic lung disease, not asthma (all but acute)'
        AND criteria = 'exclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC'))
--AND lower(c1.concept_name) != lower (c2.concept_name)
)

--list
/*SELECT *
FROM mappings
ORDER BY source_code,
         source_code_description,
         source_vocabulary_id,
         concept_id,
         concept_code,
         concept_name,
         concept_class_id,
         standard_concept,
         invalid_reason,
         domain_id,
         vocabulary_id*/

--markdown-friendly list
SELECT source_code_description || '|' ||
       source_code || '|' ||
       source_vocabulary_id || '|' ||
       concept_id || '|' ||
       concept_name || '|' ||
       concept_code || '|' ||
       concept_class_id || '|' ||
       --COALESCE (standard_concept, '') || '|' ||
       --COALESCE (invalid_reason, '') || '|' ||
       domain_id || '|' ||
       vocabulary_id
FROM mappings
ORDER BY source_code,
         source_code_description,
         source_vocabulary_id,
         concept_id,
         concept_code,
         concept_name,
         concept_class_id,
         standard_concept,
         invalid_reason,
         domain_id,
         vocabulary_id
;