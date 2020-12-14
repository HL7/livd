Extension: LIVDDevice
Id: ext-device
Title: "LIVD Device"
Description: "Add a reference from the ObservationDefinition to the Device."
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
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^context[0].type = #element
* ^context[0].expression = "ObservationDefinition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-vendorReferenceIdentifier" (exactly)
* valueIdentifier 1..1
* valueIdentifier only Identifier
