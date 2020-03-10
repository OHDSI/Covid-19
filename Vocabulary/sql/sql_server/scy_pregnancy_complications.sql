--Pregnancy complications

--AUTHOR: Seng Chan You<applegna@gmail.com>
--Date:2020-03-10
/*
Reference
Greenbaum, Adena H., Jufu Chen, Carrie Reed, Suzanne Beavers, David Callahan, Deborah Christensen, Lyn Finelli, and Alicia M. Fry. “Hospitalizations for Severe Lower Respiratory Tract Infections.” Pediatrics 134, no. 3 (September 2014): 546–54. https://doi.org/10.1542/peds.2014-0244.
*/
SELECT concept.domain_id, concept.concept_id, concept.concept_name, concept.vocabulary_id,
con_rel.source_vocabulary, con_rel.source_code, con_rel.source_concept_name,concept.standard_concept AS S
FROM
(SELECT rel.concept_id_2 AS concept_id, concept.concept_id AS source_concept_id, concept.concept_name AS source_concept_name, vocabulary_id AS source_vocabulary, concept_code AS source_code
FROM @vocabulary_database_schema.concept LEFT JOIN
	 @vocabulary_database_schema.concept_relationship AS rel
	 ON CONCEPT.concept_id=rel.concept_id_1
WHERE vocabulary_id = 'ICD9CM'
AND rel.relationship_id='Maps to'
AND rel.invalid_reason IS NULL
AND (CONCEPT_CODE IN ('640','640.01','640.03','640.8','640.81','640.83','640.9','640.91','640.93','641','641.01','641.03','641.1','641.11','641.13','641.2','641.21','641.23','641.3','641.31','641.33','641.8','641.81','641.83','641.9','641.91','641.93','642','642.01','642.02','642.03','642.04','642.1','642.11','642.12','642.13','642.14','642.2','642.21','642.22','642.23','642.24','642.3','642.31','642.32','642.33','642.34','642.4','642.41','642.42','642.43','642.44','642.5','642.51','642.52','642.53','642.54','642.6','642.61','642.62','642.63','642.64','642.7','642.71','642.72','642.73','642.74','642.9','642.91','642.92','642.93','642.94','643','643.01','643.03','643.1','643.11','643.13','643.2','643.21','643.23','643.8','643.81','643.83','643.9','643.91','643.93','644','644.03','644.1','644.13','644.2','644.21','645','645.01','645.03','645.1','645.11','645.13','645.2','645.21','645.23','646','646.01','646.03','646.1','646.11','646.12','646.13','646.14','646.2','646.21','646.22','646.23','646.24','646.3','646.31','646.33','646.4','646.41','646.42','646.43','646.44','646.5','646.51','646.52','646.53','646.54','646.6','646.61','646.62','646.63','646.64','646.7','646.71','646.73','646.8','646.81','646.82','646.83','646.84','646.9','646.91','646.93','647','647.01','647.02','647.03','647.04','647.1','647.11','647.12','647.13','647.14','647.2','647.21','647.22','647.23','647.24','647.3','647.31','647.32','647.33','647.34','647.4','647.41','647.42','647.43','647.44','647.5','647.51','647.52','647.53','647.54','647.6','647.61','647.62','647.63','647.64','647.8','647.81','647.82','647.83','647.84','647.9','647.91','647.92','647.93','647.94','648')
     OR CONCEPT_CODE LIKE '767%'
	 OR CONCEPT_CODE LIKE '768%'
	 OR CONCEPT_CODE LIKE '771.0%'
	 )
) AS con_rel
LEFT JOIN @vocabulary_database_schema.concept
ON con_rel.concept_id = concept.concept_id
ORDER BY SOURCE_CODE ASC
;
