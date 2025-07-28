Extension: LIVDDevice
Id: ext-device
Title: "LIVD Device"
Description: "Add a reference from the ObservationDefinition to the Device."
* ^version = "1.0.0"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "ObservationDefinition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-device" (exactly)
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
