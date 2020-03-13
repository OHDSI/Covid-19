## [Intubation](https://github.com/OHDSI/Covid-19/blob/vocabularies_for_phenotypes/Vocabulary/sql/phenotypes/Intubation.sql):

## Included to concept set:
|domain_id|concept_id|concept_name|concept_code|voc_id
|---|---|---|---|---|
Procedure|40487536|Intubation of respiratory tract|447996002|SNOMED
Procedure|765576|Orotracheal intubation using bougie device|450601000124103|SNOMED


<details><summary><strong>Click to expand - Mapping list</strong></summary>
<p>

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
Procedure|2007912|Other intubation of respiratory tract|ICD9Proc|ICD9ProcCN|96.05; 96.0500; 96.0501; 96.0502
Procedure|4331311|Changing tracheostomy tube|SNOMED|ICD9Proc|97.23
Procedure|4331311|Changing tracheostomy tube|SNOMED|ICD9ProcCN|97.23; 97.2300; 97.2301
Procedure|4331311|Changing tracheostomy tube|SNOMED|OPCS4|E42.6
Procedure|4331311|Changing tracheostomy tube|SNOMED|Read|7443500; 7443511
Procedure|4082243|Emergency laryngeal intubation|SNOMED|Read|8712.00
Procedure|4013354|Insertion of endotracheal tube|SNOMED|ICD9Proc|96.04
Procedure|4013354|Insertion of endotracheal tube|SNOMED|ICD9ProcCN|96.04; 96.0400
Procedure|4013354|Insertion of endotracheal tube|SNOMED|OPCS4|X56; X56.2; X56.9
Procedure|4013354|Insertion of endotracheal tube|SNOMED|Read|7L1R.00; 7L1R100; 7L1Ry00; 7L1Rz00; 871..00; 8711.00; 871Z.00
Procedure|4337047|Insertion of tracheostomy tube|SNOMED|Read|7443211
Procedure|4056812|Laryngeal intubation for inhalation|SNOMED|Read|8763.00
Procedure|4337046|Minitrach insertion|SNOMED|Read|7443A00
Procedure|4337616|Nasotracheal intubation|SNOMED|OPCS4|X56.1
Procedure|4337616|Nasotracheal intubation|SNOMED|Read|7L1R000
Procedure|4303945|Tracheal intubation through a laryngeal mask airway|SNOMED|OPCS4|X56.3
Procedure|4303945|Tracheal intubation through a laryngeal mask airway|SNOMED|Read|7L1R200


</p>
</details>

<details><summary><strong>Click to expand - Detailed Mapping list</strong></summary>
<p>

|source_code_description|source_code|source_voc_id|concept_id|concept_name|concept_code|concept_class_id|domain_id|voc_id
|---|---|---|---|---|---|---|---|---|
Placement of tracheostomy tube|7443211|Read|4337047|Insertion of tracheostomy tube|232685002|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|7443500|Read|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Change of tracheostomy tube|7443511|Read|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Insertion of mini tracheostomy|7443A00|Read|4337046|Minitrach insertion|232684003|Procedure|Procedure|SNOMED
Intubation of trachea|7L1R.00|Read|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Nasotracheal intubation|7L1R000|Read|4337616|Nasotracheal intubation|232679009|Procedure|Procedure|SNOMED
Endotracheal intubation|7L1R100|Read|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Tracheal intubation using laryngeal mask airway|7L1R200|Read|4303945|Tracheal intubation through a laryngeal mask airway|418613003|Procedure|Procedure|SNOMED
Other specified intubation of trachea|7L1Ry00|Read|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Intubation of trachea NOS|7L1Rz00|Read|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Endotracheal intubation|871..00|Read|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Endotracheal tube insertion|8711.00|Read|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Emergency laryngeal intubation|8712.00|Read|4082243|Emergency laryngeal intubation|182682004|Procedure|Procedure|SNOMED
Endotracheal intubation NOS|871Z.00|Read|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Laryngeal intubation inhalat.|8763.00|Read|4056812|Laryngeal intubation for inhalation|182709001|Procedure|Procedure|SNOMED
Insertion of endotracheal tube|96.04|ICD9Proc|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Insertion of endotracheal tube|96.04|ICD9ProcCN|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Insertion of endotracheal tube|96.0400|ICD9ProcCN|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Other intubation of respiratory tract|96.05|ICD9ProcCN|2007912|Other intubation of respiratory tract|96.05|4-dig billing code|Procedure|ICD9Proc
Other intubation of respiratory tract|96.0500|ICD9ProcCN|2007912|Other intubation of respiratory tract|96.05|4-dig billing code|Procedure|ICD9Proc
Bronchial stenting (machine translation)|96.0501|ICD9ProcCN|2007912|Other intubation of respiratory tract|96.05|4-dig billing code|Procedure|ICD9Proc
Main bronchus stenting (machine translation)|96.0502|ICD9ProcCN|2007912|Other intubation of respiratory tract|96.05|4-dig billing code|Procedure|ICD9Proc
Replacement of tracheostomy tube|97.23|ICD9Proc|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|97.23|ICD9ProcCN|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|97.2300|ICD9ProcCN|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Tracheal tube replacement (machine translation)|97.2301|ICD9ProcCN|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|E42.6|OPCS4|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Intubation of trachea|X56|OPCS4|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Nasotracheal intubation|X56.1|OPCS4|4337616|Nasotracheal intubation|232679009|Procedure|Procedure|SNOMED
Endotracheal intubation|X56.2|OPCS4|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED
Tracheal intubation using laryngeal mask airway|X56.3|OPCS4|4303945|Tracheal intubation through a laryngeal mask airway|418613003|Procedure|Procedure|SNOMED
Unspecified intubation of trachea|X56.9|OPCS4|4013354|Insertion of endotracheal tube|112798008|Procedure|Procedure|SNOMED

</p>
</details>


## Not included / to be excluded from concept set:
|domain_id|concept_id|concept_name|concept_code|voc_id
|---|---|---|---|---|
Procedure|2108641|Glossectomy; complete or total, with or without tracheostomy, without radical neck dissection|41140|CPT4
Procedure|2108642|Glossectomy; complete or total, with or without tracheostomy, with unilateral radical neck dissection|41145|CPT4
Procedure|2106470|Tracheotomy tube change prior to establishment of fistula tract|31502|CPT4
Procedure|2106642|Transtracheal (percutaneous) introduction of needle wire dilator/stent or indwelling tube for oxygen therapy|31730|CPT4
Procedure|4331311|Changing tracheostomy tube|2267008|SNOMED
Procedure|4337048|Insertion of tracheal T-tube|232686001|SNOMED
Procedure|4337047|Insertion of tracheostomy tube|232685002|SNOMED
Procedure|4337046|Minitrach insertion|232684003|SNOMED
Procedure|4149878|Transglottic catheterization of trachea|30963003|SNOMED



<details><summary><strong>Click to expand - Mapping list</strong></summary>
<p>

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
Procedure|4331311|Changing tracheostomy tube|SNOMED|ICD9Proc|97.23
Procedure|4331311|Changing tracheostomy tube|SNOMED|ICD9ProcCN|97.23; 97.2300; 97.2301
Procedure|4331311|Changing tracheostomy tube|SNOMED|OPCS4|E42.6
Procedure|4331311|Changing tracheostomy tube|SNOMED|Read|7443500; 7443511
Procedure|4337047|Insertion of tracheostomy tube|SNOMED|Read|7443211
Procedure|4337046|Minitrach insertion|SNOMED|Read|7443A00


</p>
</details>

<details><summary><strong>Click to expand - Detailed Mapping list</strong></summary>
<p>

|source_code_description|source_code|source_voc_id|concept_id|concept_name|concept_code|concept_class_id|domain_id|voc_id
|---|---|---|---|---|---|---|---|---|
Placement of tracheostomy tube|7443211|Read|4337047|Insertion of tracheostomy tube|232685002|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|7443500|Read|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Change of tracheostomy tube|7443511|Read|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Insertion of mini tracheostomy|7443A00|Read|4337046|Minitrach insertion|232684003|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|97.23|ICD9Proc|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|97.23|ICD9ProcCN|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|97.2300|ICD9ProcCN|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Tracheal tube replacement (machine translation)|97.2301|ICD9ProcCN|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED
Replacement of tracheostomy tube|E42.6|OPCS4|4331311|Changing tracheostomy tube|2267008|Procedure|Procedure|SNOMED


</p>
</details>



***