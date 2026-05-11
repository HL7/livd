Extension: LIVDDevice
Id: ext-livd-devicedefinition
Title: "LIVD DeviceDefinition"
Description: "Add a reference from the ObservationDefinition to the Device."
* ^version = "1.0.0"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "ObservationDefinition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-livd-devicedefinition" (exactly)
* valueReference 1..1
* valueReference only Reference(http://hl7.org/fhir/uv/livd/StructureDefinition/devicedefinition-uv-livd)

Extension: LIVDTestAnalyte
Id: ext-analyte
Title: "LIVD Test Analyte"
Description: "Add a reference from DeviceDefinition.capability to one or more ObservationDefinition resources representing test analytes that may be measured."
* ^version = "1.0.0"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "DeviceDefinition.capability"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-analyte" (exactly)
* valueReference 1..
* valueReference only Reference(http://hl7.org/fhir/uv/livd/StructureDefinition/observationdefinition-uv-livd)

Extension: LIVDVendorReferenceIdentifier
Id: ext-vendorReferenceIdentifier
Title: "LIVD Vendor Reference Identifier"
Description: "Add a vendor reference identifier to ObservationDefinition."
* ^version = "1.0.0"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "ObservationDefinition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-vendorReferenceIdentifier" (exactly)
* valueIdentifier 1..1
* valueIdentifier only Identifier

Extension: LIVDRegion
Id: ext-region
Title: "LIVD Region"
Description: "Provides the region(s), such as country, state, continent, set of countries or states, where the LIVD Mapping Publication applies."
* ^version = "1.0.0"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "Composition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-region" (exactly)
* valueCodeableConcept 1..1
* valueCodeableConcept only CodeableConcept

Extension: LIVDVersion
Id: ext-version
Title: "LIVD Version"
Description: "Provides the version of the LIVD Mapping Publication."
* ^version = "1.0.0"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "Composition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-version" (exactly)
* valueCodeableConcept 1..1
* valueCodeableConcept only CodeableConcept

Extension: LIVDLanguage
Id: ext-language
Title: "LIVD Language"
Description: "Provides the language of the LIVD Mapping Publication."
* ^version = "1.0.0"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "Composition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-language" (exactly)
* valueCodeableConcept 1..1
* valueCodeableConcept only CodeableConcept

Extension: DeviceDefinitionHasPart
Id: ext-deviceDefinition-hasPart
Title: "DeviceDefinition hasPart"
Description: "A device that is part of the current one."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #oo
* ^extension[1].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[1].valueCode = #draft
* ^extension[2].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[2].valueInteger = 0
* ^context[0].type = #element
* ^context[0].expression = "DeviceDefinition"
* value[x] only Reference(http://hl7.org/fhir/StructureDefinition/DeviceDefinition)
* value[x] 1..1 MS

Extension: DeviceDefinitionClassificationType
Id: ext-deviceDefinition-classification-type
Title: "DeviceDefinition Classification Type"
Description: "A classification or risk class of the device model."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #oo
* ^extension[1].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[1].valueCode = #draft
* ^extension[2].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[2].valueInteger = 1
* ^extension[3].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics"
* ^extension[3].valueCode = #can-bind
* ^context[0].type = #element
* ^context[0].expression = "DeviceDefinition"
* value[x] only CodeableConcept
* value[x] 1..1 MS
* value[x] from http://hl7.org/fhir/ValueSet/device-type (extensible)

Extension: DeviceDefinitionSupportedAnalytics
Id: ext-supported-analytics
Title: "Supported Analytics"
Description: "Identifies ObservationDefinition references supported by the DeviceDefinition capability."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #oo
* ^extension[1].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[1].valueCode = #draft
* ^extension[2].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[2].valueInteger = 0
* ^context[0].type = #element
* ^context[0].expression = "DeviceDefinition"
* value[x] only uri
* valueUri 1..1