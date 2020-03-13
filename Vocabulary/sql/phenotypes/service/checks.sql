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