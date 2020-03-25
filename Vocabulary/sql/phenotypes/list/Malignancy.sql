--reset phenotype concept list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Malignancy'
;

--reset Standard concepts Included list
DELETE FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Malignancy'
    AND criteria = 'inclusion'
;

--List of Standard concepts Included
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Malignancy', 'inclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
36402517,	--	9300/3-C41.1	Condition	Adenomatoid odontogenic tumor, malignant of mandible	ICDO3
42511849,	--	8821/3-C76.1	Condition	Aggressive fibromatosis, malignant of thorax, NOS	ICDO3
36558838,	--	8157/3-C25.1	Condition	Enteroglucagonoma, malignant of body of pancreas	ICDO3
36554437,	--	8157/3-C17.0	Condition	Enteroglucagonoma, malignant of duodenum	ICDO3
36520513,	--	8157/3-C26.9	Condition	Enteroglucagonoma, malignant of gastrointestinal tract, NOS	ICDO3
36536923,	--	8157/3-C25.0	Condition	Enteroglucagonoma, malignant of head of pancreas	ICDO3
36554408,	--	8157/3-C17.2	Condition	Enteroglucagonoma, malignant of ileum	ICDO3
36540775,	--	8157/3-C26.0	Condition	Enteroglucagonoma, malignant of intestinal tract, NOS	ICDO3
36558214,	--	8157/3-C25.4	Condition	Enteroglucagonoma, malignant of islets of Langerhans	ICDO3
36552265,	--	8157/3-C17.1	Condition	Enteroglucagonoma, malignant of jejunum	ICDO3
36566819,	--	8157/3-C17.3	Condition	Enteroglucagonoma, malignant of meckel diverticulum	ICDO3
36551149,	--	8157/3-C25.7	Condition	Enteroglucagonoma, malignant of other specified parts of pancreas	ICDO3
36527954,	--	8157/3-C26.8	Condition	Enteroglucagonoma, malignant of overlapping lesion of digestive system	ICDO3
36517216,	--	8157/3-C25.8	Condition	Enteroglucagonoma, malignant of overlapping lesion of pancreas	ICDO3
36554185,	--	8157/3-C17.8	Condition	Enteroglucagonoma, malignant of overlapping lesion of small intestine	ICDO3
36561476,	--	8157/3-C25.9	Condition	Enteroglucagonoma, malignant of pancreas, NOS	ICDO3
36527283,	--	8157/3-C25.3	Condition	Enteroglucagonoma, malignant of pancreatic duct	ICDO3
36520843,	--	8157/3-C17.9	Condition	Enteroglucagonoma, malignant of small intestine, NOS	ICDO3
36563701,	--	8157/3-C25.2	Condition	Enteroglucagonoma, malignant of tail of pancreas	ICDO3
36402572,	--	8157/3-C80.9	Condition	Enteroglucagonoma, malignant of unknown primary site	ICDO3
36403131,	--	8632/3-C56.9	Condition	Gynandroblastoma, malignant of ovary	ICDO3
36403114,	--	8622/3-C56.9	Condition	Juvenile granulosa cell tumor, malignant of ovary	ICDO3
36402521,	--	8836/3-C44.5	Condition	Malignant angiomatoid fibrous histiocytoma of skin of trunk	ICDO3
36403113,	--	9104/3-C58.9	Condition	Malignant placental site trophoblastic tumor of placenta	ICDO3
36403158,	--	9394/3-C72.1	Condition	Myxopapillary ependymoma, malignant of cauda equina	ICDO3
36403092,	--	9394/3-C72.0	Condition	Myxopapillary ependymoma, malignant of spinal cord	ICDO3
42514353,	--	8822/3-NULL	Condition	Neoplasm defined only by histology: Abdominal fibrosis, malignant	ICDO3
42514262,	--	9013/3-NULL	Condition	Neoplasm defined only by histology: Adenofibroma, malignant (C56.9)	ICDO3
42514281,	--	9300/3-NULL	Condition	Neoplasm defined only by histology: Adenomatoid odontogenic tumor, malignant	ICDO3
42514361,	--	9054/3-NULL	Condition	Neoplasm defined only by histology: Adenomatoid tumor, malignant	ICDO3
42514106,	--	8821/3-NULL	Condition	Neoplasm defined only by histology: Aggressive fibromatosis, malignant	ICDO3
42514289,	--	8826/3-NULL	Condition	Neoplasm defined only by histology: Angiomyofibroblastoma, malignant (C49._)	ICDO3
42514345,	--	8248/3-NULL	Condition	Neoplasm defined only by histology: Apudoma, malignant	ICDO3
42514270,	--	8893/3-NULL	Condition	Neoplasm defined only by histology: Bizarre leiomyoma, malignant (C49._)	ICDO3
42514115,	--	8081/3-NULL	Condition	Neoplasm defined only by histology: Bowen's disease, malignant (C44._)	ICDO3
42514308,	--	8444/3-NULL	Condition	Neoplasm defined only by histology: Clear cell cystic tumor, malignant	ICDO3
42514123,	--	9282/3-NULL	Condition	Neoplasm defined only by histology: Complex odontoma, malignant (C41._)	ICDO3
42514351,	--	9350/3-NULL	Condition	Neoplasm defined only by histology: Craniopharyngioma, malignant	ICDO3
42514235,	--	9413/3-NULL	Condition	Neoplasm defined only by histology: Dysembryoplastic neuroepithelial tumor, malignant	ICDO3
42514155,	--	8242/6-NULL	Condition	Neoplasm defined only by histology: Enterochromaffin-like cell tumor, malignant	ICDO3
42514061,	--	8157/3-NULL	Condition	Neoplasm defined only by histology: Enteroglucagonoma, malignant	ICDO3
42514360,	--	9125/3-NULL	Condition	Neoplasm defined only by histology: Epithelioid hemangioma, malignant (C49._)	ICDO3
42514128,	--	8683/3-NULL	Condition	Neoplasm defined only by histology: Gangliocytic paraganglioma, malignant (C17.0)	ICDO3
42514092,	--	8712/3-NULL	Condition	Neoplasm defined only by histology: Glomangioma, malignant (C49._)	ICDO3
42514314,	--	9073/3-NULL	Condition	Neoplasm defined only by histology: Gonadoblastoma, malignant	ICDO3
42514088,	--	8632/3-NULL	Condition	Neoplasm defined only by histology: Gynandroblastoma, malignant	ICDO3
42514158,	--	9161/3-NULL	Condition	Neoplasm defined only by histology: Hemangioblastoma, malignant	ICDO3
42514261,	--	9769/3-NULL	Condition	Neoplasm defined only by histology: Immunoglobulin deposition disease, malignant	ICDO3
42514113,	--	8622/3-NULL	Condition	Neoplasm defined only by histology: Juvenile granulosa cell tumor, malignant	ICDO3
42514266,	--	9970/3-NULL	Condition	Neoplasm defined only by histology: Lymphoproliferative disease, malignant, NOS	ICDO3
42514120,	--	8836/3-NULL	Condition	Neoplasm defined only by histology: Malignant angiomatoid fibrous histiocytoma	ICDO3
42514364,	--	9351/3-NULL	Condition	Neoplasm defined only by histology: Malignant craniopharyngioma, adamantinomatous	ICDO3
42514072,	--	9104/3-NULL	Condition	Neoplasm defined only by histology: Malignant placental site trophoblastic tumor	ICDO3
42514259,	--	8835/3-NULL	Condition	Neoplasm defined only by histology: Malignant plexiform fibrohistiocytic tumor	ICDO3
42514167,	--	8593/3-NULL	Condition	Neoplasm defined only by histology: Malignant stromal tumor, with sex cord elements	ICDO3
42514194,	--	8897/3-NULL	Condition	Neoplasm defined only by histology: Malignant tumor of smooth muscle	ICDO3
42514135,	--	9363/3-NULL	Condition	Neoplasm defined only by histology: Melanotic neuroectodermal tumor, malignant (C40._, C41._)	ICDO3
42514164,	--	9531/3-NULL	Condition	Neoplasm defined only by histology: Meningiothelial meningioma, malignant (C70._)	ICDO3
42514317,	--	9055/3-NULL	Condition	Neoplasm defined only by histology: Multicystic mesothelioma, malignant	ICDO3
42514309,	--	9394/3-NULL	Condition	Neoplasm defined only by histology: Myxopapillary ependymoma, malignant	ICDO3
42514330,	--	9506/3-NULL	Condition	Neoplasm defined only by histology: Neurocytoma, malignant	ICDO3
42514306,	--	9200/3-NULL	Condition	Neoplasm defined only by histology: Osteosarcoma, malignant	ICDO3
42514273,	--	8451/3-NULL	Condition	Neoplasm defined only by histology: Papillary cystadenoma,malignant	ICDO3
42514292,	--	9103/3-NULL	Condition	Neoplasm defined only by histology: Partial hydatidiform mole, malignant (C58.9)	ICDO3
42514142,	--	8103/3-NULL	Condition	Neoplasm defined only by histology: Pilar tumor, malignant (C44._)	ICDO3
42514111,	--	9360/3-NULL	Condition	Neoplasm defined only by histology: Pinealoma, malignant	ICDO3
42514210,	--	9361/3-NULL	Condition	Neoplasm defined only by histology: Pineocytoma, malignant	ICDO3
42514267,	--	9533/3-NULL	Condition	Neoplasm defined only by histology: Psammomatous meningioma, malignant (C70._)	ICDO3
42514188,	--	8080/3-NULL	Condition	Neoplasm defined only by histology: Queyrat erythroplasia, malignant (C60._)	ICDO3
42514371,	--	8602/3-NULL	Condition	Neoplasm defined only by histology: Sclerosing stromal tumor, malignant (C56.9)	ICDO3
42514153,	--	8442/3-NULL	Condition	Neoplasm defined only by histology: Serous cystadenoma, malignant	ICDO3
42514322,	--	8623/3-NULL	Condition	Neoplasm defined only by histology: Sex cord tumor with annular tubules, malignant	ICDO3
42514095,	--	8053/3-NULL	Condition	Neoplasm defined only by histology: Squamous cell papilloma, inverted, malignant	ICDO3
42514354,	--	9312/3-NULL	Condition	Neoplasm defined only by histology: Squamous odontogenic tumor, malignant (C41._)	ICDO3
42514375,	--	8060/3-NULL	Condition	Neoplasm defined only by histology: Squamous papillomatosis, malignant	ICDO3
42514349,	--	9091/3-NULL	Condition	Neoplasm defined only by histology: Strumal carcinoid, malignant	ICDO3
42514154,	--	9383/3-NULL	Condition	Neoplasm defined only by histology: Subependymoma, malignant	ICDO3
42514176,	--	9384/3-NULL	Condition	Neoplasm defined only by histology: Supependymal giant cell astrocytoma, malignant	ICDO3
42514101,	--	8040/3-NULL	Condition	Neoplasm defined only by histology: Tumorlet, malignant	ICDO3
42514063,	--	8561/3-NULL	Condition	Neoplasm defined only by histology: Warthin tumor, malignant	ICDO3
36402411,	--	8451/3-C56.9	Condition	Papillary cystadenoma,malignant of ovary	ICDO3
42511938,	--	9361/3-C71.9	Condition	Pineocytoma, malignant of brain, NOS	ICDO3
36403155,	--	9361/3-C75.3	Condition	Pineocytoma, malignant of pineal gland	ICDO3
36403111,	--	8442/3-C56.9	Condition	Serous cystadenoma, malignant of ovary	ICDO3
36403097,	--	8623/3-C56.9	Condition	Sex cord tumor with annular tubules, malignant of ovary	ICDO3
36402402,	--	8060/3-C73.9	Condition	Squamous papillomatosis, malignant of thyroid gland	ICDO3
36402618,	--	8040/3-C34.0	Condition	Tumorlet, malignant of main bronchus	ICDO3
36403053,	--	8561/3-C08.9	Condition	Warthin tumor, malignant of major salivary gland, NOS	ICDO3
36403016,	--	8561/3-C08.8	Condition	Warthin tumor, malignant of overlapping lesion of major salivary glands	ICDO3
36402996,	--	8561/3-C07.9	Condition	Warthin tumor, malignant of parotid gland	ICDO3
36403035,	--	8561/3-C08.1	Condition	Warthin tumor, malignant of sublingual gland	ICDO3
36403040,	--	8561/3-C08.0	Condition	Warthin tumor, malignant of submandibular gland	ICDO3
443392,	--	363346000	Condition	Malignant neoplastic disease	SNOMED
36402263,	--	8822/3	Observation	Abdominal fibrosis, malignant	ICDO3
36403184,	--	9013/3	Observation	Adenofibroma, malignant (C56.9)	ICDO3
36402317,	--	9300/3	Observation	Adenomatoid odontogenic tumor, malignant	ICDO3
36402285,	--	9054/3	Observation	Adenomatoid tumor, malignant	ICDO3
36402225,	--	8821/3	Observation	Aggressive fibromatosis, malignant	ICDO3
36402893,	--	8826/3	Observation	Angiomyofibroblastoma, malignant (C49._)	ICDO3
36402196,	--	8248/3	Observation	Apudoma, malignant	ICDO3
36402953,	--	8893/3	Observation	Bizarre leiomyoma, malignant (C49._)	ICDO3
36402923,	--	8081/3	Observation	Bowen's disease, malignant (C44._)	ICDO3
36403164,	--	8444/3	Observation	Clear cell cystic tumor, malignant	ICDO3
36402957,	--	9282/3	Observation	Complex odontoma, malignant (C41._)	ICDO3
36402229,	--	9350/3	Observation	Craniopharyngioma, malignant	ICDO3
36402273,	--	9413/3	Observation	Dysembryoplastic neuroepithelial tumor, malignant	ICDO3
36402292,	--	8242/6	Observation	Enterochromaffin-like cell tumor, malignant	ICDO3
36402976,	--	9125/3	Observation	Epithelioid hemangioma, malignant (C49._)	ICDO3
36402931,	--	8683/3	Observation	Gangliocytic paraganglioma, malignant (C17.0)	ICDO3
42511587,	--	9086/3	Observation	Germ cell tumor with associated hematological malignancy	ICDO3
36402932,	--	8712/3	Observation	Glomangioma, malignant (C49._)	ICDO3
36402265,	--	9073/3	Observation	Gonadoblastoma, malignant	ICDO3
36402296,	--	8632/3	Observation	Gynandroblastoma, malignant	ICDO3
36402268,	--	9161/3	Observation	Hemangioblastoma, malignant	ICDO3
36402912,	--	8831/3	Observation	Histiocytoma, NOS, malignant (C49._)	ICDO3
36402315,	--	9769/3	Observation	Immunoglobulin deposition disease, malignant	ICDO3
36402307,	--	8622/3	Observation	Juvenile granulosa cell tumor, malignant	ICDO3
36402280,	--	9970/3	Observation	Lymphoproliferative disease, malignant, NOS	ICDO3
36402253,	--	8836/3	Observation	Malignant angiomatoid fibrous histiocytoma	ICDO3
36402224,	--	9351/3	Observation	Malignant craniopharyngioma, adamantinomatous	ICDO3
36402297,	--	9104/3	Observation	Malignant placental site trophoblastic tumor	ICDO3
36402282,	--	8835/3	Observation	Malignant plexiform fibrohistiocytic tumor	ICDO3
36402231,	--	8593/3	Observation	Malignant stromal tumor, with sex cord elements	ICDO3
36403163,	--	8897/3	Observation	Malignant tumor of smooth muscle	ICDO3
36402917,	--	9363/3	Observation	Melanotic neuroectodermal tumor, malignant (C40._, C41._)	ICDO3
36402913,	--	9531/3	Observation	Meningiothelial meningioma, malignant (C70._)	ICDO3
36402334,	--	9055/3	Observation	Multicystic mesothelioma, malignant	ICDO3
36402295,	--	8824/3	Observation	Myofibroma, malignant	ICDO3
36403171,	--	9394/3	Observation	Myxopapillary ependymoma, malignant	ICDO3
36402278,	--	9506/3	Observation	Neurocytoma, malignant	ICDO3
36402293,	--	9562/3	Observation	Neurothekeoma, malignant	ICDO3
36402332,	--	9200/3	Observation	Osteosarcoma, malignant	ICDO3
36402260,	--	8451/3	Observation	Papillary cystadenoma,malignant	ICDO3
36402919,	--	9103/3	Observation	Partial hydatidiform mole, malignant (C58.9)	ICDO3
36402978,	--	8103/3	Observation	Pilar tumor, malignant (C44._)	ICDO3
36402299,	--	9360/3	Observation	Pinealoma, malignant	ICDO3
36402301,	--	9361/3	Observation	Pineocytoma, malignant	ICDO3
36402217,	--	9550/3	Observation	Plexiform neurofibroma, malignant	ICDO3
36402937,	--	8271/3	Observation	Prolactinoma, malignant (C75.1)	ICDO3
36402973,	--	9533/3	Observation	Psammomatous meningioma, malignant (C70._)	ICDO3
36403191,	--	8080/3	Observation	Queyrat erythroplasia, malignant (C60._)	ICDO3
36403178,	--	8602/3	Observation	Sclerosing stromal tumor, malignant (C56.9)	ICDO3
36402330,	--	8442/3	Observation	Serous cystadenoma, malignant	ICDO3
36403170,	--	8623/3	Observation	Sex cord tumor with annular tubules, malignant	ICDO3
36402242,	--	8053/3	Observation	Squamous cell papilloma, inverted, malignant	ICDO3
36402964,	--	9312/3	Observation	Squamous odontogenic tumor, malignant (C41._)	ICDO3
36402199,	--	8060/3	Observation	Squamous papillomatosis, malignant	ICDO3
36402272,	--	9091/3	Observation	Strumal carcinoid, malignant	ICDO3
36402327,	--	9383/3	Observation	Subependymoma, malignant	ICDO3
36403176,	--	9384/3	Observation	Supependymal giant cell astrocytoma, malignant	ICDO3
36402281,	--	8040/3	Observation	Tumorlet, malignant	ICDO3
36402970,	--	8561/3	Observation	Warthin tumor, malignant	ICDO3
4312326 	--	86049000	Observation	Neoplasm, malignant	SNOMED

--Put concept_ids here
    )
;

--List of Standard concepts Included for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Malignancy'
    AND criteria = 'inclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Included
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Malignancy'
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
    WHERE phenotype = 'Malignancy'
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
    WHERE phenotype = 'Malignancy'
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
WHERE phenotype = 'Malignancy'
    AND criteria = 'not_mapped'
;

--searching for uncovered concepts in Standard and Source_vocabularies
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Malignancy',
       'not_mapped',
       c.*
FROM @vocabulary_database_schema.concept c

WHERE (
        --To select the specific codes in specific vocabularies
        --(c.concept_code ~* '^00000|^00000|^00000' AND c.vocabulary_id IN (/*'EDI'*//*, 'KCD7'*/)  ) OR

        --Mask to detect uncovered concepts
        (c.concept_name ~* 'Malignan|cancer'

        --Masks to exclude
         AND c.concept_name !~* 'benign|seen|hyperthermia|history|procurement|fast track|uncertain|borderline|suspected|hypertensive|fear|screening|Precancerous|low malignant potential'

        AND c.domain_id IN ('Condition', 'Observation'/*,'Procedure'*/ /*,'Measurement'*/) --adjust Domains of interest

        AND c.concept_class_id NOT IN ('Substance', 'Organism', 'LOINC Component', 'LOINC System', 'Qualifier Value', 'Answer', 'Survey', 'Context-dependent', 'Clinical Observation', 'Procedure', 'ICD10 Histology', 'NAACCR Schema'/*, 'Morph Abnormality'*/) --exclude useless concept_classes

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
                WHERE phenotype = 'Malignancy'
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
                WHERE phenotype = 'Malignancy'
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
WHERE phenotype = 'Malignancy'
    AND criteria = 'exclusion'
;

--NOT NEEDED
/*
--List of Standard concepts Excluded
INSERT INTO @target_database_schema.concept_phenotypes
SELECT 'Malignancy', 'exclusion', c.*
FROM @vocabulary_database_schema.concept c
WHERE c.concept_id IN (
--Put concept_ids here

    )
;

--List of Standard concepts Excluded for comment generation
SELECT DISTINCT (concept_id || ','), '--', concept_code, domain_id, concept_name, vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Malignancy'
    AND criteria = 'exclusion'
ORDER BY domain_id, vocabulary_id, concept_name, concept_code
;

--Markdown-friendly list of Standard concepts Excluded
SELECT domain_id || '|' || concept_id || '|' || concept_name || '|' || concept_code || '|' || vocabulary_id
FROM @target_database_schema.concept_phenotypes
WHERE phenotype = 'Malignancy'
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
    WHERE phenotype = 'Malignancy'
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
    WHERE phenotype = 'Malignancy'
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

 */