-- Retrieve the list of Standard concepts of interest
with list as (
SELECT DISTINCT
                domain_id,
                concept_id,
                concept_name,
                vocabulary_id

FROM devv5.concept c

WHERE c.concept_id IN (
--Put concept_ids here

    )
)

--Markdown-friendly list of concepts
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || vocabulary_id
FROM list
ORDER BY domain_id, vocabulary_id, concept_name, concept_id

--List of concepts
/*SELECT concept_id, null, domain_id, concept_name, vocabulary_id
FROM list
ORDER BY domain_id, vocabulary_id, concept_name, concept_id*/
;



-- Retrieve concepts from source vocabularies mapped to desired standard concept or any of its child
-- Mapping list
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
--Standard concept_ids of interest

    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'MeSH'))

GROUP BY    1,2,3,4,5
)

--to check DISTINCT vocabulary list (to exclude unwanted)
/*SELECT DISTINCT source_vocabulary_id
FROM mappings*/


--markdown-friendly list
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || vocabulary_id || '|' || source_vocabulary_id || '|' || source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id

--list
/*SELECT domain_id, concept_id, concept_name, vocabulary_id, source_vocabulary_id, source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id*/
;



--The list for mapping review
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
--Standard concept_ids of interest


    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'MeSH'))
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


-- searching for uncovered concepts in Standard and source_vocabularies
SELECT *
FROM devv5.concept c
--Mask to detect uncovered concepts
WHERE concept_name ~* 'influenza'
--Masks to exclude
  AND concept_name !~* 'Haemophilus'

  AND c.domain_id IN ('Condition', 'Observation')

  AND c.concept_class_id NOT IN ('Substance', 'Organism')
  AND c.vocabulary_id NOT IN ('MedDRA', 'SNOMED Veterinary')


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
--Standard concept_ids of interest



    )
--AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
--AND NOT (c2.vocabulary_id IN ('SNOMED', 'MeSH'))

AND (c.concept_id = c1.concept_id OR c.concept_id = c2.concept_id)

)

;

--Review of searching results
-- Retrieve the list of Standard concepts of interest
with list as (
SELECT DISTINCT
                domain_id,
                concept_id,
                concept_name,
                vocabulary_id

FROM devv5.concept c

WHERE c.concept_id IN (

--concept_ids from exclusion list

    )
)

--Markdown-friendly list of concepts
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || vocabulary_id
FROM list
ORDER BY domain_id, vocabulary_id, concept_name, concept_id

--List of concepts
/*SELECT concept_id, null, domain_id, concept_name, vocabulary_id
FROM list
ORDER BY domain_id, vocabulary_id, concept_name, concept_id*/
;



-- Retrieve concepts from source vocabularies mapped to desired standard concept or any of its child
-- Mapping list
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

--Standard concept_ids of interest


    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'MeSH'))

GROUP BY    1,2,3,4,5
)

--to check DISTINCT vocabulary list (to exclude unwanted)
/*SELECT DISTINCT source_vocabulary_id
FROM mappings*/


--markdown-friendly list
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || vocabulary_id || '|' || source_vocabulary_id || '|' || source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id

--list
/*SELECT domain_id, concept_id, concept_name, vocabulary_id, source_vocabulary_id, source_code
FROM mappings
ORDER BY domain_id, vocabulary_id, concept_name, concept_id, source_vocabulary_id*/
;



--The list for mapping review
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

--Standard concept_ids of interest



    )
AND ca1.descendant_concept_id != c2.concept_id

--to add/exclude some vocabularies
--AND (c2.vocabulary_id like '%ICD%' OR c2.vocabulary_id like '%KCD%')
AND NOT (c2.vocabulary_id IN ('SNOMED', 'MeSH'))
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