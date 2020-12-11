Profile: LIVDDeviceDefinition
Parent: http://hl7.org/fhir/StructureDefinition/DeviceDefinition
Id: devicedefinition-uv-livd
Title: "LIVDDeviceDefinition"
Description: "Explanation of what this profile contains/is for"
* ^version = "0.3.0"
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International - Orders and Observations Work Group"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://hl7.org/Special/committees/orders/index.cfm"
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
* identifier 0..0
* identifier only Identifier
* identifier ^short = "Instance identifier"
* identifier ^definition = "Unique instance identifiers assigned to a device by manufacturers other organizations or owners."
* identifier ^comment = "The barcode string from a barcode present on a device label or package may identify the instance, include names given to the device in local usage, or may identify the type of device. If the identifier identifies the type of device, Device.type element should be used.  For [UDI](device.html#5.11.3.2.2),  this element corresponds to the variable portion of the UDI that identifies the serial number of a specific device. See [UDI mappings](device-mappings.html#udi) for a complete mapping of UDI parts to Device."
* identifier ^alias[0] = "Serial Number"
* identifier ^mustSupport = false
* identifier ^mapping[0].identity = "rim"
* identifier ^mapping[0].map = ".id"
* identifier ^mapping[1].identity = "udi"
* identifier ^mapping[1].map = "The serial number which is a component of the production identifier (PI), a conditional, variable portion of a UDI.   The identifier.type code should be set to “SNO”(Serial Number) and the system left empty."
* udiDeviceIdentifier 0..1 MS
* udiDeviceIdentifier only BackboneElement
* udiDeviceIdentifier ^short = "Unique Device Identifier (UDI) Barcode string"
* udiDeviceIdentifier ^definition = "[Unique device identifier (UDI)](device.html#5.11.3.2.2) assigned to device label or package."
* udiDeviceIdentifier ^comment = "In this profile only a type of device can be represented where the UDI only identifies the type of the device."
* udiDeviceIdentifier ^mapping[0].identity = "rim"
* udiDeviceIdentifier ^mapping[0].map = ".id and .code"
* udiDeviceIdentifier.deviceIdentifier 1..1 MS
* udiDeviceIdentifier.deviceIdentifier only string
* udiDeviceIdentifier.deviceIdentifier ^short = "Mandatory fixed portion of UDI"
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
* udiDeviceIdentifier.issuer only uri
* udiDeviceIdentifier.issuer ^short = "UDI Issuing Organization"
* udiDeviceIdentifier.issuer ^definition = "Organization that is charged with issuing UDIs for devices.  For example, the US FDA issuers include :\n1) GS1: \nhttp://hl7.org/fhir/NamingSystem/gs1-di, \n2) HIBCC:\nhttp://hl7.org/fhir/NamingSystem/hibcc-dI, \n3) ICCBBA for blood containers:\nhttp://hl7.org/fhir/NamingSystem/iccbba-blood-di, \n4) ICCBA for other devices:\nhttp://hl7.org/fhir/NamingSystem/iccbba-other-di."
* udiDeviceIdentifier.issuer ^requirements = "This field is required when Device.udi.deviceIdentifier is valued."
* udiDeviceIdentifier.issuer ^alias[0] = "Barcode System"
* udiDeviceIdentifier.issuer ^mapping[0].identity = "rim"
* udiDeviceIdentifier.issuer ^mapping[0].map = "Role.id.root"
* udiDeviceIdentifier.issuer ^mapping[1].identity = "udi"
* udiDeviceIdentifier.issuer ^mapping[1].map = "All UDIs are to be issued under a system operated by an Jurisdiction-accredited issuing agency.\nGS1 DIs: \n http://hl7.org/fhir/NamingSystem/gs1\nHIBCC DIs:\n http://hl7.org/fhir/NamingSystem/hibcc\nICCBBA DIs for blood containers:\n http://hl7.org/fhir/NamingSystem/iccbba-blood\nICCBA DIs for other devices:\n http://hl7.org/fhir/NamingSystem/iccbba-other"
* udiDeviceIdentifier.jurisdiction 1..1 MS
* udiDeviceIdentifier.jurisdiction only uri
* udiDeviceIdentifier.jurisdiction ^short = "Regional UDI authority"
* udiDeviceIdentifier.jurisdiction ^definition = "The identity of the authoritative source for UDI generation within a  jurisdiction.  All UDIs are globally unique within a single namespace. with the appropriate repository uri as the system.  For example,  UDIs of devices managed in the U.S. by the FDA, the value is  http://hl7.org/fhir/NamingSystem/fda-udi."
* udiDeviceIdentifier.jurisdiction ^requirements = "Allows a recipient of a UDI to know which database will contain the UDI-associated metadata."
* udiDeviceIdentifier.jurisdiction ^mapping[0].identity = "rim"
* udiDeviceIdentifier.jurisdiction ^mapping[0].map = "Role.scoper"
* manufacturer[x] 1..1 MS
* manufacturer[x] only string
* deviceName 0..0
* deviceName only BackboneElement
* deviceName ^mustSupport = false
* deviceName.name 1..1
* deviceName.name only string
* deviceName.name ^alias[0] = "Σ"
* deviceName.name ^mustSupport = false
* deviceName.type 1..1
* deviceName.type only code
* deviceName.type ^mustSupport = false
* modelNumber 1..1 MS
* modelNumber only string
* modelNumber ^short = "Model id assigned by the manufacturer"
* modelNumber ^definition = "The \"model\" is an identifier assigned by the manufacturer to identify the product by its type. This number is shared by all the devices sold as the same type.  This would represent the device model/type at the level of granularity that the manufacturer believes is most appropriate to enable the best guidance to assist in the mapping for a particular device used in the Lab."
* modelNumber ^comment = "The Device.model field is used to map the Device to the correct Concept Map (using ConceptMap.group.source) and IVD Test Code System (using CodeSystem.identifier)."
* modelNumber ^mapping[0].identity = "v2"
* modelNumber ^mapping[0].map = "OBX-18.1 (pre-V2.7) or PRT-10.1 (V2.7 onward)"
* modelNumber ^mapping[1].identity = "rim"
* modelNumber ^mapping[1].map = ".playedRole[typeCode=MANU].code"
* type 0..0
* type only CodeableConcept
* type ^short = "What kind of device this is"
* type ^definition = "Code or identifier to identify a kind of device."
* type ^mustSupport = false
* type ^mapping[0].identity = "rim"
* type ^mapping[0].map = ".code"
* type ^mapping[1].identity = "udi"
* type ^mapping[1].map = "Type description using GMDN or other code system"
* specialization 0..0
* specialization only BackboneElement
* specialization ^mustSupport = false
* specialization.systemType 1..1
* specialization.systemType only string
* specialization.systemType ^alias[0] = "Σ"
* specialization.systemType ^mustSupport = false
* specialization.version 0..1
* specialization.version only string
* specialization.version ^mustSupport = false
* version 0..0
* version only string
* version ^short = "Version number (i.e. software)"
* version ^definition = "The version of the device, if the device has multiple releases under the same model, or if the device is software or carries firmware."
* version ^mustSupport = false
* version ^mapping[0].identity = "rim"
* version ^mapping[0].map = ".softwareName (included as part)"
* safety 0..0
* safety only CodeableConcept
* safety ^short = "Safety Characteristics of Device"
* safety ^definition = "Provides additional safety characteristics about a medical device.  For example devices containing latex."
* safety ^mustSupport = false
* safety ^mapping[0].identity = "rim"
* safety ^mapping[0].map = "NA"
* shelfLifeStorage 0..0
* shelfLifeStorage only ProductShelfLife
* shelfLifeStorage ^mustSupport = false
* physicalCharacteristics 0..0
* physicalCharacteristics only ProdCharacteristic
* physicalCharacteristics ^mustSupport = false
* languageCode 0..0
* languageCode only CodeableConcept
* languageCode ^mustSupport = false
* capability 1..* MS
* capability only BackboneElement
* capability.extension contains http://hl7.org/fhir/uv/livd/StructureDefinition/ext-capability named DeviceDefinitionExtensionCapability 1..* MS
* capability.type 1..1 MS
* capability.type only CodeableConcept
* capability.type ^comment = "removed \"DeviceCapabilityType (ObservationDefinition)\" from Value column."
* capability.description 0..0
* capability.description only CodeableConcept
* capability.description ^mustSupport = false
* property 0..0
* property only BackboneElement
* property ^mustSupport = false
* property.type 1..1
* property.type only CodeableConcept
* property.type ^mustSupport = false
* property.valueQuantity 0..*
* property.valueQuantity only Quantity
* property.valueQuantity ^mustSupport = false
* property.valueCode 0..*
* property.valueCode only CodeableConcept
* property.valueCode ^mustSupport = false
* owner 0..0
* owner only Reference(http://hl7.org/fhir/StructureDefinition/Organization)
* owner ^short = "Organization responsible for device"
* owner ^definition = "An organization that is responsible for the provision and ongoing maintenance of the device."
* owner ^mustSupport = false
* owner ^mapping[0].identity = "rim"
* owner ^mapping[0].map = ".playedRole[typeCode=OWN].scoper"
* contact 0..0
* contact only ContactPoint
* contact ^short = "Details for human/organization for support"
* contact ^definition = "Contact details for an organization or a particular human that is responsible for the device."
* contact ^comment = "used for troubleshooting etc."
* contact ^mustSupport = false
* contact ^mapping[0].identity = "rim"
* contact ^mapping[0].map = ".scopedRole[typeCode=CON].player"
* url 0..0
* url only uri
* url ^short = "Network address to contact device"
* url ^definition = "A network address on which the device may be contacted directly."
* url ^comment = "If the device is running a FHIR server, the network address should  be the Base URL from which a conformance statement may be retrieved."
* url ^mustSupport = false
* url ^mapping[0].identity = "rim"
* url ^mapping[0].map = ".telecom"
* onlineInformation 0..0
* onlineInformation only uri
* onlineInformation ^mustSupport = false
* note 0..0
* note only Annotation
* note ^short = "Device notes and comments"
* note ^definition = "Descriptive information, usage information or implantation information that is not captured in an existing element."
* note ^mustSupport = false
* note ^mapping[0].identity = "rim"
* note ^mapping[0].map = ".text"
* quantity 0..0
* quantity only Quantity
* quantity ^mustSupport = false
