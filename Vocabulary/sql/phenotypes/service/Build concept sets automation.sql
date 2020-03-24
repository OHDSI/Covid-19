select
jsonb_pretty(
  jsonb_build_object (
    'name', phenotype,
    'items', j
  )
)
from (
  select
  cp.phenotype,
    json_agg(
      json_build_object(
        'concept',
        json_build_object(
          'CONCEPT_ID',cp.concept_id::text,
          'CONCEPT_NAME',cp.concept_name,
          'STANDARD_CONCEPT',cp.standard_concept,
          'STANDARD_CONCEPT_CAPTION',case cp.standard_concept when 'S' then 'Standard' when 'C' then 'Classification' else 'Non-Standard' end,
          'INVALID_REASON',coalesce (cp.invalid_reason,'V'),
          'INVALID_REASON_CAPTION',case cp.invalid_reason when null then 'VALID' else 'INVALID' end,
          'CONCEPT_CODE',cp.concept_code,
          'DOMAIN_ID',cp.domain_id,
          'VOCABULARY_ID',cp.vocabulary_id,
          'CONCEPT_CLASS_ID',cp.concept_class_id
        ),
        'isExcluded',cp.criteria='exclusion',
        'includeDescendants',true,
        'includeMapped',false
      )
  ) as j

  from @target_database_schema.concept_phenotypes cp
  where cp.criteria IN ('inclusion', 'exclusion')
  group by cp.phenotype
) as s0;