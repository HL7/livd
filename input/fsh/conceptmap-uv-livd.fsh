Profile: LIVDConceptMap
Parent: http://hl7.org/fhir/StructureDefinition/ConceptMap
Id: conceptmap-uv-livd
Title: "LIVDConceptMap"
Description: "Explanation of what this profile contains/is for"
* ^version = "0.3.0"
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International - Orders and Observations Work Group"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://hl7.org/Special/committees/orders/index.cfm"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDConceptMap"
* . ^mustSupport = false
* . ^mapping[0].identity = "rim"
* . ^mapping[0].map = "N/A"
* url 0..1 MS
* identifier 0..0
* identifier ^mustSupport = false
* version 0..0
* version ^mustSupport = false
* name 1..1 MS
* title 0..0
* title ^mustSupport = false
* status 1..1 MS
* status ^comment = "Only \"Active\" must be supported as it reflects the time of publication.  Others are not valid for that."
* experimental 0..0
* experimental ^mustSupport = false
* date 0..0
* date ^mustSupport = false
* publisher 0..0
* publisher ^mustSupport = false
* contact 0..0
* contact ^mustSupport = false
* description 0..0
* description ^mustSupport = false
* useContext 0..0
* useContext ^mustSupport = false
* jurisdiction 0..0
* jurisdiction ^mustSupport = false
* purpose 0..0
* purpose ^mustSupport = false
* copyright 0..0
* copyright ^mustSupport = false
* source[x] 1..1 MS
* source[x] ^comment = "This points to the device for which the IVD Test Codes are mapped to the suggested LOINC codes."
* target[x] 1..1 MS
* target[x] ^comment = "This points to the LIVDLOINCCodeSystemProfile that contains the LOINC codes and their properties, used to map the  IVD Test Codes."
* group 1..1 MS
* group ^comment = "Considering the scope is only IVD Test Code to LOINC, one group is sufficient."
* group.source 0..0
* group.source ^mustSupport = false
* group.sourceVersion 0..0
* group.sourceVersion ^mustSupport = false
* group.target 0..0
* group.target ^mustSupport = false
* group.targetVersion 0..0
* group.targetVersion ^mustSupport = false
* group.element 1..* MS
* group.element ^short = "Mappings for a Vendor Analyte Code from the source set"
* group.element ^definition = "Mappings for an individual Vendor Analyte Code in the source to one or more LOINC Codes in the target."
* group.element ^comment = "Generally an Vendor Analyte Code points to one or more LOINC Codes, but it is possible that a LOINC Code does not exist yet."
* group.element.code 1..1 MS
* group.element.code ^short = "Identifies the Vendor Analyte Code being mapped"
* group.element.code ^definition = "Identity (code or path) of the Vendor Analyte Code being mapped."
* group.element.display 1..1 MS
* group.element.display ^short = "The Vendor Analyte Name"
* group.element.display ^definition = "The Vendor Analyte Name for the Vendore Analyte Code. The display is only provided to help editors when editing the concept map."
* group.element.target 0..* MS
* group.element.target ^short = "Identifies the LOINC code being mapped to"
* group.element.target ^definition = "A reference to the LOINC code being mapped to, including mapping criteria."
* group.element.target.code 1..1 MS
* group.element.target.code ^short = "Code that identifies the LOINC Code"
* group.element.target.code ^definition = "Identity (code or path) the LOINC Code that the map refers to."
* group.element.target.display 1..1 MS
* group.element.target.display ^short = "LOINC Long Name"
* group.element.target.display ^definition = "The LOINC Long Name for the LOINC code. The display is only provided to help editors when editing the concept map."
* group.element.target.equivalence 1..1 MS
* group.element.target.comment 0..1 MS
* group.element.target.comment ^short = "Vendor Comment"
* group.element.target.comment ^comment = "This provides the ability for the vendor for additional human readable clarifications to the Laboratory on how to consider mapping IVD Test Codes to LOINC codes beyond the Result and Specimen descriptions in the dependsOn construct."
* group.element.target.dependsOn 0..3 MS
* group.element.target.dependsOn ^slicing.discriminator[0].type = #value
* group.element.target.dependsOn ^slicing.discriminator[0].path = "property"
* group.element.target.dependsOn ^slicing.rules = #open
* group.element.target.dependsOn ^comment = "Either .code or .display must be valued.\nThere must be both a specimen and result related description."
* group.element.target.dependsOn ^condition[0] = "livd-1"
* group.element.target.dependsOn ^constraint[0].key = "livd-1"
* group.element.target.dependsOn ^constraint[0].severity = #error
* group.element.target.dependsOn ^constraint[0].human = "If the dependsOn is valued, either the code or display must be present"
* group.element.target.dependsOn ^constraint[0].expression = "(group.element.target.dependsOn.exists() and (group.element.target.code.exists() or group.element.target.display.exists())) or group.element.target.dependsOn.empty()"
* group.element.target.dependsOn ^constraint[0].xpath = "(exists(f:group.element.target.dependsOn) and (exists(f:group.element.target.code) or exists(f:group.element.target.display))) or !exists(f:group.element.target.dependsOn)"
* group.element.target.dependsOn contains specimen 1..1 MS
* group.element.target.dependsOn[specimen] ^short = "The property for specimen"
* group.element.target.dependsOn[specimen].property 1..1 MS
* group.element.target.dependsOn[specimen].property only uri
* group.element.target.dependsOn[specimen].property = "specimen" (exactly)
* group.element.target.dependsOn[specimen].system 0..0
* group.element.target.dependsOn[specimen].system ^mustSupport = false
* group.element.target.dependsOn[specimen].value 1..1 MS
* group.element.target.dependsOn[specimen].value ^short = "Value of the specimen property"
* group.element.target.dependsOn[specimen].value ^definition = "This provides the coded representation of the description for the Specimen description."
* group.element.target.dependsOn[specimen].value ^comment = "This human readable description provides further information for use by the Lab staff to finalize the appropriate mapping of the analyte test code to the LOINC code for the specific device and purpose within that Lab."
* group.element.target.dependsOn[specimen].display 0..0
* group.element.target.dependsOn[specimen].display ^mustSupport = false
* group.element.target.dependsOn contains result 1..1 MS
* group.element.target.dependsOn[result] ^short = "The property for result"
* group.element.target.dependsOn[result].property 1..1 MS
* group.element.target.dependsOn[result].property only uri
* group.element.target.dependsOn[result].property = "result" (exactly)
* group.element.target.dependsOn[result].system 0..0
* group.element.target.dependsOn[result].system ^mustSupport = false
* group.element.target.dependsOn[result].value 1..1 MS
* group.element.target.dependsOn[result].value ^short = "Value of the result property"
* group.element.target.dependsOn[result].value ^definition = "This provides the coded representation of the description for the Result description."
* group.element.target.dependsOn[result].value ^comment = "This human readable description provides further information for use by the Lab staff to finalize the appropriate mapping of the analyte test code to the LOINC code for the specific device and purpose within that Lab."
* group.element.target.dependsOn[result].display 0..0
* group.element.target.dependsOn[result].display ^mustSupport = false
* group.element.target.dependsOn contains other 0..1 MS
* group.element.target.dependsOn[other] ^short = "The property for other"
* group.element.target.dependsOn[other].property 1..1 MS
* group.element.target.dependsOn[other].property only uri
* group.element.target.dependsOn[other].property = "other" (exactly)
* group.element.target.dependsOn[other].system 0..0
* group.element.target.dependsOn[other].system ^mustSupport = false
* group.element.target.dependsOn[other].value 1..1 MS
* group.element.target.dependsOn[other].value ^short = "Value of the other value property"
* group.element.target.dependsOn[other].value ^definition = "This provides the coded representation of the description for an additional dependency (not Specimen or Result) description."
* group.element.target.dependsOn[other].value ^comment = "This human readable description provides further information for use by the Lab staff to finalize the appropriate mapping of the analyte test code to the LOINC code for the specific device and purpose within that Lab."
* group.element.target.dependsOn[other].display 0..0
* group.element.target.dependsOn[other].display ^mustSupport = false
* group.element.target.product 0..0
* group.element.target.product ^mustSupport = false
* group.unmapped 0..0
* group.unmapped ^mustSupport = false
* group.unmapped.mode ^mustSupport = false
* group.unmapped.code ^mustSupport = false
* group.unmapped.display ^mustSupport = false
* group.unmapped.url ^mustSupport = false
