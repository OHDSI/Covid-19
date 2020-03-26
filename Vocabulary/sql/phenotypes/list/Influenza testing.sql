--reset phenotype concept list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Influenza testing'
;

--reset Standard concepts Included list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Influenza testing'
    AND criteria = 'inclusion'
;

--List of Standard concepts Included
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Influenza testing', 'inclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
2213094,	--	87400	Measurement	Infectious agent antigen detection by immunoassay technique, (eg, enzyme immunoassay [EIA], enzyme-linked immunosorbent assay [ELISA], immunochemiluminometric assay [IMCA]) qualitative or semiquantitative, multiple-step method; Influenza, A or B, each	CPT4
2213181,	--	87804	Measurement	Infectious agent antigen detection by immunoassay with direct optical observation; Influenza	CPT4
2213063,	--	87276	Measurement	Infectious agent antigen detection by immunofluorescent technique; influenza A virus	CPT4
2213062,	--	87275	Measurement	Infectious agent antigen detection by immunofluorescent technique; influenza B virus	CPT4
40757077,	--	87502	Measurement	Infectious agent detection by nucleic acid (DNA or RNA); influenza virus, for multiple types or sub-types, includes multiplex reverse transcription, when performed, and multiplex amplified probe technique, first 2 types or sub-types	CPT4
40756898,	--	87501	Measurement	Infectious agent detection by nucleic acid (DNA or RNA); influenza virus, includes reverse transcription, when performed, and amplified probe technique, each type or subtype	CPT4
37066972,	--	LP379343-9	Measurement	Equine influenza virus A1 Ab | Serum | Microbiology	LOINC
3001703,	--	23102-7	Measurement	Equine influenza virus A1 Ag [Titer] in Unspecified specimen by Hemagglutination inhibition	LOINC
3016424,	--	31821-2	Measurement	Equine influenza virus A1 Ag [Units/volume] in Unspecified specimen	LOINC
3002696,	--	15470-8	Measurement	Equine influenza virus A2 Ab [Presence] in Serum	LOINC
3000619,	--	23103-5	Measurement	Equine influenza virus A2 Ab [Presence] in Serum by Complement fixation	LOINC
3023674,	--	22303-2	Measurement	Equine influenza virus A2 Ab [Titer] in Serum	LOINC
3001047,	--	15471-6	Measurement	Equine influenza virus A2 Ab [Titer] in Serum by Hemagglutination inhibition	LOINC
3007341,	--	31380-9	Measurement	Equine influenza virus A2 Ab [Units/volume] in Serum	LOINC
3038149,	--	23104-3	Measurement	Equine influenza virus A2 Ag [Titer] in Unspecified specimen by Hemagglutination inhibition	LOINC
3016676,	--	31822-0	Measurement	Equine influenza virus A2 Ag [Units/volume] in Unspecified specimen	LOINC
3017256,	--	31823-8	Measurement	Equine influenza virus Ag [Presence] in Nose	LOINC
3020370,	--	15472-4	Measurement	Equine influenza virus Ag [Presence] in Nose by Immunoassay	LOINC
40653953,	--	LG32757-3	Measurement	Influenza virus	LOINC
40655681,	--	LG34020-4	Measurement	Influenza virus A Ag|PrThr|Sys:ANYResp	LOINC
40655680,	--	LG34146-7	Measurement	Influenza virus A & B Ag|Prid|Sys:ANYResp	LOINC
40655687,	--	LG34021-2	Measurement	Influenza virus A+B Ag|PrThr|Sys:ANYResp	LOINC
40655688,	--	LG34022-0	Measurement	Influenza virus A+B+C Ag|PrThr|Sys:ANYResp	LOINC
40655682,	--	LG34094-9	Measurement	Influenza virus A H1 2009 pandemic RNA|PrThr|Sys:ANYResp	LOINC
40655683,	--	LG34092-3	Measurement	Influenza virus A H1 RNA|PrThr|Sys:ANYResp	LOINC
40655684,	--	LG34093-1	Measurement	Influenza virus A H3 RNA|PrThr|Sys:ANYResp	LOINC
40655685,	--	LG34153-3	Measurement	Influenza virus A H5 Asian RNA|ThreshNum|Sys:ANYResp	LOINC
40655686,	--	LG34064-2	Measurement	Influenza virus A RNA|PrThr|Sys:ANYResp	LOINC
37080282,	--	LG50856-0	Measurement	Influenza virus A subtype|Prid|Sys:ANYResp	LOINC
40655689,	--	LG34023-8	Measurement	Influenza virus B Ag|PrThr|Sys:ANYResp	LOINC
40655690,	--	LG34065-9	Measurement	Influenza virus B RNA|PrThr|Sys:ANYResp	LOINC
40655691,	--	LG34086-5	Measurement	Influenza virus identified|Prid|Sys:ANYResp	LOINC
37050279,	--	LP379495-7	Measurement	Porcine influenza virus A Ab | Serum | Microbiology	LOINC
3002988,	--	23769-3	Measurement	Porcine influenza virus A Ag [Presence] in Tissue by Immune stain	LOINC
3026510,	--	23437-7	Measurement	Swine influenza virus Ab [Presence] in Serum	LOINC
3027889,	--	23438-5	Measurement	Swine influenza virus Ab [Presence] in Serum by Hemagglutination inhibition	LOINC
3002646,	--	23782-6	Measurement	Swine influenza virus Ag [Presence] in Tissue by Immune stain	LOINC
3003682,	--	23781-8	Measurement	Swine influenza virus Ag [Presence] in Tissue by Immunofluorescence	LOINC
44789502,	--	204271000000104	Measurement	Avian infl virus nucl acid det	SNOMED
36676235,	--	772835009	Measurement	Detection of Influenza A virus using PCR - polymerase chain reaction technique	SNOMED
4039357,	--	118089005	Measurement	Influenza A and B virus antigen assay	SNOMED
4201049,	--	315142009	Measurement	Influenza A antibody level	SNOMED
4039358,	--	118090001	Measurement	Influenza A, B, and C virus antigen assay	SNOMED
44806470,	--	801631000000107	Measurement	Influenza A nucleic acid detection	SNOMED
4044987,	--	122349003	Measurement	Influenza A virus antigen assay	SNOMED
44805899,	--	819431000000106	Measurement	Influenza A virus IgG antibody measurement	SNOMED
45757528,	--	181000124108	Measurement	Influenza A virus present	SNOMED
4196405,	--	315143004	Measurement	Influenza B antibody level	SNOMED
44807860,	--	838281000000105	Measurement	Influenza B nucleic acid detection	SNOMED
4044988,	--	122350003	Measurement	Influenza B virus antigen assay	SNOMED
44805900,	--	819441000000102	Measurement	Influenza B virus IgG antibody measurement	SNOMED
4262075,	--	441345003	Measurement	Influenza B virus present	SNOMED
4017924,	--	104310006	Measurement	Influenzavirus antibody assay	SNOMED
40484560,	--	443995002	Measurement	Measurement of Influenza A virus subtype H1N1 antigen	SNOMED
37394408,	--	1031631000000102	Observation	Avian influenza virus nucleic acid detection assay	SNOMED
37392948,	--	1010721000000107	Observation	Avian influenza virus RNA (ribonucleic acid) detection assay	SNOMED
37398130,	--	996211000000100	Observation	Influenza (A and B) serology	SNOMED
37393224,	--	1014261000000103	Observation	Influenza A antibody level	SNOMED
37392223,	--	1001341000000106	Observation	Influenza A antigen level	SNOMED
37394297,	--	1029881000000100	Observation	Influenza A nucleic acid detection assay	SNOMED
37393225,	--	1014271000000105	Observation	Influenza B antibody level	SNOMED
37392224,	--	1001351000000109	Observation	Influenza B antigen level	SNOMED
37394300,	--	1029911000000100	Observation	Influenza B nucleic acid detection assay	SNOMED
37392761	--	1008251000000105	Observation	Influenza B virus ribonucleic acid detection assay	SNOMED

--Put concept_ids here
    )
;

--List of Standard concepts Included for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Influenza testing'
    AND criteria = 'inclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Included
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Influenza testing'
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
    WHERE phenotype = 'Influenza testing'
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
    WHERE phenotype = 'Influenza testing'
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
WHERE phenotype = 'Influenza testing'
    AND criteria = 'not_mapped'
;

--searching for uncovered concepts in Standard and Source_vocabularies
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Influenza testing',
       'not_mapped',
       c.*
FROM @vocabulary_database_schema.concept c

WHERE (
        --To select the specific codes in specific vocabularies
        --(c.concept_code ~* '^00000|^00000|^00000' AND c.vocabulary_id IN (/*'EDI'*//*, 'KCD7'*/)  ) OR

        --Mask to detect uncovered concepts
--         (c.concept_name ~* '(influenza).*(detection)|(influenza).*(test)|(influenza).*(assay)|(influenza).*(measurement)|(measurement).*(influenza)|(test).*(influenza)|(detection).*(influenza)'
        (c.concept_name ~* '(influenza|flu )'
        --Masks to exclude
         AND c.concept_name !~* 'haemophilus|hemophilus|parainfluenza|season|not |resistance|genotype|possible|educated|advice|history|exposure|notified|home|culture|telephone|contact|have|vaccin|immuni'
    and standard_concept is not null
        AND c.domain_id IN (/*'Condition',*/ 'Observation',/*,'Procedure'*/ 'Measurement') --adjust Domains of interest

        AND c.concept_class_id NOT IN ('Substance', 'Organism', 'LOINC Component', 'LOINC System', 'Qualifier Value', 'Answer', 'Survey'/*, 'Morph Abnormality'*/) --exclude useless concept_classes

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
                WHERE phenotype = 'Influenza testing'
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
                WHERE phenotype = 'Influenza testing'
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
WHERE phenotype = 'Influenza testing'
    AND criteria = 'exclusion'
;

--List of Standard concepts Excluded
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Influenza testing', 'exclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (

--Put concept_ids here

    )
;

--List of Standard concepts Excluded for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Influenza testing'
    AND criteria = 'exclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Excluded
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Influenza testing'
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
    WHERE phenotype = 'Influenza testing'
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
    WHERE phenotype = 'Influenza testing'
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