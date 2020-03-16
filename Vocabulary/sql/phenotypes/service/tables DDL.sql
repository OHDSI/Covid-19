DROP TABLE IF EXISTS @target_database_schema.concept_phenotypes;

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


DROP TABLE IF EXISTS @target_database_schema.mapping_review;
CREATE TABLE @target_database_schema.mapping_review
(
	phenotype varchar(255),
	batch int,
    source_concept_id integer,
	source_concept_name varchar(255),
	source_domain_id varchar(20),
	source_vocabulary_id varchar(20),
	source_concept_class_id varchar(20),
	source_standard_concept varchar(1),
	source_concept_code varchar(50),
	source_valid_start_date date,
	source_valid_end_date date,
	source_invalid_reason varchar(1),
    target_concept_id integer,
	target_concept_name varchar(255),
	target_domain_id varchar(20),
	target_vocabulary_id varchar(20),
	target_concept_class_id varchar(20),
	target_standard_concept varchar(1),
	target_concept_code varchar(50),
	target_valid_start_date date,
	target_valid_end_date date,
	target_invalid_reason varchar(1)
);

DROP TABLE IF EXISTS @target_database_schema.mapping_to_do;
CREATE TABLE @target_database_schema.mapping_to_do
(
	phenotype varchar(255),
	batch int,
    source_concept_id integer,
	source_concept_name varchar(255),
	source_domain_id varchar(20),
	source_vocabulary_id varchar(20),
	source_concept_class_id varchar(20),
	source_standard_concept varchar(1),
	source_concept_code varchar(50),
	source_valid_start_date date,
	source_valid_end_date date,
	source_invalid_reason varchar(1),
    target_concept_id integer,
	target_concept_name varchar(255),
	target_domain_id varchar(20),
	target_vocabulary_id varchar(20),
	target_concept_class_id varchar(20),
	target_standard_concept varchar(1),
	target_concept_code varchar(50),
	target_valid_start_date date,
	target_valid_end_date date,
	target_invalid_reason varchar(1)
);