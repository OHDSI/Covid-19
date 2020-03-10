--Renal disease

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
AND (CONCEPT_CODE LIKE '285.21%'
	 OR CONCEPT_CODE LIKE '403%'
	 OR CONCEPT_CODE LIKE '581%'
	 OR CONCEPT_CODE LIKE '582%'
	 OR CONCEPT_CODE LIKE '583%'
	 OR CONCEPT_CODE LIKE '585%'
	 OR CONCEPT_CODE LIKE '586%'
	 OR CONCEPT_CODE LIKE '587%'
	 OR CONCEPT_CODE LIKE '588.0%'
	 OR CONCEPT_CODE LIKE '588.1%'
	 OR CONCEPT_CODE LIKE '590.0%'
	 OR CONCEPT_CODE LIKE '593.8%'
	 OR CONCEPT_CODE LIKE 'V451%'
	 OR CONCEPT_CODE LIKE 'V56%')

) AS con_rel
LEFT JOIN @vocabulary_database_schema.concept
ON con_rel.concept_id = concept.concept_id
ORDER BY SOURCE_CODE ASC
;
