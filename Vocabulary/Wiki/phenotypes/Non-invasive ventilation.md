## [Non-invasive ventilation](https://github.com/OHDSI/Covid-19/blob/vocabularies_for_phenotypes/Vocabulary/sql/phenotypes/Non-invasive%20ventilation.sql):

## Included to concept set:
|domain_id|concept_id|concept_name|concept_code|voc_id
|---|---|---|---|---|
Observation|4039924|Nasal ventilation therapy|229312009|SNOMED
Procedure|4244053|Bennett respirator therapy|38282001|SNOMED
Procedure|36676550|Bird respiratory therapy|773454006|SNOMED
Procedure|4085542|Cuirasse ventilation|281508008|SNOMED
Procedure|4080896|Domiciliary ventilation|276737004|SNOMED
Procedure|4254209|Intermittent positive pressure ventilation via bag and mask|408852001|SNOMED
Procedure|4332501|Management of noninvasive mechanical ventilation|430191008|SNOMED
Procedure|37206832|Mechanical insufflation exsufflation|787180006|SNOMED
Procedure|4177224|Noninvasive ventilation|428311008|SNOMED
Procedure|4006318|Respiratory assist, manual|11140008|SNOMED
Procedure|4202819|Treatment by iron lung|52729008|SNOMED


<details><summary><strong>Click to expand - Mapping list</strong></summary>
<p>

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
Observation|4039924|Nasal ventilation therapy|SNOMED|Read|Z6M4.00
Procedure|4139542|Bag valve mask ventilation|SNOMED|OPCS4|E85.4
Procedure|4139542|Bag valve mask ventilation|SNOMED|Read|7458300
Procedure|4072514|Lung inflation by intermittent compression of reservoir bag|SNOMED|Read|Z6H1.00; Z6H1.11
Procedure|4332501|Management of noninvasive mechanical ventilation|SNOMED|SUS|0301050015; 0301050066
Procedure|4039925|Manual hyperinflation|SNOMED|Read|Z6H2.00
Procedure|4177224|Noninvasive ventilation|SNOMED|ICD9Proc|93.90
Procedure|4177224|Noninvasive ventilation|SNOMED|ICD9ProcCN|93.90; 93.9000; 93.9001
Procedure|4177224|Noninvasive ventilation|SNOMED|OPCS4|E85.2
Procedure|4177224|Noninvasive ventilation|SNOMED|Read|7458100
Procedure|4006318|Respiratory assist, manual|SNOMED|Read|Z6H..00; Z6H..11; Z6H..12; Z6H..13


</p>
</details>

<details><summary><strong>Click to expand - Detailed Mapping list</strong></summary>
<p>

|source_code_description|source_code|source_voc_id|concept_id|concept_name|concept_code|concept_class_id|domain_id|voc_id
|---|---|---|---|---|---|---|---|---|
ACCOMPANIMENT AND DOMESTIC ASSESSMENT OF PATIENT SUBMITTED TO NON-INVASIVE MECHANICAL VENTILATION - PATIENT / MONTH|0301050015|SUS|4332501|Management of noninvasive mechanical ventilation|430191008|Procedure|Procedure|SNOMED
INSTALLATION / MAINTENANCE OF NON-INVASIVE MECHANICAL VENTILATION DOMICILE|0301050066|SUS|4332501|Management of noninvasive mechanical ventilation|430191008|Procedure|Procedure|SNOMED
Non-invasive ventilation|7458100|Read|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Bag valve mask ventilation|7458300|Read|4139542|Bag valve mask ventilation|425447009|Procedure|Procedure|SNOMED
Non-invasive mechanical ventilation|93.90|ICD9Proc|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Non-invasive mechanical ventilation|93.90|ICD9ProcCN|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Non-invasive mechanical ventilation|93.9000|ICD9ProcCN|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Continuous positive airway pressure (CPAP) (machine translation)|93.9001|ICD9ProcCN|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Non-invasive ventilation NEC|E85.2|OPCS4|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Bag valve mask ventilation|E85.4|OPCS4|4139542|Bag valve mask ventilation|425447009|Procedure|Procedure|SNOMED
Manually assisted breathing|Z6H..00|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Lung inflation by intermittent compression of reservoir bag|Z6H1.00|Read|4072514|Lung inflation by intermittent compression of reservoir bag|243140006|Procedure|Procedure|SNOMED
Hand ventilation|Z6H..11|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Hand bagging|Z6H1.11|Read|4072514|Lung inflation by intermittent compression of reservoir bag|243140006|Procedure|Procedure|SNOMED
Manual ventilation|Z6H..12|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Hand ventilation - bagging|Z6H..13|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Manual hyperinflation|Z6H2.00|Read|4039925|Manual hyperinflation|229313004|Procedure|Procedure|SNOMED
Nasal ventilation therapy|Z6M4.00|Read|4039924|Nasal ventilation therapy|229312009|Procedure|Observation|SNOMED

</p>
</details>


## Not included / to be excluded from concept set:
Not needed

***