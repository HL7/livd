Extension: LIVDDevice
Id: ext-device
Title: "LIVD Device"
Description: "Add a reference from the ObservationDefinition to the Device."
* ^context[0].type = #element
* ^context[0].expression = "ObservationDefinition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-device" (exactly)
* valueReference 1..1
* valueReference only Reference(http://hl7.org/fhir/uv/livd/StructureDefinition/devicedefinition-uv-livd)

Extension: LIVDTestCapability
Id: ext-capability
Title: "LIVD Test Capability"
Description: "Add a reference from DeviceDefinition.capability to one or more test capabilities."
* ^context[0].type = #element
* ^context[0].expression = "DeviceDefinition.capability"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-capability" (exactly)
* valueReference 1..
* valueReference only Reference(http://hl7.org/fhir/uv/livd/StructureDefinition/observationdefinition-uv-livd)

Extension: LIVDVendorReferenceIdentifier
Id: ext-vendorReferenceIdentifier
Title: "LIVD Vendor Reference Identifier"
Description: "Add a vendor reference identifier to ObservationDefinition."
* ^context[0].type = #element
* ^context[0].expression = "ObservationDefinition"
* url = "http://hl7.org/fhir/uv/livd/StructureDefinition/ext-vendorReferenceIdentifier" (exactly)
* valueIdentifier 1..1
* valueIdentifier only Identifier
