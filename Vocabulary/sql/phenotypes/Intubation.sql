--reset phenotype concept list
DELETE FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'Intubation'
;


--List of Standard concepts Included
INSERT INTO dev_covid19.concept_phenotypes
SELECT 'Intubation', 'inclusion', c.*
FROM devv5.concept c
WHERE c.concept_id IN (
--Put concept_ids here
40487536,	--	447996002	Procedure	Intubation of respiratory tract	SNOMED
765576 	--	450601000124103	Procedure	Orotracheal intubation using bougie device	SNOMED

    )
;

--List of Standard concepts Included for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'Intubation'
    AND criteria = 'inclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Included
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'Intubation'
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
FROM devv5.concept_ancestor ca1
JOIN devv5.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN devv5.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN devv5.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM dev_covid19.concept_phenotypes
    WHERE phenotype = 'Intubation'
        AND criteria = 'inclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS'))

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

FROM devv5.concept_ancestor ca1
JOIN devv5.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN devv5.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN devv5.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM dev_covid19.concept_phenotypes
    WHERE phenotype = 'Intubation'
        AND criteria = 'inclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS'))
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


--searching for uncovered concepts in Standard and Source_vocabularies
INSERT INTO dev_covid19.concept_phenotypes
SELECT 'Intubation', 'not_mapped',
       c.*
FROM devv5.concept c
--Mask to detect uncovered concepts
WHERE concept_name ~* 'Intubation'
--Masks to exclude
  AND concept_name !~* 'colon|ileum|duodenal|duct|ureteric|stent|lacrimal|bowel|esophag|duoden|gastrointestinal|rectum|stomach|ileum|jejunum|intestin|Conjunctiva|Gastric|eustachian'

    AND c.domain_id IN ('Procedure' /*,'Measurement'*/)

    AND c.concept_class_id NOT IN ('Substance', 'Organism', 'LOINC Component')

    AND c.vocabulary_id NOT IN ('MedDRA', 'SNOMED Veterinary', 'MeSH', 'OXMIS')
    AND NOT (c.vocabulary_id = 'SNOMED' AND c.invalid_reason IS NOT NULL)
    AND c.concept_class_id !~* 'Hierarchy|chapter'
    AND NOT (c.vocabulary_id = 'ICD10CM' AND c.valid_end_date < to_date('20151001', 'YYYYMMDD'))

    AND NOT EXISTS (
        SELECT 1
        FROM devv5.concept_ancestor ca1
        JOIN devv5.concept c1
            ON ca1.descendant_concept_id = c1.concept_id
        JOIN devv5.concept_relationship cr1
            ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
        JOIN devv5.concept c2
            ON cr1.concept_id_1 = c2.concept_id

        WHERE ca1.ancestor_concept_id IN (
            SELECT concept_id
            FROM dev_covid19.concept_phenotypes
            WHERE phenotype = 'Intubation'
                AND criteria IN ('inclusion', 'exclusion')
                AND concept_id IS NOT NULL
                AND criteria IS NOT NULL
            )
            AND (c.concept_id = c1.concept_id OR c.concept_id = c2.concept_id)
)
;

--List of Standard concepts Excluded
INSERT INTO dev_covid19.concept_phenotypes
SELECT 'Intubation', 'exclusion', c.*
FROM devv5.concept c
WHERE c.concept_id IN (
--Put concept_ids here
4337047, --Procedure	Insertion of tracheostomy tube	SNOMED
4331311, --Procedure	Changing tracheostomy tube	SNOMED
2108642, --Procedure	Glossectomy; complete or total, with or without tracheostomy, with unilateral radical neck dissection	CPT4
2108641, --Procedure	Glossectomy; complete or total, with or without tracheostomy, without radical neck dissection	CPT4
4337046, --Procedure	Minitrach insertion	SNOMED
2106470, --Procedure	Tracheotomy tube change prior to establishment of fistula tract	CPT4
4149878, --Procedure	Transglottic catheterization of trachea	SNOMED
2106642, --Procedure	Transtracheal (percutaneous) introduction of needle wire dilator/stent or indwelling tube for oxygen therapy	CPT4
4337048 --Procedure	Insertion of tracheal T-tube	SNOMED
    )
;

--List of Standard concepts Excluded for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'Intubation'
    AND criteria = 'exclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Excluded
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'Intubation'
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
FROM devv5.concept_ancestor ca1
JOIN devv5.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN devv5.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN devv5.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM dev_covid19.concept_phenotypes
    WHERE phenotype = 'Intubation'
        AND criteria = 'exclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS'))

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

FROM devv5.concept_ancestor ca1
JOIN devv5.concept c1
    ON ca1.descendant_concept_id = c1.concept_id
JOIN devv5.concept_relationship cr1
    ON ca1.descendant_concept_id = cr1.concept_id_2 AND cr1.relationship_id = 'Maps to' AND cr1.invalid_reason IS NULL
JOIN devv5.concept c2
    ON cr1.concept_id_1 = c2.concept_id
WHERE ca1.ancestor_concept_id IN (
    SELECT concept_id
    FROM dev_covid19.concept_phenotypes
    WHERE phenotype = 'Intubation'
        AND criteria = 'exclusion'
        AND concept_id IS NOT NULL
    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS'))
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