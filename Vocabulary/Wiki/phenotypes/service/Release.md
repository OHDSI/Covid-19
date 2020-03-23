# Under construction - will be released soon
# ETL instructions for conversions of data assets for the purpose of research of COVID-19.

### Friends: This is an ad-hoc release for the purpose of creating harmonized data assets for our Covid-19 Study-a-thon on the 26-Mar-2020. Here is what you need to know about this release and how it differs from the usual releases:

  
 ### 1. Revised mapping of new and existing concepts.

We identified relevant [existing concepts](https://github.com/OHDSI/COVID-19/tree/vocabularies_for_phenotypes/Vocabulary/sql/phenotypes) potentially used in cohort definitions for COVID-19 study-a-thon and subsequent research.
[We worked on](https://github.com/OHDSI/Covid-19/wiki/Vocabularies-Progress-status):

#### 1.1 Existing mappings review/update.
#### 1.2 De-novo mapping of unmapped concepts (ICD10, ICD10CM, ICD10CN, KCD7, Read, EDI, LOINC).
#### 1.3 Domain reassignments, e.g. some tests to Measurement Domain & [suspected diseases](http://athena.ohdsi.org/search-terms/terms/4219847) to Condition Domain. 


<details><summary>Click to expand - Concepts with updated Domain </summary>
<p>

old_domain_id|new_domain_id|concept_id|concept_name
|---|---|---|---|
Observation|Condition|4219847|Disease suspected|SNOMED
Condition|Measurement|764933|Virus not detected|SNOMED
Condition|Measurement|4038778|O/E -skin temperature abnormal|SNOMED
Condition|Measurement|4039791|O/E - rectal temperature|SNOMED
Condition|Measurement|4039792|O/E - core temperature|SNOMED
Condition|Measurement|4039794|O/E - temperature normal|SNOMED
Condition|Measurement|4039795|O/E - temperature elevated|SNOMED
Condition|Measurement|4039796|O/E - hyperpyrexia - greater than 40.5 degrees Celsius|SNOMED
Condition|Measurement|4040104|O/E - groin temperature|SNOMED
Condition|Measurement|4040106|O/E - temperature low|SNOMED
Condition|Measurement|4040267|O/E - fever - general|SNOMED
Condition|Measurement|4040474|O/E - method fever registered|SNOMED
Condition|Measurement|4040476|O/E - axillary temperature|SNOMED
Condition|Measurement|4061901|O/E - rate of respiration|SNOMED
Condition|Measurement|4077057|O/E - oral temperature|SNOMED
Condition|Measurement|4141062|Fever greater than 100.4 Fahrenheit|SNOMED
Condition|Measurement|4151775|O/E - tympanic temperature|SNOMED
Condition|Measurement|4164378|O/E - hyperpyrexia|SNOMED
Condition|Measurement|4231947|Virus present|SNOMED
Condition|Measurement|4276586|Finding of HIV status|SNOMED
Condition|Measurement|37310281|2019 novel coronavirus not detected|SNOMED
Condition|Measurement|46272568|Bacteria present|SNOMED



</p>
</details>
 
> **Note: All the descendants inherit the parent's Domain.
 
***
 
### 2. New COVID-19 related concept.

A number of vocabularies updated and added concepts around COVID-19. We incorporated them into Standard concepts (SNOMED, LOINC, CPT4, HCPCS) and non-standard Source concepts (ICD10, KCD7, ICD10CN).

<details><summary>Click to expand - New concepts added</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id|concept_code
|---|---|---|---|---|
700360|Infectious agent detection by nucleic acid (DNA or RNA); severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) (Coronavirus disease [COVID-19]), amplified probe technique|Procedure|CPT4|87635
40218805|Testing for SARS-CoV-2 in CDC laboratory|Observation|HCPCS|U0001
40218804|Testing for SARS-CoV-2 in non-CDC laboratory|Observation|HCPCS|U0002
45756093|Emergency use of U07.1 \| Disease caused by severe acute respiratory syndrome coronavirus 2|Condition|ICD10|U07.1
710159|Confirmed COVID-19, excluding pneumonia (machine translation)|Observation|ICD10CN|U07.100x002
710158|COVID-19 (machine translation)|Observation|ICD10CN|U07.100
710155|COVID-19 pneumonia (machine translation)|Observation|ICD10CN|U07.100x003
710156|COVID-19 pneumonia (machine translation)|Observation|ICD10CN|U07.100x001
710160|Emergency use of U07.1 \| Disease caused by severe acute respiratory syndrome coronavirus 2|Observation|ICD10CN|U07.1
710157|Suspected case of COVID-19 (machine translation)|Procedure|ICD10CN|Z03.800x001
42501115|Emergency use of U07.1 \| Disease caused by severe acute respiratory syndrome coronavirus 2|Condition|KCD7|U07.1
586414|Novel coronavirus infection|Condition|KCD7|U18.1
586415|Provisional assignment of new diseases or emergency use|Condition|KCD7|U18
706164|Middle East respiratory syndrome coronavirus (MERS-CoV) RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC|94501-4
706162|Respiratory viral pathogens DNA and RNA panel - Respiratory specimen Qualitative by NAA with probe detection|Measurement|LOINC|94499-1
706166|SARS coronavirus 2 E gene [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94509-7
706174|SARS coronavirus 2 E gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94315-9
706181|SARS coronavirus 2 IgG Ab [Presence] in Serum or Plasma by Immunoassay|Measurement|LOINC|94507-1
706177|SARS coronavirus 2 IgG Ab [Units/volume] in Serum or Plasma by Immunoassay|Measurement|LOINC|94505-5
706179|SARS coronavirus 2 IgG and IgM panel - Serum or Plasma by Immunoassay|Measurement|LOINC|94504-8
706176|SARS coronavirus 2 IgG and IgM panel - Serum or Plasma Qualitative by Immunoassay|Measurement|LOINC|94503-0
706180|SARS coronavirus 2 IgM Ab [Presence] in Serum or Plasma by Immunoassay|Measurement|LOINC|94508-9
706178|SARS coronavirus 2 IgM Ab [Units/volume] in Serum or Plasma by Immunoassay|Measurement|LOINC|94506-3
706167|SARS coronavirus 2 N gene [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94510-5
706157|SARS coronavirus 2 N gene [Cycle Threshold #] in Unspecified specimen by Nucleic acid amplification using primer-probe set N1|Measurement|LOINC|94311-8
706155|SARS coronavirus 2 N gene [Cycle Threshold #] in Unspecified specimen by Nucleic acid amplification using primer-probe set N2|Measurement|LOINC|94312-6
706161|SARS coronavirus 2 N gene [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC|94533-7
706175|SARS coronavirus 2 N gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94316-7
706156|SARS coronavirus 2 N gene [Presence] in Unspecified specimen by Nucleic acid amplification using primer-probe set N1|Measurement|LOINC|94307-6
706154|SARS coronavirus 2 N gene [Presence] in Unspecified specimen by Nucleic acid amplification using primer-probe set N2|Measurement|LOINC|94308-4
706168|SARS coronavirus 2 ORF1ab region [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94511-3
706160|SARS coronavirus 2 RdRp gene [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC|94534-5
706173|SARS coronavirus 2 RdRp gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94314-2
706158|SARS Coronavirus 2 RNA panel - Respiratory specimen by NAA with probe detection|Measurement|LOINC|94531-1
706169|SARS Coronavirus 2 RNA panel - Unspecified specimen by NAA with probe detection|Measurement|LOINC|94306-8
706163|SARS coronavirus 2 RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC|94500-6
706170|SARS coronavirus 2 RNA [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94309-2
706159|SARS coronavirus+SARS-like coronavirus+SARS coronavirus 2+MERS coronavirus RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC|94532-9
706165|SARS coronavirus+SARS-like coronavirus+SARS coronavirus 2 RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC|94502-2
706172|SARS-like Coronavirus N gene [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94313-4
706171|SARS-like Coronavirus N gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC|94310-0
37310269|Disease caused by 2019 novel coronavirus|Condition|SNOMED|1240751000000100
37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|Condition|SNOMED|840539006
37310284|Encephalopathy caused by 2019 novel coronavirus|Condition|SNOMED|1240561000000108
37310283|Gastroenteritis caused by 2019 novel coronavirus|Condition|SNOMED|1240571000000101
37310286|Infection of upper respiratory tract caused by 2019 novel coronavirus|Condition|SNOMED|1240541000000107
37310287|Myocarditis caused by 2019 novel coronavirus|Condition|SNOMED|1240531000000103
37310254|Otitis media caused by 2019 novel coronavirus|Condition|SNOMED|1240521000000100
37310285|Pneumonia caused by 2019 novel coronavirus|Condition|SNOMED|1240551000000105
37310268|Suspected disease caused by 2019 novel coronavirus|Condition|SNOMED|1240761000000102
37311060|Suspected disease caused by severe acute respiratory coronavirus 2|Condition|SNOMED|840544004
37310282|2019 novel coronavirus detected|Measurement|SNOMED|1240581000000104
37310281|2019 novel coronavirus not detected|Measurement|SNOMED|1240591000000102
37310255|Detection of 2019 novel coronavirus using polymerase chain reaction technique|Measurement|SNOMED|1240511000000106
37310258|Measurement of 2019 novel coronavirus antibody|Measurement|SNOMED|1240461000000109
37310257|Measurement of 2019 novel coronavirus antigen|Measurement|SNOMED|1240471000000102
37310266|2019 novel coronavirus|Observation|SNOMED|1240381000000105
37310270|2019 novel coronavirus serology|Observation|SNOMED|1240741000000103
37310277|2019 novel coronavirus vaccination contraindicated|Observation|SNOMED|1240661000000107
37310278|2019 novel coronavirus vaccination declined|Observation|SNOMED|1240651000000109
37310267|2019 novel coronavirus vaccination invitation short message service text message sent|Observation|SNOMED|1240781000000106
37310275|2019 novel coronavirus vaccination not done|Observation|SNOMED|1240681000000103
37310276|2019 novel coronavirus vaccination not indicated|Observation|SNOMED|1240671000000100
37310274|2019 novel coronavirus vaccine not available|Observation|SNOMED|1240701000000101
37310271|Advice given about 2019 novel coronavirus by telephone|Observation|SNOMED|1240731000000107
37310272|Advice given about 2019 novel coronavirus infection|Observation|SNOMED|1240721000000105
37310264|Antibody to 2019 novel coronavirus|Observation|SNOMED|1240401000000105
37311063|Antibody to severe acute respiratory syndrome coronavirus 2|Observation|SNOMED|840535000
37310265|Antigen of 2019 novel coronavirus|Observation|SNOMED|1240391000000107
37311062|Antigen of severe acute respiratory syndrome coronavirus 2|Observation|SNOMED|840536004
37310260|Close exposure to 2019 novel coronavirus infection|Observation|SNOMED|1240441000000108
37310279|Did not attend 2019 novel coronavirus vaccination|Observation|SNOMED|1240631000000102
37310273|Educated about 2019 novel coronavirus infection|Observation|SNOMED|1240711000000104
37310261|Exposure to 2019 novel coronavirus infection|Observation|SNOMED|1240431000000104
37311059|Exposure to severe acute respiratory syndrome coronavirus 2|Observation|SNOMED|840546002
37310280|High priority for 2019 novel coronavirus vaccination|Observation|SNOMED|1240601000000108
37310263|Ribonucleic acid of 2019 novel coronavirus|Observation|SNOMED|1240411000000107
37310262|Serotype 2019 novel coronavirus|Observation|SNOMED|1240421000000101
37311065|Severe acute respiratory syndrome coronavirus 2|Observation|SNOMED|840533007
37310259|Telephone consultation for suspected 2019 novel coronavirus|Observation|SNOMED|1240451000000106
37310256|2019 novel coronavirus vaccination|Procedure|SNOMED|1240491000000103
37311064|Severe acute respiratory syndrome coronavirus 2 vaccination|Procedure|SNOMED|840534001

</p>
</details>

There are some duplicates among them, so we made them non-Standard and remapped to unified Standard equivalent.

<details><summary>Click to expand - Remapped duplicates list</summary>
<p>

concept_id|concept_name|vocabulary_id|relationship_id|target_concept_id|target_concept_name|target_vocabulary_id
|---|---|---|---|---|---|---|
37310256|2019 novel coronavirus vaccination|SNOMED|Maps to|37311064|Severe acute respiratory syndrome coronavirus 2 vaccination|SNOMED
37310261|Exposure to 2019 novel coronavirus infection|SNOMED|Maps to|37311059|Exposure to severe acute respiratory syndrome coronavirus 2|SNOMED
37310264|Antibody to 2019 novel coronavirus|SNOMED|Maps to|37311063|Antibody to severe acute respiratory syndrome coronavirus 2|SNOMED
37310265|Antigen of 2019 novel coronavirus|SNOMED|Maps to|37311062|Antigen of severe acute respiratory syndrome coronavirus 2|SNOMED
37310266|2019 novel coronavirus|SNOMED|Maps to|37311065|Severe acute respiratory syndrome coronavirus 2|SNOMED
37310268|Suspected disease caused by 2019 novel coronavirus|SNOMED|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
37310269|Disease caused by 2019 novel coronavirus|SNOMED|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
37311060|Suspected disease caused by severe acute respiratory coronavirus 2|SNOMED|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED


</p>
</details>

***

### 3. New OMOP concepts.

In order to support Standard coding with COVID-19 related concepts, we created 64 new concepts in our ‘OMOP Extension’ vocabulary of different Domains. They were placed into the existing SNOMED and LOINC hierarchy.

<details><summary>Click to expand - New OMOP concepts added</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id
|---|---|---|---|
756023|Acute bronchitis caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756044|Acute respiratory distress syndrome (ARDS) caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756061|Asymptomatic infection caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756031|Bronchitis caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756081|Infection of lower respiratory tract caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756039|Respiratory infection caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756029|Detection of severe acute respiratory syndrome coronavirus 2 in Respiratory specimen|Measurement|OMOP Extension
756065|Detection of severe acute respiratory syndrome coronavirus 2 in Unspecified specimen|Measurement|OMOP Extension
756085|Detection of severe acute respiratory syndrome coronavirus 2 using polymerase chain reaction technique in Respiratory specimen|Measurement|OMOP Extension
756084|Detection of severe acute respiratory syndrome coronavirus 2 using polymerase chain reaction technique in Unspecified specimen|Measurement|OMOP Extension
756055|Measurement of severe acute respiratory syndrome coronavirus 2|Measurement|OMOP Extension
756063|History of Animal exposure in the 14 days prior to illness onset|Observation|OMOP Extension
756060|History of Close contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756036|History of Close contact with patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756078|History of Close contact with patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756024|History of Close contact with patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756028|History of Close contact with symptomatic patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756040|History of Close exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756042|History of Community contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756030|History of Contact with live/dead animals, raw meat or insect bites in the 14 days prior to illness onset|Observation|OMOP Extension
756070|History of Direct contact with animals in countries where COVID-19 is known to be circulating in animal populations or where human infections have occurred as a result of presumed zoonotic transmission in the 14 days prior to illness onset|Observation|OMOP Extension
756052|History of Exposure to patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756038|History of Exposure to patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756025|History of Exposure to patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756034|History of Exposure to patient with severe acute lower respiratory distress (SARS) of unknown etiology in the 14 days prior to illness onset|Observation|OMOP Extension
756066|History of Exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756073|History of Healthcare contact of Healthcare worker with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756058|History of Healthcare contact of Patient with another patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756033|History of Healthcare contact of Visitor with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756067|History of Healthcare contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756080|History of Household contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756071|History of Presence in a healthcare facility where disease caused by severe acute respiratory syndrome coronavirus 2 has been managed in the 14 days prior to illness onset|Observation|OMOP Extension
756054|History of Presence in a laboratory handling suspected or confirmed cases samples of disease caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756049|History of Suspected exposure (but ruled out after evaluation) to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756048|History of Suspected exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756043|History of travel to an area with documented cases of infection caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756074|History of travel to China in the 14 days prior to illness onset|Observation|OMOP Extension
756032|History of travel to Hubei in the 14 days prior to illness onset|Observation|OMOP Extension
756059|History of travel to Iran in the 14 days prior to illness onset|Observation|OMOP Extension
756053|History of travel to Italy in the 14 days prior to illness onset|Observation|OMOP Extension
756056|History of travel to South Korea in the 14 days prior to illness onset|Observation|OMOP Extension
756026|History of travel to Wuhan in the 14 days prior to illness onset|Observation|OMOP Extension
756046|Person Employed as a Healthcare Worker|Observation|OMOP Extension
756051|Person Employed in a Microbiology laboratory|Observation|OMOP Extension
756057|Travel in the 14 days prior to illness onset|Observation|OMOP Extension
756077|Close contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756069|Close contact with patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756076|Close contact with patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756068|Close contact with patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756041|Close contact with symptomatic patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756062|Community contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756022|Exposure to patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756075|Exposure to patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756082|Exposure to patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756050|Exposure to patient with severe acute lower respiratory distress (SARS) of unknown etiology|Observation|OMOP Extension
756047|Healthcare contact of Healthcare worker with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756035|Healthcare contact of Patient with another patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756079|Healthcare contact of Visitor with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756027|Healthcare contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756045|Household contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756072|Presence in a healthcare facility where disease caused by severe acute respiratory syndrome coronavirus 2 has been managed|Observation|OMOP Extension
756037|Presence in a laboratory handling suspected or confirmed cases samples of disease caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756064|Suspected exposure (but ruled out after evaluation) to severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756083|Suspected exposure to severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension

</p>
</details>

> **Note: These are concepts that might be overwritten later by the authoritative vocabularies. But we will deprecate and upgrade them appropriately if and when that happens.

***

### 4. Instructions for ETL.

#### 4.1 The usage of previously existing codes for COVID-19 coding in timing context.

When COVID-19 appeared, the coding systems around the world were not able to provide immediate solution for coding. On this reason, the coding was and being performed by the usage of previously existing non-specific codes or their combinations.
To address this issue, we do not change the previously existing mappings for the codes that are not specifically created for the COVID-19. This is a task of ETL to asses such codes in the timing context and to map them properly:
- using the old mappings from concept_relationship table (when coding is coming from pre-epidemic period);
- using the rules described below (when coding is coming from epidemic period).

***

#### 4.2 The COVID-19 diagnosis Standard terminology.
SNOMED [‘Disease caused by severe acute respiratory syndrome coronavirus 2’](http://athena.ohdsi.org/search-terms/terms/37311061) is the main representative concept, with a mixed pool (SNOMED, OMOP Extension) of concepts hierarchically under this concept, which should be selected based on source granularity.

<details><summary>Click to expand - COVID-19 diagnosis Standard terminology</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id
|---|---|---|---|
756023|Acute bronchitis caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756044|Acute respiratory distress syndrome (ARDS) caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756061|Asymptomatic infection caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756031|Bronchitis caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756081|Infection of lower respiratory tract caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
756039|Respiratory infection caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|Condition|SNOMED
37310284|Encephalopathy caused by 2019 novel coronavirus|Condition|SNOMED
37310283|Gastroenteritis caused by 2019 novel coronavirus|Condition|SNOMED
37310286|Infection of upper respiratory tract caused by 2019 novel coronavirus|Condition|SNOMED
37310287|Myocarditis caused by 2019 novel coronavirus|Condition|SNOMED
37310254|Otitis media caused by 2019 novel coronavirus|Condition|SNOMED
37310285|Pneumonia caused by 2019 novel coronavirus|Condition|SNOMED


</p>
</details>


***

#### 4.3 Emergency use codes.
Emergency use codes (ICD10, KCD7, ICD10CN) were mapped in vocabularies to SNOMED [‘Disease caused by severe acute respiratory syndrome coronavirus 2’](http://athena.ohdsi.org/search-terms/terms/37311061) and might be ETLed using the concept_relationship if coded separately. In case of using of dual coding, the combination of COVID-19-specific code and manifestations-specific code should be ETLed in the same way as described below for ICD10CM.

<details><summary>Click to expand - Emergency use codes and mapping</summary>
<p>

concept_id|concept_name|concept_code|vocabulary_id|relationship_id|target_concept_id|target_concept_name|target_vocabulary_id
|---|---|---|---|---|---|---|---|
586414|Novel coronavirus infection|U18.1|KCD7|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
586415|Provisional assignment of new diseases or emergency use|U18|KCD7|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
710155|COVID-19 pneumonia (machine translation)|U07.100x003|ICD10CN|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
710156|COVID-19 pneumonia (machine translation)|U07.100x001|ICD10CN|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
710157|Suspected case of COVID-19 (machine translation)|Z03.800x001|ICD10CN|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
710158|COVID-19 (machine translation)|U07.100|ICD10CN|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
710159|Confirmed COVID-19, excluding pneumonia (machine translation)|U07.100x002|ICD10CN|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
710160|Emergency use of U07.1 \| Disease caused by severe acute respiratory syndrome coronavirus 2|U07.1|ICD10CN|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
42501115|Emergency use of U07.1 \| Disease caused by severe acute respiratory syndrome coronavirus 2|U07.1|KCD7|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED
45756093|Emergency use of U07.1 \| Disease caused by severe acute respiratory syndrome coronavirus 2|U07.1|ICD10|Maps to|37311061|Disease caused by severe acute respiratory syndrome coronavirus 2|SNOMED


</p>
</details>

***

#### 4.4 ICD10CM mapping to Standard terminology.

For ICD10CM, instead of adding COVID-19 directly, the CDC introduced [coding guidelines](https://www.cdc.gov/nchs/data/icd/ICD-10-CM-Official-Coding-Gudance-Interim-Advice-coronavirus-feb-20-2020.pdf) based on post-coordination of codes. They have to be ETLed as following:

<details><summary>Click to expand - ICD10CM mapping example</summary>
<p>

source_vocabulary_id|source_code|target_concept_id|target_concept_name|target_domain_id|target_vocabulary_id
|---|---|---|---|---|---|
ICD10CM|B97.29+J98.8|756039|Respiratory infection caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
ICD10CM|B97.29+J22|756081|Infection of lower respiratory tract caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
ICD10CM|B97.29+J40|756031|Bronchitis caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
ICD10CM|B97.29+J20.8|756023|Acute bronchitis caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension
ICD10CM|B97.29+J12.89|37310285|Pneumonia caused by 2019 novel coronavirus|Condition|SNOMED
ICD10CM|B97.29+J80|756044|Acute respiratory distress syndrome (ARDS) caused by severe acute respiratory syndrome coronavirus 2|Condition|OMOP Extension

</p>
</details>


> **Note: These mappings are NOT incorporated to the concept_relationship table and just demonstrate the example of how the source data should be converted during ETL.

***

#### 4.5 New Visit introduction.
In order to represent the fact of patient's isolation or being under investigation, the Visit concepts were added. Such information should be ETLs in the following way:

<details><summary>Click to expand - Mapping to Visit Domain</summary>
<p>

source_vocabulary_id|source_code|target_concept_id|target_concept_name|target_domain_id|target_vocabulary_id
|---|---|---|---|---|---|
CDC case definition|Person under investigation|32761|Person Under Investigation (PUI)|Visit|Visit
|-|-|32759|Home isolation|Visit|Visit
|-|-|32760|Isolation in inpatient setting|Visit|Visit

</p>
</details> 

> **Note: These mappings are NOT incorporated to the concept_relationship table and just demonstrate the example of how the source data should be converted during ETL.

***

#### 4.6 COVID-19 case definition and suspected COVID-19.
A representation of the patient's status (in accordance to COVID-19 case defenition) should be implemented using the condition_status_concept_id field in the following way:

<details><summary>Click to expand - Mapping to Condition Status</summary>
<p>

source_vocabulary_id|source_code|target_concept_id|target_concept_name|target_domain_id|target_vocabulary_id
|---|---|---|---|---|---|
WHO/ECDC case definition|Suspected case|4217851|Suspected|Observation|SNOMED
ICD10CM|Z20.828|4217851|Suspected|Observation|SNOMED
WHO/ECDC case definition|Probable case|764222|Probable|Observation|SNOMED
CDC case definition|Presumptive positive case|36715206|Presumptive positive|Meas Value|SNOMED
CDC case definition|Laboratory-confirmed case|4194404|Disorder confirmed|Observation|SNOMED
WHO/ECDC case definition|Confirmed case|4194404|Disorder confirmed|Observation|SNOMED
ICD10CM|B97.29|4194404|Disorder confirmed|Observation|SNOMED

</p>
</details>

> **Note: These mappings are NOT incorporated to the concept_relationship table and just demonstrate the example of how the source data should be converted during ETL.

***

#### 4.7 Testing laboratory type.
In order to represent the laboratory that performed testing, the measurement_type_concept_id field should be used in the following way:

<details><summary>Click to expand - Mapping to measurement type</summary>
<p>

source_vocabulary_id|source_code|target_concept_id|target_concept_name|target_domain_id|target_vocabulary_id
|---|---|---|---|---|---|
HCPCS|U0001|32762|Reference Lab result|Type Concept|Meas Type
HCPCS|U0002|44818702|Lab result|Type Concept|Meas Type

</p>
</details>

> **Note: These mappings are NOT incorporated to the concept_relationship table and just demonstrate the example of how the source data should be converted during ETL.

***

#### 4.8 SARS-CoV-2 testing Standard terminology.

OMOP Extension [‘Measurement of severe acute respiratory syndrome coronavirus 2’](http://athena.ohdsi.org/search-terms/terms/756055) is the main representative concept, with a mixed pool (SNOMED, OMOP Extension, LOINC, CPT4, HCPCS) of concepts hierarchically under this concept, which should be selected based on source granularity.

<details><summary>Click to expand - SARS-CoV-2 testing Standard terminology</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id
|---|---|---|---|
700360|Infectious agent detection by nucleic acid (DNA or RNA); severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) (Coronavirus disease [COVID-19]), amplified probe technique|Procedure|CPT4
40218805|Testing for SARS-CoV-2 in CDC laboratory|Observation|HCPCS
40218804|Testing for SARS-CoV-2 in non-CDC laboratory|Observation|HCPCS
706164|Middle East respiratory syndrome coronavirus (MERS-CoV) RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC
706162|Respiratory viral pathogens DNA and RNA panel - Respiratory specimen Qualitative by NAA with probe detection|Measurement|LOINC
706166|SARS coronavirus 2 E gene [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706174|SARS coronavirus 2 E gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706181|SARS coronavirus 2 IgG Ab [Presence] in Serum or Plasma by Immunoassay|Measurement|LOINC
706177|SARS coronavirus 2 IgG Ab [Units/volume] in Serum or Plasma by Immunoassay|Measurement|LOINC
706179|SARS coronavirus 2 IgG and IgM panel - Serum or Plasma by Immunoassay|Measurement|LOINC
706176|SARS coronavirus 2 IgG and IgM panel - Serum or Plasma Qualitative by Immunoassay|Measurement|LOINC
706180|SARS coronavirus 2 IgM Ab [Presence] in Serum or Plasma by Immunoassay|Measurement|LOINC
706178|SARS coronavirus 2 IgM Ab [Units/volume] in Serum or Plasma by Immunoassay|Measurement|LOINC
706167|SARS coronavirus 2 N gene [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706157|SARS coronavirus 2 N gene [Cycle Threshold #] in Unspecified specimen by Nucleic acid amplification using primer-probe set N1|Measurement|LOINC
706155|SARS coronavirus 2 N gene [Cycle Threshold #] in Unspecified specimen by Nucleic acid amplification using primer-probe set N2|Measurement|LOINC
706161|SARS coronavirus 2 N gene [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC
706175|SARS coronavirus 2 N gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706156|SARS coronavirus 2 N gene [Presence] in Unspecified specimen by Nucleic acid amplification using primer-probe set N1|Measurement|LOINC
706154|SARS coronavirus 2 N gene [Presence] in Unspecified specimen by Nucleic acid amplification using primer-probe set N2|Measurement|LOINC
706168|SARS coronavirus 2 ORF1ab region [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706160|SARS coronavirus 2 RdRp gene [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC
706173|SARS coronavirus 2 RdRp gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706158|SARS Coronavirus 2 RNA panel - Respiratory specimen by NAA with probe detection|Measurement|LOINC
706169|SARS Coronavirus 2 RNA panel - Unspecified specimen by NAA with probe detection|Measurement|LOINC
706163|SARS coronavirus 2 RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC
706170|SARS coronavirus 2 RNA [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706159|SARS coronavirus+SARS-like coronavirus+SARS coronavirus 2+MERS coronavirus RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC
706165|SARS coronavirus+SARS-like coronavirus+SARS coronavirus 2 RNA [Presence] in Respiratory specimen by NAA with probe detection|Measurement|LOINC
706172|SARS-like Coronavirus N gene [Cycle Threshold #] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
706171|SARS-like Coronavirus N gene [Presence] in Unspecified specimen by NAA with probe detection|Measurement|LOINC
756029|Detection of severe acute respiratory syndrome coronavirus 2 in Respiratory specimen|Measurement|OMOP Extension
756065|Detection of severe acute respiratory syndrome coronavirus 2 in Unspecified specimen|Measurement|OMOP Extension
756085|Detection of severe acute respiratory syndrome coronavirus 2 using polymerase chain reaction technique in Respiratory specimen|Measurement|OMOP Extension
756084|Detection of severe acute respiratory syndrome coronavirus 2 using polymerase chain reaction technique in Unspecified specimen|Measurement|OMOP Extension
756055|Measurement of severe acute respiratory syndrome coronavirus 2|Measurement|OMOP Extension
37310282|2019 novel coronavirus detected|Measurement|SNOMED
37310281|2019 novel coronavirus not detected|Measurement|SNOMED
37310255|Detection of 2019 novel coronavirus using polymerase chain reaction technique|Measurement|SNOMED
37310258|Measurement of 2019 novel coronavirus antibody|Measurement|SNOMED
37310257|Measurement of 2019 novel coronavirus antigen|Measurement|SNOMED

</p>
</details>

> **Note: There are 2 Measurement concepts that comprise the result of the measurement by itself (['2019 novel coronavirus detected'](http://athena.ohdsi.org/search-terms/terms/37310282) and '[2019 novel coronavirus not detected'](http://athena.ohdsi.org/search-terms/terms/37310281)). The rest expect the result in the value_as_concept_id or value_as_number fields.


***

#### 4.9 SARS-CoV-2 Exposure/Suspected exposure Standard terminology.


SNOMED [‘Exposure to severe acute respiratory syndrome coronavirus 2’](http://athena.ohdsi.org/search-terms/terms/37311059) is the main representative concept, with a mixed pool (SNOMED, OMOP Extension) of concepts hierarchically under this concept, which should be selected based on source granularity.
This hierarchy includes both confirmed and suspected exposures placed under the OMOP Extension ['Suspected exposure to severe acute respiratory syndrome coronavirus 2'](http://athena.ohdsi.org/search-terms/terms/756083) concept.


<details><summary>Click to expand - SARS-CoV-2 Exposure/Suspected exposure Standard terminology</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id
|---|---|---|---|
756046|Person Employed as a Healthcare Worker|Observation|OMOP Extension
756051|Person Employed in a Microbiology laboratory|Observation|OMOP Extension
756077|Close contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756069|Close contact with patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756076|Close contact with patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756068|Close contact with patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756041|Close contact with symptomatic patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756062|Community contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756022|Exposure to patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756075|Exposure to patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756082|Exposure to patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756050|Exposure to patient with severe acute lower respiratory distress (SARS) of unknown etiology|Observation|OMOP Extension
756047|Healthcare contact of Healthcare worker with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756035|Healthcare contact of Patient with another patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756079|Healthcare contact of Visitor with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756027|Healthcare contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756045|Household contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756072|Presence in a healthcare facility where disease caused by severe acute respiratory syndrome coronavirus 2 has been managed|Observation|OMOP Extension
756037|Presence in a laboratory handling suspected or confirmed cases samples of disease caused by severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756064|Suspected exposure (but ruled out after evaluation) to severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
756083|Suspected exposure to severe acute respiratory syndrome coronavirus 2|Observation|OMOP Extension
37310260|Close exposure to 2019 novel coronavirus infection|Observation|SNOMED
37311059|Exposure to severe acute respiratory syndrome coronavirus 2|Observation|SNOMED

</p>
</details>


> **Note: These concepts should be used when the actual date of exposure in known and would be recorded in the observation_date field.


***

#### 4.10 SARS-CoV-2 History of Exposure/Suspected exposure Standard terminology.

OMOP Extension [‘History of Exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset’](http://athena.ohdsi.org/search-terms/terms/756066) is the main representative concept, with a mixed pool (SNOMED, OMOP Extension) of concepts hierarchically under this concept, which should be selected based on source granularity.
This hierarchy includes both confirmed and suspected Histories of exposures placed under the OMOP Extension ['History of Suspected exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset'](http://athena.ohdsi.org/search-terms/terms/756048) concept.


<details><summary>Click to expand - SARS-CoV-2 History of Exposure/Suspected exposure Standard terminology</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id
|---|---|---|---|
756060|History of Close contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756036|History of Close contact with patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756078|History of Close contact with patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756024|History of Close contact with patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756028|History of Close contact with symptomatic patient with confirmed or presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756040|History of Close exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756042|History of Community contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756052|History of Exposure to patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756038|History of Exposure to patient with presumptive/probable case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756025|History of Exposure to patient with presumptive/probable (then not confirmed) case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756034|History of Exposure to patient with severe acute lower respiratory distress (SARS) of unknown etiology in the 14 days prior to illness onset|Observation|OMOP Extension
756066|History of Exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756073|History of Healthcare contact of Healthcare worker with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756058|History of Healthcare contact of Patient with another patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756033|History of Healthcare contact of Visitor with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756067|History of Healthcare contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756080|History of Household contact with patient with confirmed case caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756071|History of Presence in a healthcare facility where disease caused by severe acute respiratory syndrome coronavirus 2 has been managed in the 14 days prior to illness onset|Observation|OMOP Extension
756054|History of Presence in a laboratory handling suspected or confirmed cases samples of disease caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756049|History of Suspected exposure (but ruled out after evaluation) to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756048|History of Suspected exposure to severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension


</p>
</details>


> **Note: These concepts should be used when the actual date of exposure in unknown, but it's known that exposure has happened in the 14 days prior to illness onset. The date of information capturing should be recorded in the observation_date field.



***

#### 4.11 History of travelling Standard terminology.

OMOP Extension [‘Travel in the 14 days prior to illness onset’](http://athena.ohdsi.org/search-terms/terms/756057) is the main representative concept, with a pool of OMOP Extension concepts hierarchically under this concept, which should be selected based on source granularity.


<details><summary>Click to expand - History of travelling Standard terminology</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id
|---|---|---|---|
756043|History of travel to an area with documented cases of infection caused by severe acute respiratory syndrome coronavirus 2 in the 14 days prior to illness onset|Observation|OMOP Extension
756074|History of travel to China in the 14 days prior to illness onset|Observation|OMOP Extension
756032|History of travel to Hubei in the 14 days prior to illness onset|Observation|OMOP Extension
756059|History of travel to Iran in the 14 days prior to illness onset|Observation|OMOP Extension
756053|History of travel to Italy in the 14 days prior to illness onset|Observation|OMOP Extension
756056|History of travel to South Korea in the 14 days prior to illness onset|Observation|OMOP Extension
756026|History of travel to Wuhan in the 14 days prior to illness onset|Observation|OMOP Extension
756057|Travel in the 14 days prior to illness onset|Observation|OMOP Extension


</p>
</details>


> **Note: These concepts should be used when it's known that travelling has been continuing in the 14 days prior to illness onset. The date of information capturing should be recorded in the observation_date field.


***

#### 4.12 History of Animal exposure Standard terminology.

OMOP Extension [‘History of Animal exposure in the 14 days prior to illness onset’](http://athena.ohdsi.org/search-terms/terms/756063) is the main representative concept, with a pool of OMOP Extension concepts hierarchically under this concept, which should be selected based on source granularity.


<details><summary>Click to expand - History of Animal exposure Standard terminology</summary>
<p>

concept_id|concept_name|domain_id|vocabulary_id
|---|---|---|---|
756063|History of Animal exposure in the 14 days prior to illness onset|Observation|OMOP Extension
756030|History of Contact with live/dead animals, raw meat or insect bites in the 14 days prior to illness onset|Observation|OMOP Extension
756070|History of Direct contact with animals in countries where COVID-19 is known to be circulating in animal populations or where human infections have occurred as a result of presumed zoonotic transmission in the 14 days prior to illness onset|Observation|OMOP Extension

</p>
</details>


> **Note: These concepts should be used when it's known that exposure has happened in the 14 days prior to illness onset. The date of information capturing should be recorded in the observation_date field.

***


"Has associated finding (SNOMED)" ???