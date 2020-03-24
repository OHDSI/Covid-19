--reset phenotype concept list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Ventilator care'
;

--reset Standard concepts Included list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Ventilator care'
    AND criteria = 'inclusion'
;

--List of Standard concepts Included
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Ventilator care', 'inclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
--Put concept_ids here
4232550,	--	439887005	Observation	Home visit for mechanical ventilation care	SNOMED
4237618,	--	409025002	Observation	Ventilator care	SNOMED
44509482,	--	E85.8	Procedure	Other specified ventilation support	OPCS4
4230167,	--	40617009	Procedure	Artificial respiration	SNOMED
4080957,	--	182686001	Procedure	Endotracheal respiratory assistance	SNOMED
4235361,	--	438603002	Procedure	Hyperventilation therapy for traumatic brain injury	SNOMED
4332501,	--	430191008	Procedure	Management of noninvasive mechanical ventilation	SNOMED
37206832,	--	787180006	Procedure	Mechanical insufflation exsufflation	SNOMED
4251737,	--	410210009	Procedure	Ventilator care management	SNOMED
44791135	--	231821000000109	Procedure	Ventilatory support	SNOMED

    )
;

--List of Standard concepts Included for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Ventilator care'
    AND criteria = 'inclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Included
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Ventilator care'
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
    WHERE phenotype = 'Ventilator care'
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
    WHERE phenotype = 'Ventilator care'
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
WHERE phenotype = 'Ventilator care'
    AND criteria = 'not_mapped'
;

--searching for uncovered concepts in Standard and Source_vocabularies
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Ventilator care',
       'not_mapped',
       c.*
FROM @vocabulary_database_schema.concept c

WHERE (
        --To select the specific codes in specific vocabularies
        (c.concept_code ~* '^M5858' AND c.vocabulary_id IN ('EDI')  ) OR

        --Mask to detect uncovered concepts
        (c.concept_name ~* 'Artificial ventilation|Mechanical ventilation|artificial breathing|ventilator care|ventilator management|ventilator'

        --Masks to exclude
        AND c.concept_name !~* 'Assessment|imaging|Document|home|Complication|associated'

        AND c.domain_id IN ('Condition', 'Observation','Procedure' /*,'Measurement'*/) --adjust Domains of interest

        AND c.concept_class_id NOT IN ('Substance', 'Organism', 'LOINC Component', 'LOINC System', 'Qualifier Value', 'Survey'/*, 'Morph Abnormality'*/) --exclude useless concept_classes

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
                WHERE phenotype = 'Ventilator care'
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
                WHERE phenotype = 'Ventilator care'
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
WHERE phenotype = 'Ventilator care'
    AND criteria = 'exclusion'
;

--List of Standard concepts Excluded
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Ventilator care', 'exclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
--Put concept_ids here
4031379,	--	129896002	Condition	Artificial ventilation finding	SNOMED
40481547,	--	444932008	Condition	Dependence on ventilator	SNOMED
4021786,	--	225627007	Condition	Fear of disconnection from ventilator	SNOMED
4232891,	--	404997003	Observation	Mechanical ventilation response	SNOMED
4219858,	--	397846002	Observation	Problem with patient ventilator	SNOMED
4353715,	--	250870006	Observation	Ventilator finding	SNOMED
2745440,	--	0BH13EZ	Procedure	Insertion of Endotracheal Airway into Trachea, Percutaneous Approach	ICD10PCS
2745444,	--	0BH17EZ	Procedure	Insertion of Endotracheal Airway into Trachea, Via Natural or Artificial Opening	ICD10PCS
2745447,	--	0BH18EZ	Procedure	Insertion of Endotracheal Airway into Trachea, Via Natural or Artificial Opening Endoscopic	ICD10PCS
4348300,	--	243180002	Procedure	Expired air ventilation	SNOMED
4107247,	--	30050007	Procedure	Inhalation anesthesia, machine system, semi-closed, no rebreathing of primary agent	SNOMED
44808555,	--	859311000000101	Procedure	Provision of mechanical ventilator	SNOMED
4006318,	--	11140008	Procedure	Respiratory assist, manual	SNOMED
4254108,	--	74596007	Procedure	Resuscitation with artificial respiration	SNOMED
4259233,	--	410208007	Procedure	Ventilator care assessment	SNOMED
4254905,	--	410209004	Procedure	Ventilator care education	SNOMED
4072633	--	243174005	Procedure	Weaning from mechanically assisted ventilation	SNOMED


    )
;

--List of Standard concepts Excluded for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Ventilator care'
    AND criteria = 'exclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Excluded
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Ventilator care'
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
    WHERE phenotype = 'Ventilator care'
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
    WHERE phenotype = 'Ventilator care'
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