Profile: LIVDDeviceDefinition
Parent: http://hl7.org/fhir/StructureDefinition/DeviceDefinition
Id: devicedefinition-uv-livd
Title: "LIVDDeviceDefinition"
Description: "Profile on the DeviceDefinition resource for representing the devices included in the LIVD catalog for which mappings are defined."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* ^mapping[0].identity = "rim"
* ^mapping[0].uri = "http://hl7.org/v3"
* ^mapping[0].name = "RIM Mapping"
* ^mapping[1].identity = "udi"
* ^mapping[1].uri = "http://fda.gov/UDI"
* ^mapping[1].name = "UDI Mapping"
* ^mapping[2].identity = "v2"
* ^mapping[2].uri = "http://hl7.org/v2"
* ^mapping[2].name = "HL7 v2 Mapping"
* ^mapping[3].identity = "w5"
* ^mapping[3].uri = "http://hl7.org/fhir/fivews"
* ^mapping[3].name = "FiveWs Pattern Mapping"
* . ^short = "LIVDDeviceDefinition"
* . ^mustSupport = false
* . ^mapping[0].identity = "rim"
* . ^mapping[0].map = "Device"

* id 1..1
* identifier 0..*
* identifier ^mustSupport = false
* udiDeviceIdentifier 0..1 MS
* udiDeviceIdentifier ^comment = "In this profile only a type of device can be represented where the UDI only identifies the type of the device."
* udiDeviceIdentifier ^mapping[0].identity = "rim"
* udiDeviceIdentifier ^mapping[0].map = ".id and .code"
* udiDeviceIdentifier.deviceIdentifier 1..1 MS
* udiDeviceIdentifier.deviceIdentifier ^definition = "The device identifier (DI) is a mandatory, fixed portion of a UDI that identifies the labeler and the specific version or model of a device."
* udiDeviceIdentifier.deviceIdentifier ^comment = "While the device identifier is a mandatory part of the UDI definition, for this profile the deviceidentifier does not need to be communicated.  If it is communicated, it is communicated here.  This would represent the device model/type at the level of granularity that the manufacturer believes is most appropriate to enable the best guidance to assist in the mapping for a particular device used in the Lab."
* udiDeviceIdentifier.deviceIdentifier ^alias[0] = "DI"
* udiDeviceIdentifier.deviceIdentifier ^mapping[0].identity = "v2"
* udiDeviceIdentifier.deviceIdentifier ^mapping[0].map = "OBX-18 (pre-V2.7) or PRT 10 or PRT-16 (V2.7 onward)"
* udiDeviceIdentifier.deviceIdentifier ^mapping[1].identity = "rim"
* udiDeviceIdentifier.deviceIdentifier ^mapping[1].map = "Role.id.extension"
* udiDeviceIdentifier.deviceIdentifier ^mapping[2].identity = "udi"
* udiDeviceIdentifier.deviceIdentifier ^mapping[2].map = "The device identifier (DI), a mandatory, fixed portion of a UDI that identifies the labeler and the specific version or model of a device."
* udiDeviceIdentifier.issuer 1..1 MS
* udiDeviceIdentifier.issuer ^short = "UDI Issuing Organization"
* udiDeviceIdentifier.issuer ^definition = "Organization that is charged with issuing UDIs for devices.  For example, the US FDA issuers include :\n1) GS1: \nhttp://hl7.org/fhir/NamingSystem/gs1-di, \n2) HIBCC:\nhttp://hl7.org/fhir/NamingSystem/hibcc-dI, \n3) ICCBBA for blood containers:\nhttp://hl7.org/fhir/NamingSystem/iccbba-blood-di, \n4) ICCBA for other devices:\nhttp://hl7.org/fhir/NamingSystem/iccbba-other-di."
* udiDeviceIdentifier.issuer ^requirements = "This field is required when Device.udi.deviceIdentifier is valued."
* udiDeviceIdentifier.issuer ^alias[0] = "Barcode System"
* udiDeviceIdentifier.issuer ^mapping[0].identity = "rim"
* udiDeviceIdentifier.issuer ^mapping[0].map = "Role.id.root"
* udiDeviceIdentifier.issuer ^mapping[1].identity = "udi"
* udiDeviceIdentifier.issuer ^mapping[1].map = "All UDIs are to be issued under a system operated by an Jurisdiction-accredited issuing agency.\nGS1 DIs: \n http://hl7.org/fhir/NamingSystem/gs1\nHIBCC DIs:\n http://hl7.org/fhir/NamingSystem/hibcc\nICCBBA DIs for blood containers:\n http://hl7.org/fhir/NamingSystem/iccbba-blood\nICCBA DIs for other devices:\n http://hl7.org/fhir/NamingSystem/iccbba-other"
* udiDeviceIdentifier.jurisdiction 1..1 MS
* udiDeviceIdentifier.jurisdiction ^short = "Regional UDI authority"
* udiDeviceIdentifier.jurisdiction ^definition = "The identity of the authoritative source for UDI generation within a  jurisdiction.  All UDIs are globally unique within a single namespace. with the appropriate repository uri as the system.  For example,  UDIs of devices managed in the U.S. by the FDA, the value is  http://hl7.org/fhir/NamingSystem/fda-udi."
* udiDeviceIdentifier.jurisdiction ^requirements = "Allows a recipient of a UDI to know which database will contain the UDI-associated metadata."
* udiDeviceIdentifier.jurisdiction ^mapping[0].identity = "rim"
* udiDeviceIdentifier.jurisdiction ^mapping[0].map = "Role.scoper"
* manufacturer[x] 1..1 MS
* manufacturer[x] only string
* deviceName 0..0
* deviceName ^mustSupport = false
* deviceName.name ^mustSupport = false
* deviceName.type ^mustSupport = false
* modelNumber 1..1 MS
* modelNumber ^short = "Model id assigned by the manufacturer"
* modelNumber ^definition = "The \"model\" is an identifier assigned by the manufacturer to identify the product by its type. This number is shared by all the devices sold as the same type.  This would represent the device model/type at the level of granularity that the manufacturer believes is most appropriate to enable the best guidance to assist in the mapping for a particular device used in the Lab."
* modelNumber ^comment = "The Device.model field is used to map the Device to the correct Concept Map (using ConceptMap.group.source) and IVD Test Code System (using CodeSystem.identifier)."
* modelNumber ^mapping[0].identity = "v2"
* modelNumber ^mapping[0].map = "OBX-18.1 (pre-V2.7) or PRT-10.1 (V2.7 onward)"
* modelNumber ^mapping[1].identity = "rim"
* modelNumber ^mapping[1].map = ".playedRole[typeCode=MANU].code"
* type 0..1 MS
* type from http://hl7.org/fhir/uv/livd/ValueSet/livd-device-type (extensible)
* type ^binding.description = "IVD device types for LIVD device definitions (extensible)."
* specialization 0..0
* specialization ^mustSupport = false
* specialization.systemType ^mustSupport = false
* specialization.version ^mustSupport = false
* version 0..0
* version ^mustSupport = false
* safety 0..0
* safety ^mustSupport = false
* shelfLifeStorage 0..0
* shelfLifeStorage ^mustSupport = false
* physicalCharacteristics 0..0
* physicalCharacteristics ^mustSupport = false
* languageCode 0..0
* languageCode ^mustSupport = false
* capability 0..* MS
* capability ^definition = "A reference to one or more ObservationDefinition resources representing test analytes that may be measured."
* capability.extension contains http://hl7.org/fhir/uv/livd/StructureDefinition/ext-analyte named DeviceDefinitionExtensionAnalyte 1..* MS
* capability.type 1..1 MS
* capability.type ^comment = "removed \"DeviceCapabilityType (ObservationDefinition)\" from Value column."
* capability.description 0..0
* capability.description ^mustSupport = false
* property 0..0
* property ^mustSupport = false
* property.type ^mustSupport = false
* property.valueQuantity ^mustSupport = false
* property.valueCode ^mustSupport = false
* owner 0..0
* owner ^mustSupport = false
* contact 0..0
* contact ^mustSupport = false
* url 0..0
* url ^mustSupport = false
* onlineInformation 0..0
* onlineInformation ^mustSupport = false
* note 0..0
* note ^mustSupport = false
* quantity 0..0
* quantity ^mustSupport = false
