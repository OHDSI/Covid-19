# The list of vocabulary for phenotypes

### This is to collect and verify existing vocabularies. Please don't use for phenotype definition. 
### As a result of this, a new version of vocabularies will be released very soon.
***

### Diagnosis

#### [Influenza and Influenza (complicated)](https://github.com/OHDSI/Covid-19/wiki/Influenza-and-Influenza-(complicated))
#### [Acute respiratory distress syndrome (ARDS)](https://github.com/OHDSI/Covid-19/wiki/Acute-respiratory-distress-syndrome-(ARDS))
#### [Pneumonia](https://github.com/OHDSI/Covid-19/wiki/Pneumonia)
#### [Novel vocabulary for COVID-19](https://github.com/OHDSI/Covid-19/wiki/Novel-vocabulary-for-COVID-19)
***

### Treatment Procedure

#### [Intubation](https://github.com/OHDSI/Covid-19/wiki/Intubation)
#### [Non-invasive ventilation](https://github.com/OHDSI/Covid-19/wiki/Non-invasive-ventilation)
#### [Extracorporeal membrane oxygenation (ECMO)](https://github.com/OHDSI/Covid-19/wiki/Extracorporeal-membrane-oxygenation-(ECMO))
#### [Invasive ventilation](https://github.com/OHDSI/Covid-19/wiki/Invasive-ventilation)
#### [Ventilator care](https://github.com/OHDSI/Covid-19/wiki/Ventilator-care)
***

### Comorbidity
#### [HIV&AIDS](https://github.com/OHDSI/Covid-19/wiki/HIV&AIDS)
#### [Asthma](https://github.com/OHDSI/Covid-19/wiki/Asthma)
#### [Chronic lung disease](https://github.com/OHDSI/Covid-19/wiki/Chronic-lung-disease)

***

## Completeness status:

Phenotype|Group|Priority|Status
|---|---|---|---|
Influenza|Diagnosis|H|Done
Influenza (complicated)|Diagnosis|H|Done
Influenza-like symptoms|Symptom||
Acute respiratory distress syndrome (ARDS)|Diagnosis|H|Done
Pneumonia|Diagnosis|H|Done
Confirmed Covid-19 case (diagnosis)|Diagnosis|H|
Presumptive Covid-19 case (diagnosis)|Diagnosis|H|
COVID-19 clinical forms?|Diagnosis||
Intubation|Treatment Procedure||Done
Non-invasive ventilation|Treatment Procedure||Done
Invasive ventilation|Treatment Procedure||Almost
Ventilator care|Treatment Procedure|H|ToDo
Extracorporeal membrane oxygenation (ECMO)|Treatment Procedure|H|Done
Continuous Renal Replacement therapy|Treatment Procedure||
Peritoneal dialysis|Treatment Procedure||
Covid-19 any testing|Test|H|
COVID-19 RNA respiratory sample testing|Test||
COVID-19 RNA blood testing|Test||
COVID-19 serology testing|Test||
Oxygen therapy|Treatment Drug|H|ToDo
Neuraminidase inhibitors|Treatment other Drug||
Cap-dependent endonuclease inhibitors|Treatment other Drug||
Antibacterial therapy|Treatment other Drug||
Antifungal therapy|Treatment other Drug||
Interferon alfa/beta|Treatment Drug||
Ribavirin|Treatment Drug||
Chloroquine/Hydroxychloroquine|Treatment Drug||
Lopinavir/Ritonavir|Treatment Drug||
Remdesivir|Treatment Drug||
Ganciclovir|Treatment Drug||
Stem cells|Treatment Drug||
Fever >38°C (100.4F)|Symptom|M|ToDo
Subjective fever (felt feverish)|Symptom||
Muscle aches (myalgia)|Symptom||
Runny nose (rhinorrhea)|Symptom|M|ToDo
Cough (new onset or worsening of chronic cough)|Symptom|M|ToDo
Productive cough|Symptom||
Shortness of breath (dyspnea)|Symptom|M|ToDo
Nausea or vomiting|Symptom||
Muscle aches (myalgia)|Symptom||
Abdominal pain|Symptom||
Diarrhea (≥3 loose/looser than normal stools/24hr period)|Symptom||
Fatigue|Symptom||
Throat pain|Symptom||
Haemoptysis|Symptom||
Breath rate > 30/min|Symptom||
Hypoxemia|Symptom|M|ToDo
CT/X-ray detected infiltration of lungs|Symptom|H|ToDo
Lymphopenia|Symptom||
Secondary nosocomial infection|Symptom||
Acute cardiac injury|Symptom||
ICU admission|Care type|H|ToDo
Home isolation|Care type||
Healthcare setting isolation|Care type||
Hospitalization|Care type||
Recovery|Outcome||
Death|Outcome||
Smoking|Comorbidity||
Hypertension|Comorbidity||
Cardiovascular disease|Comorbidity||
Chronic cardiac disease, including congenital heart disease|Comorbidity|H|ToDo
Cerebrovascular disease|Comorbidity||
Asthma|Comorbidity|H|Almost
Chronic lung disease (any, including asthma/emphysema/COPD)|Comorbidity|H|Almost
Chronic obstructive lung disease|Comorbidity||
Chronic lung disease (not asthma)|Comorbidity||
Chronic kidney disease|Comorbidity||
Chronic hematologic disease|Comorbidity||
HIV/AIDS|Comorbidity|H|Almost
Immunosuppresion (Immunocompromised condition)|Comorbidity|H|ToDo
Malignancy|Comorbidity||
Diabetes|Comorbidity|H|
Diabetes without complications|Comorbidity||
Diabetes with complications|Comorbidity||
Other metabolic disorders|Comorbidity||
Obesity|Comorbidity||
Liver disease|Comorbidity||
Chronic neurological disorder|Comorbidity||
Pregnancy|Comorbidity|L|
Pregnancy|Comorbidity|L|
Rheumatologic disorder|Comorbidity||
Dementia|Comorbidity||
Malnutrition|Comorbidity||
Exposure history to acute respiratory distress patient, covid-19 patient, hospitalized covid-19 patient)|Epedemiological event|H|
Travel history to endemic region (Wuhan, Hubei, China and others - Korea, Iran, Italy, etc.)|Epedemiological event|H|
Belonging to the risk groups (healthcare workers, border guards, etc.)|Epedemiological event||
Exposure to seafood|Epedemiological event||
Exposure to animal|Epedemiological event||


## To be processed:

### Intubation
|Domain|Concept_ID|Concept_Name|Vocabulary_ID|Source_vocabulary|Source_code_value
|---|---|---|---|---|---|
|Procedure|   |   |   |EDI|M5859;M0859|


### Oxygen therapy
|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
|Drug |   |   |   |EDI|M0040|

### ICU care
|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
|Procedure|   |   |   |EDI|AJ100~AJ390|


### Ventilator care

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
|Procedure|   |   |   |EDI|M5858|

### Extracorporeal membrane oxygenation (ECMO)

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
|Procedure|NA|   |   |EDI|O1903;O1905;O1890|

### Continuous Renal Replacement therapy

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
|Procedure|NA|   |   |EDI|O7031;O7032|
|Procedure|NA|   |   |EDI|O7033;O7034|
|Procedure|NA|   |   |EDI|O7051;O7052|
|Procedure|NA|   |   |EDI|O7053;O7054|