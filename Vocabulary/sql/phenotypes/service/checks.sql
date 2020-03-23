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
SELECT DISTINCT ca.ancestor_concept_id, ca.min_levels_of_separation, ca.max_levels_of_separation, c.*
FROM @vocabulary_database_schema.concept_ancestor ca
JOIN @vocabulary_database_schema.concept c
ON ca.descendant_concept_id = c.concept_id
WHERE ca.ancestor_concept_id IN (4313509)
ORDER BY ca.ancestor_concept_id, ca.max_levels_of_separation
;

--Unexpected vocabularies
SELECT *
FROM @target_database_schema.concept_phenotypes cp
WHERE cp.vocabulary_id IN ('SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC', 'APC')
;

--Delete Unexpected vocabularies from concept_phenotypes
DELETE
FROM @target_database_schema.concept_phenotypes cp
WHERE cp.vocabulary_id IN ('SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC', 'APC')
    AND cp.criteria = 'not_mapped'
;


--List of phenotypes
SELECT DISTINCT phenotype, string_agg(DISTINCT criteria, ', ' ORDER BY criteria)
FROM @target_database_schema.concept_phenotypes
WHERE phenotype IN (
        --1st batch
        'Acute respiratory distress syndrome (ARDS)',
        'Asthma',
        'Chronic lung disease',
        'Extracorporeal membrane oxygenation (ECMO)',
        'HIV&AIDS',
        'Influenza',
        'Influenza (complicated)',
        'Intubation',
        'Invasive ventilation',
        'Non-invasive ventilation',
        'Pneumonia',
        'Ventilator care',

        --2nd batch
        'Influenza-like illness',
        'Transfusion',
        'Oxygen therapy',
        'Fever (38.0°C or higher)',
        'Nausea or vomiting',
        'Muscle aches (myalgia)',
        'Diarrhea',
        'Tachypnea',
        'Hypoxemia',
        'Chronic cardiac disease',
        'Immunosupression',

        --3rd batch
        'Continuous Renal Replacement therapy',
        'Peritoneal dialysis',
        'Subjective fever',
        'Chills',
        'Rhinorrhea',
        'Cough',
        'Shortness of breath (dyspnea)',
        'Abdominal pain',
        'Fatigue',
        'Throat pain',
        'Haemophtysis',
        'Smoker',
        'Hypertension',
        'Dementia',
        'Malnutrition'
    )
GROUP BY phenotype
;


--List for mapping review
--Batch 1
INSERT INTO @target_database_schema.mapping_review
SELECT DISTINCT string_agg(DISTINCT cp.phenotype, ', ' ORDER BY cp.phenotype),
                1 as batch,
                c1.*,
                c2.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept_ancestor ca
    ON cp.concept_id = ca.ancestor_concept_id
JOIN @vocabulary_database_schema.concept_relationship cr
    ON ca.descendant_concept_id = cr.concept_id_2
        AND cr.invalid_reason IS NULL
        AND cr.relationship_id = 'Maps to'
JOIN @vocabulary_database_schema.concept c1
    ON cr.concept_id_1 = c1.concept_id
        AND c1.vocabulary_id NOT IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC', 'APC')
        AND c1.standard_concept IS NULL
JOIN @vocabulary_database_schema.concept_relationship cr1
    ON c1.concept_id = cr1.concept_id_1
        AND cr1.relationship_id = 'Maps to'
        AND cr1.invalid_reason IS NULL
JOIN @vocabulary_database_schema.concept c2
    ON cr1.concept_id_2 = c2.concept_id

WHERE cp.criteria IN ('inclusion', 'exclusion')

    --to exclude already added concept
    AND c1.concept_id NOT IN (SELECT source_concept_id FROM @target_database_schema.mapping_review WHERE source_concept_id IS NOT NULL)

    AND cp.phenotype IN (
        'Acute respiratory distress syndrome (ARDS)',
        'Asthma',
        'Chronic lung disease',
        'Extracorporeal membrane oxygenation (ECMO)',
        'HIV&AIDS',
        'Influenza',
        'Influenza (complicated)',
        'Intubation',
        'Invasive ventilation',
        'Non-invasive ventilation',
        'Pneumonia',
        'Ventilator care'
    )
GROUP BY 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
;


--Batch 2
INSERT INTO @target_database_schema.mapping_review
SELECT DISTINCT string_agg(DISTINCT cp.phenotype, ', ' ORDER BY cp.phenotype),
                2 as batch,
                c1.*,
                c2.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept_ancestor ca
    ON cp.concept_id = ca.ancestor_concept_id
JOIN @vocabulary_database_schema.concept_relationship cr
    ON ca.descendant_concept_id = cr.concept_id_2
        AND cr.invalid_reason IS NULL
        AND cr.relationship_id = 'Maps to'
JOIN @vocabulary_database_schema.concept c1
    ON cr.concept_id_1 = c1.concept_id
        AND c1.vocabulary_id NOT IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC', 'APC')
        AND c1.domain_id NOT IN ('Drug')
        AND c1.standard_concept IS NULL
JOIN @vocabulary_database_schema.concept_relationship cr1
    ON c1.concept_id = cr1.concept_id_1
        AND cr1.relationship_id = 'Maps to'
        AND cr1.invalid_reason IS NULL
JOIN @vocabulary_database_schema.concept c2
    ON cr1.concept_id_2 = c2.concept_id

WHERE cp.criteria IN ('inclusion', 'exclusion')

    --to exclude already added concept
    AND c1.concept_id NOT IN (SELECT source_concept_id FROM @target_database_schema.mapping_review WHERE source_concept_id IS NOT NULL)

    AND cp.phenotype IN (
        'Influenza-like illness',
        'Transfusion',
        'Oxygen therapy',
        'Fever (38.0°C or higher)',
        'Nausea or vomiting',
        'Muscle aches (myalgia)',
        'Diarrhea',
        'Tachypnea',
        'Hypoxemia',
        'Chronic cardiac disease',
        'Immunosupression'
    )
GROUP BY 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
;



--Batch 3
INSERT INTO @target_database_schema.mapping_review
SELECT DISTINCT string_agg(DISTINCT cp.phenotype, ', ' ORDER BY cp.phenotype),
                3 as batch,
                c1.*,
                c2.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept_ancestor ca
    ON cp.concept_id = ca.ancestor_concept_id
JOIN @vocabulary_database_schema.concept_relationship cr
    ON ca.descendant_concept_id = cr.concept_id_2
        AND cr.invalid_reason IS NULL
        AND cr.relationship_id = 'Maps to'
JOIN @vocabulary_database_schema.concept c1
    ON cr.concept_id_1 = c1.concept_id
        AND c1.vocabulary_id NOT IN ('SNOMED', 'SNOMED Veterinary', 'MeSH', 'CIEL', 'OXMIS', 'DRG', 'SUS', 'Nebraska Lexicon', 'SMQ', 'PPI', 'MDC', 'APC')
        AND c1.domain_id NOT IN ('Drug')
        AND c1.standard_concept IS NULL
JOIN @vocabulary_database_schema.concept_relationship cr1
    ON c1.concept_id = cr1.concept_id_1
        AND cr1.relationship_id = 'Maps to'
        AND cr1.invalid_reason IS NULL
JOIN @vocabulary_database_schema.concept c2
    ON cr1.concept_id_2 = c2.concept_id

WHERE cp.criteria IN ('inclusion', 'exclusion')

    --to exclude already added concept
    AND c1.concept_id NOT IN (SELECT source_concept_id FROM @target_database_schema.mapping_review WHERE source_concept_id IS NOT NULL)

    AND cp.phenotype IN (
        --3rd batch
        'Continuous Renal Replacement therapy',
        'Peritoneal dialysis',
        'Subjective fever',
        'Chills',
        'Rhinorrhea',
        'Cough',
        'Shortness of breath (dyspnea)',
        'Abdominal pain',
        'Fatigue',
        'Throat pain',
        'Haemophtysis',
        'Smoker',
        'Hypertension',
        'Dementia',
        'Malnutrition'
    )
GROUP BY 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
;





SELECT *
FROM @target_database_schema.mapping_review
WHERE batch = 3
    --AND lower(source_concept_name) != lower (target_concept_name)
;



--List for mapping to do
--Batch 1
INSERT INTO @target_database_schema.mapping_to_do
SELECT DISTINCT string_agg(DISTINCT cp.phenotype, ', ' ORDER BY cp.phenotype),
                1 as batch,
                c1.*,
                c2.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept c1
    ON cp.concept_id = c1.concept_id
LEFT JOIN @vocabulary_database_schema.concept_relationship cr
    ON c1.concept_id = cr.concept_id_1
        AND cr.relationship_id = 'Maps to'
        AND cr.invalid_reason IS NULL
LEFT JOIN @vocabulary_database_schema.concept c2
    ON cr.concept_id_2 = c2.concept_id
WHERE cp.criteria IN ('not_mapped')
    AND c1.standard_concept IS NULL
    AND c1.vocabulary_id NOT IN ('SNOMED')

    --to exclude already added concept
    AND c1.concept_id NOT IN (SELECT source_concept_id FROM @target_database_schema.mapping_to_do WHERE source_concept_id IS NOT NULL)

    AND cp.phenotype IN (
        'Acute respiratory distress syndrome (ARDS)',
        'Asthma',
        'Chronic lung disease',
        'Extracorporeal membrane oxygenation (ECMO)',
        'HIV&AIDS',
        'Influenza',
        'Influenza (complicated)',
        'Intubation',
        'Invasive ventilation',
        'Non-invasive ventilation',
        'Pneumonia',
        'Ventilator care'
    )
GROUP BY 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
;

--Batch 2
INSERT INTO @target_database_schema.mapping_to_do
SELECT DISTINCT string_agg(DISTINCT cp.phenotype, ', ' ORDER BY cp.phenotype),
                2 as batch,
                c1.*,
                c2.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept c1
    ON cp.concept_id = c1.concept_id
LEFT JOIN @vocabulary_database_schema.concept_relationship cr
    ON c1.concept_id = cr.concept_id_1
        AND cr.relationship_id = 'Maps to'
        AND cr.invalid_reason IS NULL
LEFT JOIN @vocabulary_database_schema.concept c2
    ON cr.concept_id_2 = c2.concept_id
WHERE cp.criteria IN ('not_mapped')
    AND c1.standard_concept IS NULL
    AND c1.vocabulary_id NOT IN ('SNOMED')

    --to exclude already added concept
    AND c1.concept_id NOT IN (SELECT source_concept_id FROM @target_database_schema.mapping_to_do WHERE source_concept_id IS NOT NULL)

    AND cp.phenotype IN (
        'Asthma', --additional codes

        'Influenza-like illness',
        'Transfusion',
        'Oxygen therapy',
        'Fever (38.0°C or higher)',
        'Nausea or vomiting',
        'Muscle aches (myalgia)',
        'Diarrhea',
        'Tachypnea',
        'Hypoxemia',
        'Chronic cardiac disease',
        'Immunosupression'
    )
GROUP BY 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
;



--List for mapping to do
--Batch 3
INSERT INTO @target_database_schema.mapping_to_do
SELECT DISTINCT string_agg(DISTINCT cp.phenotype, ', ' ORDER BY cp.phenotype),
                3 as batch,
                c1.*,
                c2.*
FROM @target_database_schema.concept_phenotypes cp
JOIN @vocabulary_database_schema.concept c1
    ON cp.concept_id = c1.concept_id
LEFT JOIN @vocabulary_database_schema.concept_relationship cr
    ON c1.concept_id = cr.concept_id_1
        AND cr.relationship_id = 'Maps to'
        AND cr.invalid_reason IS NULL
LEFT JOIN @vocabulary_database_schema.concept c2
    ON cr.concept_id_2 = c2.concept_id
WHERE cp.criteria IN ('not_mapped')
    AND c1.standard_concept IS NULL
    AND c1.vocabulary_id NOT IN ('SNOMED')

    --to exclude already added concept
    AND c1.concept_id NOT IN (SELECT source_concept_id FROM @target_database_schema.mapping_to_do WHERE source_concept_id IS NOT NULL)

    AND cp.phenotype IN (
        --3rd batch
        'Continuous Renal Replacement therapy',
        'Peritoneal dialysis',
        'Subjective fever',
        'Chills',
        'Rhinorrhea',
        'Cough',
        'Shortness of breath (dyspnea)',
        'Abdominal pain',
        'Fatigue',
        'Throat pain',
        'Haemophtysis',
        'Smoker',
        'Hypertension',
        'Dementia',
        'Malnutrition'
    )
GROUP BY 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
;


SELECT *
FROM @target_database_schema.mapping_to_do
WHERE batch = 1
    --AND lower(source_concept_name) != lower (target_concept_name)
;


SELECT *
FROM @target_database_schema.mapping_review
WHERE batch = 3
    --AND lower(source_concept_name) != lower (target_concept_name)
;


--count of concept to map/review
SELECT DISTINCT phenotype, count(source_concept_id)
FROM (
     SELECT *
     FROM mapping_to_do
     UNION
     SELECT *
     FROM mapping_review
     ) tab
group by phenotype
--order by count(phenotype) desc
;