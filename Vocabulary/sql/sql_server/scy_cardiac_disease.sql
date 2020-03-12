--CARDIAC DISEASE

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
AND (CONCEPT_CODE LIKE '093%'
	 OR CONCEPT_CODE LIKE '112.81%'
	 OR CONCEPT_CODE LIKE '130.3%'
	 OR CONCEPT_CODE LIKE '391%'
	 OR CONCEPT_CODE LIKE '392%'
	 OR CONCEPT_CODE LIKE '393%'
	 OR CONCEPT_CODE LIKE '394%'
	 OR CONCEPT_CODE LIKE '395%'
	 OR CONCEPT_CODE LIKE '396%'
	 OR CONCEPT_CODE LIKE '397%'
	 OR CONCEPT_CODE LIKE '398%'
	 OR CONCEPT_CODE LIKE '402%'
	 OR CONCEPT_CODE LIKE '404%'
	 OR CONCEPT_CODE LIKE '410%'
	 OR CONCEPT_CODE LIKE '411%'
	 OR CONCEPT_CODE LIKE '412%'
	 OR CONCEPT_CODE LIKE '413%'
	 OR CONCEPT_CODE LIKE '414%'
	 OR CONCEPT_CODE LIKE '415%'
	 OR CONCEPT_CODE LIKE '416%'
	 OR CONCEPT_CODE LIKE '417%'
	 OR CONCEPT_CODE LIKE '421%'
	 OR CONCEPT_CODE LIKE '423%'
	 OR CONCEPT_CODE LIKE '424%'
	 OR CONCEPT_CODE LIKE '425%'
	 OR CONCEPT_CODE LIKE '427%'
	 OR CONCEPT_CODE LIKE '428%'
	 OR CONCEPT_CODE LIKE '429%'
	 OR CONCEPT_CODE LIKE '440%'
	 OR CONCEPT_CODE LIKE '442%'
	 OR CONCEPT_CODE LIKE '443%'
	 OR CONCEPT_CODE LIKE '444%'
	 OR CONCEPT_CODE LIKE '446%'
	 OR CONCEPT_CODE LIKE '447%'
	 OR CONCEPT_CODE LIKE '745%'
	 OR CONCEPT_CODE LIKE '746%'
	 OR CONCEPT_CODE LIKE '747%'
	 OR CONCEPT_CODE LIKE '997.1%'
	 OR CONCEPT_CODE LIKE 'V42.1%'
	 OR CONCEPT_CODE LIKE 'V43.3%'
	 OR CONCEPT_CODE LIKE 'V45.0%'
	 OR CONCEPT_CODE LIKE 'V45.81%'
	 OR CONCEPT_CODE LIKE 'V45.82%')
) AS con_rel
LEFT JOIN @vocabulary_database_schema.concept
ON con_rel.concept_id = concept.concept_id
WHERE con_rel.concept_id != 4215685
ORDER BY SOURCE_CODE ASC
;
--Observation	4215685		Past history of procedure  should be removed
