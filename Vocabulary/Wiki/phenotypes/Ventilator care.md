## [Ventilator care](https://github.com/OHDSI/Covid-19/blob/vocabularies_for_phenotypes/Vocabulary/sql/phenotypes/Ventilator%20care):

## Included to concept set:
|domain_id|concept_id|concept_name|concept_code|voc_id
|---|---|---|---|---|
Observation|4232550|Home visit for mechanical ventilation care|439887005|SNOMED
Observation|4237618|Ventilator care|409025002|SNOMED
Procedure|44509482|Other specified ventilation support|E85.8|OPCS4
Procedure|4230167|Artificial respiration|40617009|SNOMED
Procedure|4080957|Endotracheal respiratory assistance|182686001|SNOMED
Procedure|4235361|Hyperventilation therapy for traumatic brain injury|438603002|SNOMED
Procedure|4332501|Management of noninvasive mechanical ventilation|430191008|SNOMED
Procedure|37206832|Mechanical insufflation exsufflation|787180006|SNOMED
Procedure|4251737|Ventilator care management|410210009|SNOMED
Procedure|44791135|Ventilatory support|231821000000109|SNOMED



<details><summary><strong>Click to expand - Mapping list</strong></summary>
<p>

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
Observation|4165535|Continuous positive airway pressure ventilation treatment|SNOMED|Read|8724.00; Z6M1.11; Z6M1.12; Z6M1200
Observation|4055262|Dual pressure spontaneous ventilation support|SNOMED|Read|8725.00; Z6M3.00; Z6M3.13
Observation|4042360|Intermittent CPAP|SNOMED|Read|Z6M1100
Observation|4039924|Nasal ventilation therapy|SNOMED|Read|Z6M4.00
Procedure|2008009|Continuous invasive mechanical ventilation for 96 consecutive hours or more|ICD9Proc|ICD9ProcCN|96.72; 96.7200; 96.7201
Procedure|2008008|Continuous invasive mechanical ventilation for less than 96 consecutive hours|ICD9Proc|ICD9ProcCN|96.71; 96.7100; 96.7101
Procedure|2008007|Continuous invasive mechanical ventilation of unspecified duration|ICD9Proc|ICD9ProcCN|96.70; 96.7000
Procedure|2008006|Other continuous invasive mechanical ventilation|ICD9Proc|ICD9ProcCN|96.7
Procedure|4173351|Apneic oxygenation|SNOMED|Read|Z6J2.00
Procedure|4230167|Artificial respiration|SNOMED|Read|872..00; 8721.00; 872..12; 872Z.00; 8734.00
Procedure|4139542|Bag valve mask ventilation|SNOMED|OPCS4|E85.4
Procedure|4139542|Bag valve mask ventilation|SNOMED|Read|7458300
Procedure|4080957|Endotracheal respiratory assistance|SNOMED|Read|8722.00
Procedure|4057263|Intermittent positive pressure ventilation|SNOMED|Read|872..11; 8723.00
Procedure|44790095|Invasive ventilation|SNOMED|OPCS4|E85.1
Procedure|44790095|Invasive ventilation|SNOMED|Read|7458000
Procedure|4072514|Lung inflation by intermittent compression of reservoir bag|SNOMED|Read|Z6H1.00; Z6H1.11
Procedure|4039925|Manual hyperinflation|SNOMED|Read|Z6H2.00
Procedure|4285807|Mouth-to-mouth resuscitation|SNOMED|Read|8732.00
Procedure|4177224|Noninvasive ventilation|SNOMED|ICD9Proc|93.90
Procedure|4177224|Noninvasive ventilation|SNOMED|ICD9ProcCN|93.90; 93.9000; 93.9001
Procedure|4177224|Noninvasive ventilation|SNOMED|OPCS4|E85.2
Procedure|4177224|Noninvasive ventilation|SNOMED|Read|7458100
Procedure|4006318|Respiratory assist, manual|SNOMED|Read|Z6H..00; Z6H..11; Z6H..12; Z6H..13
Procedure|44791135|Ventilatory support|SNOMED|OPCS4|Y73.3
Procedure|44791135|Ventilatory support|SNOMED|Read|7M36300



</p>
</details>

<details><summary><strong>Click to expand - Detailed Mapping list</strong></summary>
<p>

|source_code_description|source_code|source_voc_id|concept_id|concept_name|concept_code|concept_class_id|domain_id|voc_id
|---|---|---|---|---|---|---|---|---|
Invasive ventilation|7458000|Read|44790095|Invasive ventilation|226471000000101|Procedure|Procedure|SNOMED
Non-invasive ventilation|7458100|Read|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Bag valve mask ventilation|7458300|Read|4139542|Bag valve mask ventilation|425447009|Procedure|Procedure|SNOMED
Ventilatory support|7M36300|Read|44791135|Ventilatory support|231821000000109|Procedure|Procedure|SNOMED
Mechanical assistance to resp.|872..00|Read|4230167|Artificial respiration|40617009|Procedure|Procedure|SNOMED
Mechanical ventilation|8721.00|Read|4230167|Artificial respiration|40617009|Procedure|Procedure|SNOMED
Intermit.pos.pres.vent.|872..11|Read|4057263|Intermittent positive pressure ventilation|182687005|Procedure|Procedure|SNOMED
Ventilation-mechanical|872..12|Read|4230167|Artificial respiration|40617009|Procedure|Procedure|SNOMED
Endotracheal resp. assistance|8722.00|Read|4080957|Endotracheal respiratory assistance|182686001|Procedure|Procedure|SNOMED
Intermitt.positive pres.resp.|8723.00|Read|4057263|Intermittent positive pressure ventilation|182687005|Procedure|Procedure|SNOMED
CPAP - Continuous positive airways pressure|8724.00|Read|4165535|Continuous positive airway pressure ventilation treatment|47545007|Procedure|Observation|SNOMED
Bi-level positive airways pressure therapy|8725.00|Read|4055262|Dual pressure spontaneous ventilation support|243142003|Procedure|Observation|SNOMED
Mechanical resp. assist. NOS|872Z.00|Read|4230167|Artificial respiration|40617009|Procedure|Procedure|SNOMED
Mouth to mouth ventilation|8732.00|Read|4285807|Mouth-to-mouth resuscitation|37113006|Procedure|Procedure|SNOMED
Artificial respiration|8734.00|Read|4230167|Artificial respiration|40617009|Procedure|Procedure|SNOMED
Non-invasive mechanical ventilation|93.90|ICD9Proc|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Non-invasive mechanical ventilation|93.90|ICD9ProcCN|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Non-invasive mechanical ventilation|93.9000|ICD9ProcCN|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Continuous positive airway pressure (CPAP) (machine translation)|93.9001|ICD9ProcCN|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Other continuous invasive mechanical ventilation|96.7|ICD9ProcCN|2008006|Other continuous invasive mechanical ventilation|96.7|3-dig nonbill code|Procedure|ICD9Proc
Continuous invasive mechanical ventilation of unspecified duration|96.70|ICD9ProcCN|2008007|Continuous invasive mechanical ventilation of unspecified duration|96.70|4-dig billing code|Procedure|ICD9Proc
Continuous invasive mechanical ventilation of unspecified duration|96.7000|ICD9ProcCN|2008007|Continuous invasive mechanical ventilation of unspecified duration|96.70|4-dig billing code|Procedure|ICD9Proc
Continuous invasive mechanical ventilation for less than 96 consecutive hours|96.71|ICD9ProcCN|2008008|Continuous invasive mechanical ventilation for less than 96 consecutive hours|96.71|4-dig billing code|Procedure|ICD9Proc
Continuous invasive mechanical ventilation for less than 96 consecutive hours|96.7100|ICD9ProcCN|2008008|Continuous invasive mechanical ventilation for less than 96 consecutive hours|96.71|4-dig billing code|Procedure|ICD9Proc
Ventilator treatment [less than 96 hours] (machine translation)|96.7101|ICD9ProcCN|2008008|Continuous invasive mechanical ventilation for less than 96 consecutive hours|96.71|4-dig billing code|Procedure|ICD9Proc
Continuous invasive mechanical ventilation for 96 consecutive hours or more|96.72|ICD9ProcCN|2008009|Continuous invasive mechanical ventilation for 96 consecutive hours or more|96.72|4-dig billing code|Procedure|ICD9Proc
Continuous invasive mechanical ventilation for 96 consecutive hours or more|96.7200|ICD9ProcCN|2008009|Continuous invasive mechanical ventilation for 96 consecutive hours or more|96.72|4-dig billing code|Procedure|ICD9Proc
Ventilator Treatment [not less than 96 hours] (machine translation)|96.7201|ICD9ProcCN|2008009|Continuous invasive mechanical ventilation for 96 consecutive hours or more|96.72|4-dig billing code|Procedure|ICD9Proc
Invasive ventilation|E85.1|OPCS4|44790095|Invasive ventilation|226471000000101|Procedure|Procedure|SNOMED
Non-invasive ventilation NEC|E85.2|OPCS4|4177224|Noninvasive ventilation|428311008|Procedure|Procedure|SNOMED
Bag valve mask ventilation|E85.4|OPCS4|4139542|Bag valve mask ventilation|425447009|Procedure|Procedure|SNOMED
Ventilatory support|Y73.3|OPCS4|44791135|Ventilatory support|231821000000109|Procedure|Procedure|SNOMED
Manually assisted breathing|Z6H..00|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Lung inflation by intermittent compression of reservoir bag|Z6H1.00|Read|4072514|Lung inflation by intermittent compression of reservoir bag|243140006|Procedure|Procedure|SNOMED
Hand ventilation|Z6H..11|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Hand bagging|Z6H1.11|Read|4072514|Lung inflation by intermittent compression of reservoir bag|243140006|Procedure|Procedure|SNOMED
Manual ventilation|Z6H..12|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Hand ventilation - bagging|Z6H..13|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Manual hyperinflation|Z6H2.00|Read|4039925|Manual hyperinflation|229313004|Procedure|Procedure|SNOMED
Apnoeic oxygenation|Z6J2.00|Read|4173351|Apneic oxygenation|276732005|Procedure|Procedure|SNOMED
Intermittent CPAP|Z6M1100|Read|4042360|Intermittent CPAP|229308003|Procedure|Observation|SNOMED
CPAP - Continuous positive airways pressure|Z6M1.11|Read|4165535|Continuous positive airway pressure ventilation treatment|47545007|Procedure|Observation|SNOMED
Continuous positive airways pressure therapy|Z6M1.12|Read|4165535|Continuous positive airway pressure ventilation treatment|47545007|Procedure|Observation|SNOMED
Continuous CPAP|Z6M1200|Read|4165535|Continuous positive airway pressure ventilation treatment|47545007|Procedure|Observation|SNOMED
Dual pressure spontaneous ventilation support|Z6M3.00|Read|4055262|Dual pressure spontaneous ventilation support|243142003|Procedure|Observation|SNOMED
BIPAB - Bi-level positive airways pressure therapy|Z6M3.13|Read|4055262|Dual pressure spontaneous ventilation support|243142003|Procedure|Observation|SNOMED
Nasal ventilation therapy|Z6M4.00|Read|4039924|Nasal ventilation therapy|229312009|Procedure|Observation|SNOMED


</p>
</details>


## Not included / to be excluded from concept set:
|domain_id|concept_id|concept_name|concept_code|voc_id|comment
|---|---|---|---|---|---|
Condition|4031379|Artificial ventilation finding|129896002|SNOMED
Condition|40481547|Dependence on ventilator|444932008|SNOMED
Condition|4021786|Fear of disconnection from ventilator|225627007|SNOMED
Observation|4232891|Mechanical ventilation response|404997003|SNOMED
Observation|4219858|Problem with patient ventilator|397846002|SNOMED
Observation|4353715|Ventilator finding|250870006|SNOMED
Procedure|2745440|Insertion of Endotracheal Airway into Trachea, Percutaneous Approach|0BH13EZ|ICD10PCS
Procedure|2745444|Insertion of Endotracheal Airway into Trachea, Via Natural or Artificial Opening|0BH17EZ|ICD10PCS
Procedure|2745447|Insertion of Endotracheal Airway into Trachea, Via Natural or Artificial Opening Endoscopic|0BH18EZ|ICD10PCS
Procedure|4348300|Expired air ventilation|243180002|SNOMED
Procedure|4107247|Inhalation anesthesia, machine system, semi-closed, no rebreathing of primary agent|30050007|SNOMED
Procedure|44808555|Provision of mechanical ventilator|859311000000101|SNOMED
Procedure|4006318|Respiratory assist, manual|11140008|SNOMED
Procedure|4254108|Resuscitation with artificial respiration|74596007|SNOMED
Procedure|4259233|Ventilator care assessment|410208007|SNOMED
Procedure|4254905|Ventilator care education|410209004|SNOMED
Procedure|4072633|Weaning from mechanically assisted ventilation|243174005|SNOMED




<details><summary><strong>Click to expand - Mapping list</strong></summary>
<p>

|domain_id|concept_id|concept_name|voc_id|source_voc_id|source_code
|---|---|---|---|---|---|
Condition|40481547|Dependence on ventilator|SNOMED|ICD9CM|V46.11; V46.12
Procedure|4139542|Bag valve mask ventilation|SNOMED|OPCS4|E85.4
Procedure|4139542|Bag valve mask ventilation|SNOMED|Read|7458300
Procedure|4072514|Lung inflation by intermittent compression of reservoir bag|SNOMED|Read|Z6H1.00; Z6H1.11
Procedure|4039925|Manual hyperinflation|SNOMED|Read|Z6H2.00
Procedure|4285807|Mouth-to-mouth resuscitation|SNOMED|Read|8732.00
Procedure|4006318|Respiratory assist, manual|SNOMED|Read|Z6H..00; Z6H..11; Z6H..12; Z6H..13
Procedure|4072633|Weaning from mechanically assisted ventilation|SNOMED|ICD9CM|V46.13


</p>
</details>

<details><summary><strong>Click to expand - Detailed Mapping list</strong></summary>
<p>

|source_code_description|source_code|source_voc_id|concept_id|concept_name|concept_code|concept_class_id|domain_id|voc_id
|---|---|---|---|---|---|---|---|---|
Bag valve mask ventilation|7458300|Read|4139542|Bag valve mask ventilation|425447009|Procedure|Procedure|SNOMED
Mouth to mouth ventilation|8732.00|Read|4285807|Mouth-to-mouth resuscitation|37113006|Procedure|Procedure|SNOMED
Bag valve mask ventilation|E85.4|OPCS4|4139542|Bag valve mask ventilation|425447009|Procedure|Procedure|SNOMED
Dependence on respirator, status|V46.11|ICD9CM|40481547|Dependence on ventilator|444932008|Clinical Finding|Condition|SNOMED
Encounter for respirator dependence during power failure|V46.12|ICD9CM|40481547|Dependence on ventilator|444932008|Clinical Finding|Condition|SNOMED
Encounter for weaning from respirator [ventilator]|V46.13|ICD9CM|4072633|Weaning from mechanically assisted ventilation|243174005|Procedure|Procedure|SNOMED
Manually assisted breathing|Z6H..00|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Lung inflation by intermittent compression of reservoir bag|Z6H1.00|Read|4072514|Lung inflation by intermittent compression of reservoir bag|243140006|Procedure|Procedure|SNOMED
Hand ventilation|Z6H..11|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Hand bagging|Z6H1.11|Read|4072514|Lung inflation by intermittent compression of reservoir bag|243140006|Procedure|Procedure|SNOMED
Manual ventilation|Z6H..12|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Hand ventilation - bagging|Z6H..13|Read|4006318|Respiratory assist, manual|11140008|Procedure|Procedure|SNOMED
Manual hyperinflation|Z6H2.00|Read|4039925|Manual hyperinflation|229313004|Procedure|Procedure|SNOMED


</p>
</details>



***