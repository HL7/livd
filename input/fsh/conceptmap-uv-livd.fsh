Profile: LIVDConceptMap
Parent: http://hl7.org/fhir/StructureDefinition/ConceptMap
Id: conceptmap-uv-livd
Title: "LIVDConceptMap"
Description: "Explanation of what this profile contains/is for"
* ^version = "0.2.0"
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
* url ^short = "Logical URI to reference this concept map (globally unique)"
* url ^definition = "An absolute URI that is used to identify this concept map when it is referenced in a specification, model, design or an instance. This SHALL be a URL, SHOULD be globally unique, and SHOULD be an address at which this concept map is (or will be) published. The URL SHOULD include the major version of the concept map. For more information see [Technical and Business Versions](resource.html#versions)."
* url ^comment = "Can be a urn:uuid: or a urn:oid:, but real http: addresses are preferred.  Multiple instances may share the same url if they have a distinct."
* identifier 0..0
* identifier ^mustSupport = false
* version 0..0
* version ^mustSupport = false
* name 1..1 MS
* title 0..0
* title ^mustSupport = false
* status 1..1 MS
* status ^definition = "The status of this concept map. Enables tracking the life-cycle of the content."
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
* description ^comment = "The description is not intended to describe the semantics of the concept map. The description should capture its intended use, which is needed for ensuring integrity for its use in models across future changes."
* description ^mustSupport = false
* description ^mapping[0].identity = "rim"
* description ^mapping[0].map = "N/A"
* useContext 0..0
* useContext ^mustSupport = false
* jurisdiction 0..0
* jurisdiction ^mustSupport = false
* purpose 0..0
* purpose ^mustSupport = false
* copyright 0..0
* copyright ^comment = "& Frequently, the copyright differs between the concept map, and codes that are included. The copyright statement should clearly differentiate between these when required."
* copyright ^mustSupport = false
* source[x] 1..1 MS
* source[x] ^short = "Identifies the source of the concepts which are being mapped"
* source[x] ^definition = "The source value set that specifies the concepts that are being mapped."
* source[x] ^comment = "This points to the device for which the IVD Test Codes are mapped to the suggested LOINC codes."
* target[x] 1..1 MS
* target[x] ^short = "Provides context to the mappings"
* target[x] ^definition = "The target value set provides context to the mappings. Note that the mapping is made between concepts, not between value sets, but the value set provides important context about how the concept mapping choices are made."
* target[x] ^comment = "This points to the LIVDLOINCCodeSystemProfile that contains the LOINC codes and their properties, used to map the  IVD Test Codes."
* group 1..1 MS
* group ^short = "Same source and target systems"
* group ^definition = "A group of mappings that all have the same source and target system."
* group ^comment = "Considering the scope is only IVD Test Code to LOINC, one group is sufficient."
* group.source 0..0
* group.source ^short = "Source code system"
* group.source ^definition = "An absolute URI that identifies the Code System for the Vendor Analyte Codes."
* group.source ^mustSupport = false
* group.sourceVersion 0..0
* group.sourceVersion ^short = "Specific version of the  code system"
* group.sourceVersion ^definition = "The specific version of the code system, as determined by the manufacturer."
* group.sourceVersion ^comment = "The specification of a particular code system version may be required for code systems which lack concept permanence."
* group.sourceVersion ^mustSupport = false
* group.target 0..0
* group.target ^short = "Target code system"
* group.target ^definition = "An absolute URI that identifies the code system for the LOINC codes referenced."
* group.target ^comment = "Target may be omitted if all the target element equivalence values are 'unmatched'."
* group.target ^mustSupport = false
* group.targetVersion 0..0
* group.targetVersion ^short = "Specific version of the  code system"
* group.targetVersion ^definition = "The specific version of the code system, as established by the manufacturer for this publication."
* group.targetVersion ^mustSupport = false
* group.element 1..* MS
* group.element ^short = "Mappings for a Vendor Analyte Code from the source set"
* group.element ^definition = "Mappings for an individual Vendor Analyte Code in the source to one or more LOINC Codes in the target."
* group.element ^comment = "Generally an Vendor Analyte Code points to one or more LOINC Codes, but it is possible that a LOINC Code does not exist yet."
* group.element ^alias[0] = "code"
* group.element ^alias[1] = "concept"
* group.element ^alias[2] = "item"
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
* group.element.target.equivalence ^short = "relatedto | equivalent | equal | wider | subsumes | narrower | specializes | inexact | unmatched | disjoint"
* group.element.target.equivalence ^definition = "The equivalence between the source and target concepts (counting for the dependencies and products). The equivalence is read from target to source (e.g. the target is 'wider' than the source)."
* group.element.target.equivalence ^comment = "This element is labeled as a modifier because it may indicate that a target does not apply."
* group.element.target.comment 0..1 MS
* group.element.target.comment ^short = "Vendor Comment"
* group.element.target.comment ^definition = "A description of status, issues, or other mapping criteria in mapping that conveys additional information not represented in  the structured data."
* group.element.target.comment ^comment = "This provides the ability for the vendor for additional human readable clarifications to the Laboratory on how to consider mapping IVD Test Codes to LOINC codes beyond the Result and Specimen descriptions in the dependsOn construct."
* group.element.target.dependsOn ..3 MS
* group.element.target.dependsOn ^slicing.discriminator[0].type = #value
* group.element.target.dependsOn ^slicing.discriminator[0].path = "property"
* group.element.target.dependsOn ^slicing.rules = #open
* group.element.target.dependsOn ^short = "Other elements required for this mapping (from context)"
* group.element.target.dependsOn ^definition = "A set of additional dependencies for this mapping to hold other than those for specimen or result. This mapping is only applicable if the specified element can be resolved, and it has the specified value."
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
* group.element.target.dependsOn[specimen].system ^short = "Code System (if necessary)"
* group.element.target.dependsOn[specimen].system ^definition = "An absolute URI that identifies the code system of the dependency code (if the source/dependency is a value set that crosses code systems)."
* group.element.target.dependsOn[specimen].system ^mustSupport = false
* group.element.target.dependsOn[specimen].value 1..1 MS
* group.element.target.dependsOn[specimen].value ^short = "Value of the specimen property"
* group.element.target.dependsOn[specimen].value ^definition = "This provides the coded representation of the description for the Specimen description."
* group.element.target.dependsOn[specimen].value ^comment = "This human readable description provides further information for use by the Lab staff to finalize the appropriate mapping of the analyte test code to the LOINC code for the specific device and purpose within that Lab."
* group.element.target.dependsOn[specimen].display 0..0
* group.element.target.dependsOn[specimen].display ^short = "Display for the code"
* group.element.target.dependsOn[specimen].display ^definition = "This represents the vendor description for the Specimen description."
* group.element.target.dependsOn[specimen].display ^mustSupport = false
* group.element.target.dependsOn contains result 1..1 MS
* group.element.target.dependsOn[result] ^short = "The property for result"
* group.element.target.dependsOn[result].property 1..1 MS
* group.element.target.dependsOn[result].property only uri
* group.element.target.dependsOn[result].property = "result" (exactly)
* group.element.target.dependsOn[result].property ^short = "Reference to property mapping depends on"
* group.element.target.dependsOn[result].property ^definition = "A reference to an element that holds a coded value that corresponds to a code system property. The idea is that the information model carries an element somwhere that is labeled to correspond with a code system property."
* group.element.target.dependsOn[result].property ^comment = "This references the list of characteristics, e.g., Specimen, Resul, or Othert, for which further clarifying descriptions are provided."
* group.element.target.dependsOn[result].system 0..0
* group.element.target.dependsOn[result].system ^short = "Code System (if necessary)"
* group.element.target.dependsOn[result].system ^definition = "An absolute URI that identifies the code system of the dependency code (if the source/dependency is a value set that crosses code systems)."
* group.element.target.dependsOn[result].system ^mustSupport = false
* group.element.target.dependsOn[result].value 1..1 MS
* group.element.target.dependsOn[result].value ^short = "Value of the result property"
* group.element.target.dependsOn[result].value ^definition = "This provides the coded representation of the description for the Result description."
* group.element.target.dependsOn[result].value ^comment = "This human readable description provides further information for use by the Lab staff to finalize the appropriate mapping of the analyte test code to the LOINC code for the specific device and purpose within that Lab."
* group.element.target.dependsOn[result].display 0..0
* group.element.target.dependsOn[result].display ^short = "Display for the code"
* group.element.target.dependsOn[result].display ^definition = "This represents the vendor description for the Result description."
* group.element.target.dependsOn[result].display ^mustSupport = false
* group.element.target.dependsOn contains other 0..1 MS
* group.element.target.dependsOn[other] ^short = "The property for other"
* group.element.target.dependsOn[other].property 1..1 MS
* group.element.target.dependsOn[other].property only uri
* group.element.target.dependsOn[other].property = "other" (exactly)
* group.element.target.dependsOn[other].property ^short = "Reference to property mapping depends on"
* group.element.target.dependsOn[other].property ^definition = "A reference to an element that holds a coded value that corresponds to a code system property. The idea is that the information model carries an element somwhere that is labeled to correspond with a code system property."
* group.element.target.dependsOn[other].property ^comment = "This references the list of characteristics, e.g., Specimen, Result or Other, for which further clarifying descriptions are provided."
* group.element.target.dependsOn[other].system 0..0
* group.element.target.dependsOn[other].system ^short = "Code System (if necessary)"
* group.element.target.dependsOn[other].system ^definition = "An absolute URI that identifies the code system of the dependency code (if the source/dependency is a value set that crosses code systems)."
* group.element.target.dependsOn[other].system ^mustSupport = false
* group.element.target.dependsOn[other].value 1..1 MS
* group.element.target.dependsOn[other].value ^short = "Value of the other value property"
* group.element.target.dependsOn[other].value ^definition = "This provides the coded representation of the description for an additional dependency (not Specimen or Result) description."
* group.element.target.dependsOn[other].value ^comment = "This human readable description provides further information for use by the Lab staff to finalize the appropriate mapping of the analyte test code to the LOINC code for the specific device and purpose within that Lab."
* group.element.target.dependsOn[other].display 0..0
* group.element.target.dependsOn[other].display ^short = "Display for the code"
* group.element.target.dependsOn[other].display ^definition = "This represents the vendor description for an additional dependency (not Specimen or Result) description."
* group.element.target.dependsOn[other].display ^mustSupport = false
* group.element.target.product 0..0
* group.element.target.product ^short = "Other concepts that this mapping also produces"
* group.element.target.product ^definition = "A set of additional outcomes from this mapping to other elements. To properly execute this mapping, the specified element must be mapped to some data element or source that is in context. The mapping may still be useful without a place for the additional data elements, but the equivalence cannot be relied on."
* group.element.target.product ^mustSupport = false
* group.unmapped 0..0
* group.unmapped ^short = "When no match in the mappings"
* group.unmapped ^definition = "What to do when there is no match in the mappings in the group."
* group.unmapped ^comment = "This only applies if the source code is in the system defined for the group."
* group.unmapped ^mustSupport = false
* group.unmapped.mode 1..1
* group.unmapped.mode ^short = "provided | fixed | other-map"
* group.unmapped.mode ^definition = "Defines which action to take if there is no match in the group. One of 3 actions is possible: use the unmapped code (this is useful when doing a mapping between versions, and only a few codes have changed), use a fixed code (a default code), or alternatively, a reference to a different concept map can be provided (by canonical URL)."
* group.unmapped.mode ^mustSupport = false
* group.unmapped.code 0..1
* group.unmapped.code ^short = "Fixed code when mode = fixed"
* group.unmapped.code ^definition = "The fixed code to use when the mode = 'fixed'  - all unmapped codes are mapped to a single fixed code."
* group.unmapped.code ^mustSupport = false
* group.unmapped.display 0..1
* group.unmapped.display ^short = "Display for the code"
* group.unmapped.display ^definition = "The display for the code. The display is only provided to help editors when editing the concept map."
* group.unmapped.display ^comment = "The display is ignored when processing the map."
* group.unmapped.display ^mustSupport = false
* group.unmapped.url 0..1
* group.unmapped.url ^short = "Canonical URL for other concept map"
* group.unmapped.url ^definition = "The canonical URL of the map to use if this map contains no mapping."
* group.unmapped.url ^mustSupport = false
