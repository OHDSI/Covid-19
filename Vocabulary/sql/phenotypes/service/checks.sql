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