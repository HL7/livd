Profile: LIVDValueSet
Parent: http://hl7.org/fhir/StructureDefinition/ValueSet
Id: valueset-uv-livd
Title: "LIVDValueSet"
Description: "LIVD value set profile."
* ^version = "1.0.0-ballot"
* ^status = #draft
* ^experimental = false
* ^date = "2020-12-15"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDValueSet"
* url 1..1 MS
* version 1..1 MS
* name 1..1 MS
* status 1..1 MS
* publisher 0..0
* contact 0..0
* useContext 0..0
* immutable 0..0
* purpose 0..0
* compose 1..1 MS
* compose.lockedDate 0..0
* compose.inactive 0..0
* compose.include 1..* MS
* compose.include.system 1..1 MS
* compose.include.version 0..1 MS
* compose.include.concept 1..* MS
* compose.include.concept.code 1..1 MS
* compose.include.concept.display 1..1 MS
* compose.include.concept.designation 0..0
* compose.include.filter 0..0
* compose.include.valueSet 0..0
* compose.exclude 0..0
* expansion 0..0
