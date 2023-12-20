Profile: LIVDResultValueConceptMap
Parent: http://hl7.org/fhir/StructureDefinition/ConceptMap
Id: conceptmap-resultvalue-uv-livd
Title: "LIVDResultValueConceptMap"
Description: "ConceptMap profile for mappoings of manufacturer IVD result value codes to standard LOINC or SNOMED CT codes."
* ^version = "1.0.0-ballot"
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDResultValueConceptMap"
* . ^mustSupport = false
* . ^mapping[0].identity = "rim"
* . ^mapping[0].map = "N/A"
* url 0..1 MS
* identifier 0..0
* identifier ^mustSupport = false
* name 1..1 MS
* status 1..1 MS
* status ^comment = "Only \"Active\" must be supported as it reflects the time of publication.  Others are not valid for that."
* date ^mustSupport = false
* publisher 0..0
* publisher ^mustSupport = false
* contact 0..0
* contact ^mustSupport = false
* useContext 0..0
* useContext ^mustSupport = false
* jurisdiction ^mustSupport = false
* purpose 0..0
* purpose ^mustSupport = false
* copyright 0..0
* copyright ^mustSupport = false
* source[x] 1..1 MS
* source[x] ^comment = "This points to the manufacturer IVD Result Codes value set of the codes that are mapped to the suggested LOINC or SNOMED CT codes."
* target[x] 1..1 MS
* target[x] ^comment = "This points to the LIVD value set that contains the target LOINC or SNOMED CT codes (and their properties, if applicable), used to map the IVD result codes."
* group 1..2 MS
* group ^comment = "IVD result code mappings may be to either LOINC or SNOMED CT, or both."
* group.source 0..0
* group.source ^mustSupport = false
* group.sourceVersion 0..0
* group.sourceVersion ^mustSupport = false
* group.target 0..1 MS
* group.targetVersion 0..1 MS
* group.element 1..* MS
* group.element ^short = "Mappings for a Vendor Result Code from the source set"
* group.element ^definition = "Mappings for an individual Vendor Result Code in the source to one or more LOINC or SNOMED CT Codes in the target."
* group.element ^comment = "Generally an Vendor Result Code points to one or more LOINC or SNOMED CT Codes, but it is possible that a standard code does not exist yet."
* group.element.code 1..1 MS
* group.element.code ^short = "Identifies the Vendor Result Code being mapped"
* group.element.code ^definition = "Identity (code or path) of the Vendor Result Code being mapped."
* group.element.display 1..1 MS
* group.element.display ^short = "The Vendor Result Name"
* group.element.display ^definition = "The Vendor Result Name for the Vendor Result Code. The display is only provided to help editors when editing the concept map."
* group.element.target 0..* MS
* group.element.target ^short = "Identifies the LOINC or SNOMED CT code being mapped to"
* group.element.target ^definition = "A reference to the LOINC or SNOMED CT code being mapped to, including mapping criteria."
* group.element.target.code 1..1 MS
* group.element.target.code ^short = "Code that identifies the LOINC or SNOMED CT Code"
* group.element.target.code ^definition = "Identity (code or path) the LOINC or SNOMED CT Code that the map refers to."
* group.element.target.display 1..1 MS
* group.element.target.display ^short = "LOINC Long Name or SNOMED CT preferred description"
* group.element.target.display ^definition = "The LOINC Long Name or SNOMED CT preferred description for the code. The display is only provided to help editors when editing the concept map."
* group.element.target.equivalence 1..1 MS
* group.element.target.comment 0..1 MS
* group.element.target.comment ^short = "Vendor Comment"
* group.element.target.comment ^comment = "This provides the ability for the vendor for additional human readable clarifications to the Laboratory on how to consider mapping IVD Result Codes to LOINC or SNOMED CT codes."
* group.element.target.dependsOn 0..0
* group.element.target.dependsOn ^mustSupport = false
* group.element.target.product 0..0
* group.element.target.product ^mustSupport = false
* group.unmapped 0..0
* group.unmapped ^mustSupport = false
* group.unmapped.mode ^mustSupport = false
* group.unmapped.code ^mustSupport = false
* group.unmapped.display ^mustSupport = false
* group.unmapped.url ^mustSupport = false
