--Conflict between Standard concepts Included and Standard concepts Excluded
SELECT cp1.*, cp2.*
FROM @target_database_schema.concept_phenotypes cp1

JOIN @vocabulary_database_schema.concept_ancestor ca
    ON cp1.concept_id = ca.ancestor_concept_id

JOIN @target_database_schema.concept_phenotypes cp2
    ON ca.descendant_concept_id = cp2.concept_id
        AND cp2.criteria = 'inclusion'
        AND cp2.phenotype = cp1.phenotype

WHERE cp1.criteria = 'exclusion'
;

--Check of all descendants for target ancestor
SELECT ca.ancestor_concept_id, ca.max_levels_of_separation, c.*
FROM @vocabulary_database_schema.concept_ancestor ca
JOIN @vocabulary_database_schema.concept c
ON ca.descendant_concept_id = c.concept_id
WHERE ca.ancestor_concept_id IN (4058031)
ORDER BY ca.ancestor_concept_id, ca.max_levels_of_separation
;

--Unexpected vocabularies
SELECT *
FROM @target_database_schema.concept_phenotypes cp
WHERE cp.vocabulary_id IN ('SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS')
;

--Delete Unexpected vocabularies from concept_phenotypes
DELETE
FROM @target_database_schema.concept_phenotypes cp
WHERE cp.vocabulary_id IN ('SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS')
    AND cp.criteria = 'not_mapped'
;

--List for mapping review
SELECT DISTINCT cp.phenotype, c.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept_ancestor ca
    ON cp.concept_id = ca.ancestor_concept_id
JOIN @vocabulary_database_schema.concept_relationship cr
    ON ca.descendant_concept_id = cr.concept_id_2
        AND cr.invalid_reason IS NULL
        AND cr.relationship_id = 'Maps to'
JOIN @vocabulary_database_schema.concept c
    ON cr.concept_id_1 = c.concept_id
        AND c.vocabulary_id NOT IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon')
        AND c.standard_concept IS NULL

WHERE cp.criteria IN ('inclusion', 'exclusion')
    AND cp.phenotype IN ('')
;


--List for mapping review
--Portion 1
DROP TABLE @target_database_schema.mapping_review_portion1;

CREATE TABLE @target_database_schema.mapping_review_portion1 AS (
SELECT DISTINCT cp.phenotype, c.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept_ancestor ca
    ON cp.concept_id = ca.ancestor_concept_id
JOIN @vocabulary_database_schema.concept_relationship cr
    ON ca.descendant_concept_id = cr.concept_id_2
        AND cr.invalid_reason IS NULL
        AND cr.relationship_id = 'Maps to'
JOIN @vocabulary_database_schema.concept c
    ON cr.concept_id_1 = c.concept_id
        AND c.vocabulary_id NOT IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon')
        AND c.standard_concept IS NULL

WHERE cp.criteria IN ('inclusion', 'exclusion')
    AND cp.phenotype IN ('Influenza',
                         'Influenza (complicated)',
                         'Acute respiratory distress syndrome (ARDS)',
                         'Pneumonia',
                         'Intubation',
                         'Non-invasive ventilation',
                         'Extracorporeal membrane oxygenation (ECMO)')
)
;

--List for mapping
SELECT DISTINCT cp.phenotype, c.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept c
    ON cp.concept_id = c.concept_id

WHERE cp.criteria IN ('not_mapped')
    AND c.standard_concept IS NULL
    AND c.vocabulary_id NOT IN ('LOINC', 'SNOMED')
    AND cp.phenotype IN ('')
;


--List for mapping
--Portion 1
DROP TABLE @target_database_schema.mapping_portion1;

CREATE TABLE @target_database_schema.mapping_portion1 AS (
SELECT DISTINCT cp.phenotype, c.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept c
    ON cp.concept_id = c.concept_id

WHERE cp.criteria IN ('not_mapped')
    AND c.standard_concept IS NULL
    AND c.vocabulary_id NOT IN ('LOINC', 'SNOMED')
    AND cp.phenotype IN ('Influenza',
                         'Influenza (complicated)',
                         'Acute respiratory distress syndrome (ARDS)',
                         'Pneumonia',
                         'Intubation',
                         'Non-invasive ventilation',
                         'Extracorporeal membrane oxygenation (ECMO)')

    AND EXISTS (select 1 from @vocabulary_database_schema.concept_relationship cr where cr.concept_id_1 = c.concept_id and cr.relationship_id = 'Maps to' and cr.invalid_reason is null)

)
;