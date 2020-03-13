DROP TABLE IF EXISTS @target_database_schema.concept_phenotypes
;

CREATE TABLE @target_database_schema.concept_phenotypes
(
	phenotype varchar(255),
	criteria varchar(20),
    concept_id integer,
	concept_name varchar(255),
	domain_id varchar(20),
	vocabulary_id varchar(20),
	concept_class_id varchar(20),
	standard_concept varchar(1),
	concept_code varchar(50),
	valid_start_date date,
	valid_end_date date,
	invalid_reason varchar(1)
);