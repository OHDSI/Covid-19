--reset phenotype concept list
DELETE FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
;

--reset Standard concepts Included list
DELETE FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
    AND criteria = 'inclusion'
;

--List of Standard concepts Included
INSERT INTO dev_covid19.concept_phenotypes
SELECT 'chronic neurological disorder', 'inclusion', c.*
FROM devv5.concept c
WHERE c.concept_id IN (
372887	--	81308009	Condition	Disorder of brain	SNOMED
)
;

--List of Standard concepts Included for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
    AND criteria = 'inclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Included
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
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
    WHERE phenotype = 'chronic neurological disorder'
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
    WHERE phenotype = 'chronic neurological disorder'
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
DELETE FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
    AND criteria = 'not_mapped'
;

--searching for uncovered concepts in Standard and Source_vocabularies
INSERT INTO dev_covid19.concept_phenotypes
SELECT 'chronic neurological disorder',
       'not_mapped',
       c.*
FROM devv5.concept c

WHERE (
        --To select the specific codes in specific vocabularies
        --(c.concept_code ~* '^00000|^00000|^00000' AND c.vocabulary_id IN (/*'EDI'*//*, 'KCD7'*/)  ) OR

        --Mask to detect uncovered concepts
        (c.concept_name ~* 'brain|neurologic'

        --Masks to exclude
        AND c.concept_name !~* 'referral| procedure|scan|reflex|lesion|abscess|necrosis|dead|fear|lung|cancer|varicella|event|'||
        'nile|unpleasant|surgery|operation|phenx|evoked|confirmed|observable|barrier|^brain$|electrical|foreign|shift|non-|cal symptom ch|' ||
        'plan|arthropathy|deficiency|quality|deficit|screen|virus|morbidity|fh|finding|observation|survey|rubella|skin|diarrhea|hemorrhage|' ||
        'score|admission|level|suspect|tumor|diabetes|study|status|no |stem|family|death|normal|function|neoplasm|stimulator|transient|weight|ioma|' ||
        'toma|moma|discharge|treatment|response|care|monitoring|assessment|imaging|device|seen|injury|potential'

        AND c.domain_id IN ('Condition', 'Observation'/*,'Procedure'*/ /*,'Measurement'*/) --adjust Domains of interest

        AND c.concept_class_id NOT IN ('Substance', 'Organism', 'LOINC Component', 'LOINC System', 'Qualifier Value', 'Answer', 'Survey'/*, 'Morph Abnormality'*/) --exclude useless concept_classes

        AND c.vocabulary_id NOT IN ('MedDRA', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC') --exclude useless vocabularies
        AND NOT (c.vocabulary_id = 'SNOMED' AND c.invalid_reason IS NOT NULL) --exclude SNOMED invalid concepts
        AND NOT (c.concept_class_id ~* 'Hierarchy|chapter' AND c.vocabulary_id NOT IN ('EDI', 'KCD7')) --exclude hierarchical concept_classes
        AND NOT (c.vocabulary_id = 'ICD10CM' AND c.valid_end_date < to_date('20151001', 'YYYYMMDD')) --exclude pre-release ICD10CM codes
        )
    )
    AND NOT EXISTS ( --exclude what is already mapped to Included/Excluded parents (except 'EDI', 'KCD7')
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
                WHERE phenotype = 'chronic neurological disorder'
                    AND criteria IN ('inclusion', 'exclusion')
                    AND concept_id IS NOT NULL
                    AND criteria IS NOT NULL
                )
                AND c2.vocabulary_id NOT IN ('EDI', 'KCD7')
                AND (c.concept_id = c1.concept_id OR c.concept_id = c2.concept_id)
        )
    AND NOT EXISTS ( --exclude what is already mapped to Included parents ('EDI', 'KCD7')
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
                WHERE phenotype = 'chronic neurological disorder'
                    AND criteria IN ('inclusion')
                    AND concept_id IS NOT NULL
                    AND criteria IS NOT NULL
                )
                AND c2.vocabulary_id IN ('EDI', 'KCD7')
                AND (c.concept_id = c1.concept_id OR c.concept_id = c2.concept_id)
        )
;

--reset Standard concepts Excluded list
DELETE FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
    AND criteria = 'exclusion'
;

--List of Standard concepts Excluded
INSERT INTO dev_covid19.concept_phenotypes
SELECT 'chronic neurological disorder', 'exclusion', c.*
FROM devv5.concept c
WHERE c.concept_id IN (
3175008,	--	573471000004106	Condition	Brain infarction	Nebraska Lexicon
3170737,	--	276541000004100	Condition	Cerebral microabscess	Nebraska Lexicon
3168888,	--	10860001000004101	Condition	Cerebral necrosis	Nebraska Lexicon
40480849,	--	441806004	Condition	Abscess of brain	SNOMED
376690,	--	2032001	Condition	Cerebral edema	SNOMED
4145619,	--	34209003	Condition	Cerebral hemiplegia	SNOMED
376713,	--	274100004	Condition	Cerebral hemorrhage	SNOMED
4048787,	--	230723007	Condition	Cerebral venous thrombosis of great cerebral vein	SNOMED
443735,	--	420662003	Condition	Coma associated with diabetes mellitus	SNOMED
4105620,	--	193039006	Condition	Complicated migraine	SNOMED
377550,	--	46963008	Condition	Compression of brain	SNOMED
378143,	--	45170000	Condition	Encephalitis	SNOMED
4243203,	--	58762006	Condition	Encephalomalacia	SNOMED
4096378,	--	189198006	Condition	Epileptic drop attack	SNOMED
4172553,	--	277369003	Condition	Hamartoma of brain	SNOMED
4306573,	--	389088001	Condition	Hypoxia of brain	SNOMED
4029499,	--	128614008	Condition	Infectious disease of brain	SNOMED
4319465,	--	95638000	Condition	Localized cranial lesion	SNOMED
40481031,	--	443333004	Condition	Medulloblastoma	SNOMED
4113841,	--	198438009	Condition	Menopausal headache	SNOMED
379806,	--	193030005	Condition	Migraine variants	SNOMED
381549,	--	4473006	Condition	Migraine with aura	SNOMED
4044234,	--	230468003	Condition	Migraine with ischemic complication	SNOMED
378735,	--	56097005	Condition	Migraine without aura	SNOMED
4129842,	--	237349002	Condition	Mild postnatal depression	SNOMED
4028783,	--	237351003	Condition	Mild postnatal psychosis	SNOMED
373724,	--	126952004	Condition	Neoplasm of brain	SNOMED
4062124,	--	200071001	Condition	Obstetric spinal and epidural anesthesia-induced headache	SNOMED
4080888,	--	276706004	Condition	Perinatal cerebral ischemia	SNOMED
4137761,	--	32112006	Condition	Phlebitis of inferior sagittal sinus	SNOMED
4229432,	--	88755007	Condition	Phlebitis of lateral venous sinus	SNOMED
4100120,	--	192767000	Condition	Phlebitis transverse sinus	SNOMED
4027233,	--	128470003	Condition	Pineal gland disorder	SNOMED
4032015,	--	14415006	Condition	Pneumocephalus	SNOMED
4105365,	--	193028008	Condition	Sick headache	SNOMED
4099948,	--	192003008	Condition	Sleep drunkenness	SNOMED
4065627,	--	200076006	Condition	Spinal and epidural anesthesia-induced headache during labor and delivery	SNOMED
4061351,	--	200072008	Condition	Spinal and epidural anesthesia-induced headache during pregnancy	SNOMED
4065625,	--	200073003	Condition	Spinal and epidural anesthesia-induced headache during the puerperium	SNOMED
4048890,	--	15742000	Condition	Thrombosis of inferior sagittal sinus	SNOMED
4057329,	--	21258007	Condition	Thrombosis of lateral venous sinus	SNOMED
764723,	--	5591000124102	Condition	Thrombosis of superior anastomotic vein	SNOMED
4105338,	--	192761004	Condition	Thrombosis transverse sinus	SNOMED
4086502,	--	248260009	Condition	Unrefreshed by sleep	SNOMED
43531591,	--	89441000119109	Condition	Ventriculitis of the brain	SNOMED
4048785,	--	230717002	Condition	Vertebrobasilar territory transient ischemic attack	SNOMED
4204047

--Put concept_ids here
    )
;

--List of Standard concepts Excluded for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
    AND criteria = 'exclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Excluded
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM dev_covid19.concept_phenotypes
WHERE phenotype = 'chronic neurological disorder'
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
    WHERE phenotype = 'chronic neurological disorder'
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
    WHERE phenotype = 'chronic neurological disorder'
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