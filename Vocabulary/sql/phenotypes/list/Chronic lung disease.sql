--reset phenotype concept list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease'
;

--reset Standard concepts Included list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease'
    AND criteria = 'inclusion'
;

--List of Standard concepts Included
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Chronic lung disease', 'inclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
--Put concept_ids here
4199450,	--	51068008	Condition	Adult bronchiectasis	SNOMED
317009,	--	195967001	Condition	Asthma	SNOMED
4308356,	--	390798007	Condition	Asthma finding	SNOMED
4170900,	--	41997000	Condition	Asthmatic pulmonary alveolitis	SNOMED
4048081,	--	123713005	Condition	Chronic atelectasis	SNOMED
42539089,	--	737180005	Condition	Chronic bronchiolitis	SNOMED
255841,	--	63480004	Condition	Chronic bronchitis	SNOMED
4275496,	--	36599006	Condition	Chronic fibrosis of lung	SNOMED
4084689,	--	18354001	Condition	Chronic induration of lung	SNOMED
762964,	--	434301000124102	Condition	Chronic interstitial lung disease	SNOMED
45767051,	--	704345008	Condition	Chronic interstitial pneumonia	SNOMED
4186898,	--	413839001	Condition	Chronic lung disease	SNOMED
4289844,	--	37180002	Condition	Chronic nonspecific lung disease	SNOMED
255573,	--	13645005	Condition	Chronic obstructive lung disease	SNOMED
46269693,	--	102361000119104	Condition	Chronic pneumonia	SNOMED
4274468,	--	63841001	Condition	Chronic pulmonary congestion	SNOMED
4188331,	--	46847001	Condition	Chronic pulmonary edema	SNOMED
252348,	--	196049002	Condition	Chronic pulmonary radiation disease	SNOMED
4333202,	--	432958009	Condition	Chronic rejection of lung transplant	SNOMED
316452,	--	69454006	Condition	Chronic respiratory condition due to fumes AND/OR vapors	SNOMED
4112835,	--	196025000	Condition	Chronic respiratory conditions due to chemical fumes	SNOMED
255362,	--	50943000	Condition	Congenital anomaly of bronchus	SNOMED
257094,	--	47147007	Condition	Congenital anomaly of lung	SNOMED
4116317,	--	302913000	Condition	Diffuse pulmonary calcinosis	SNOMED
4120270,	--	233717003	Condition	Diffuse pulmonary neurofibromatosis	SNOMED
4279553,	--	367542003	Condition	Eosinophilic asthma	SNOMED
4123254,	--	233690008	Condition	Factitious asthma	SNOMED
46273640,	--	328641000119109	Condition	Genetic disorder of surfactant dysfunction	SNOMED
4103099,	--	192658007	Condition	GIP - Giant cell interstitial pneumonitis	SNOMED
37110292,	--	724500003	Condition	Idiopathic chronic eosinophilic pneumonia	SNOMED
438782,	--	40527005	Condition	Idiopathic pulmonary hemosiderosis	SNOMED
440748,	--	77690003	Condition	Interstitial emphysema of lung	SNOMED
4140605,	--	427123006	Condition	Interstitial lung disease due to collagen vascular disease	SNOMED
46272927,	--	711379004	Condition	Interstitial lung disease due to connective tissue disease	SNOMED
44804734,	--	781711000000106	Condition	Interstitial lung disease due to connective tissue disease	SNOMED
42539687,	--	737182002	Condition	Interstitial lung disease due to granulomatous disease	SNOMED
42537658,	--	737183007	Condition	Interstitial lung disease due to metabolic disease	SNOMED
42537657,	--	737181009	Condition	Interstitial lung disease due to systemic disease	SNOMED
46270493,	--	328661000119108	Condition	Interstitial lung disease of childhood	SNOMED
4199518,	--	432066002	Condition	Lung disorder due to autoimmune disorder	SNOMED
37208102,	--	460561000124109	Condition	PF-ILD-progressive fibrosing interstitial lung disease	SNOMED
4102140,	--	28122003	Condition	Pulmonary eosinophilic granuloma	SNOMED
4174275,	--	277844007	Condition	Pulmonary lymphangioleiomyomatosis	SNOMED
2101899,	--	1039F	Observation	Intermittent asthma (Asthma)	CPT4
2101898,	--	1038F	Observation	Persistent asthma (mild, moderate or severe) (Asthma)	CPT4
4293734,	--	401193004	Observation	Asthma confirmed	SNOMED
4235703 	--	406162001	Observation	Asthma management	SNOMED

    )
;

--List of Standard concepts Included for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease'
    AND criteria = 'inclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Included
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease'
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
    WHERE phenotype = 'Chronic lung disease'
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
    WHERE phenotype = 'Chronic lung disease'
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
WHERE phenotype = 'Chronic lung disease'
    AND criteria = 'not_mapped'
;

--searching for uncovered concepts in Standard and Source_vocabularies
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Chronic lung disease',
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
                WHERE phenotype = 'Chronic lung disease'
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
                WHERE phenotype = 'Chronic lung disease'
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
WHERE phenotype = 'Chronic lung disease'
    AND criteria = 'exclusion'
;

--List of Standard concepts Excluded
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Chronic lung disease', 'exclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
--Put concept_ids here
4004124,	--	204533007	Condition	Agenesis of larynx, trachea and bronchus	SNOMED
4036799,	--	162660004	Condition	Asthma resolved	SNOMED
37312028,	--	788869006	Condition	Atresia of esophagus co-occurrent with esophagobronchial fistula	SNOMED
4176794,	--	363028003	Condition	Congenital anomaly of cardiovascular structure of trunk	SNOMED
36714287,	--	719452004	Condition	Congenital bronchobiliary fistula	SNOMED
4188309,	--	41279003	Condition	Congenital esophagobronchial fistula	SNOMED
37204210,	--	782722002	Condition	Global developmental delay, lung cysts, overgrowth, Wilms tumor syndrome	SNOMED
44794468,	--	397981000000105	Condition	[X]Other respiratory diseases principally affecting the interstitium	SNOMED
44796138	--	419331000000108	Condition	[X]Other specified interstitial pulmonary diseases	SNOMED

    )
;

--List of Standard concepts Excluded for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease'
    AND criteria = 'exclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Excluded
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Chronic lung disease'
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
    WHERE phenotype = 'Chronic lung disease'
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
    WHERE phenotype = 'Chronic lung disease'
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