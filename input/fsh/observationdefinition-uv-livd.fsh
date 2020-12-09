Profile: LIVDObservationDefinition
Parent: http://hl7.org/fhir/StructureDefinition/ObservationDefinition
Id: observationdefinition-uv-livd
Title: "LIVDObservationDefinition"
Description: "Explanation of what this profile contains/is for"
* ^version = "0.2.0"
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International - Orders and Observations Work Group"
* ^contact[0].telecom[0].system = #other
* ^contact[0].telecom[0].value = "http://hl7.org/Special/committees/orders/index.cfm"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDObservationDefinition"
* . ^comment = "An instance of this resource informs the consumer of a health-related service (such as a lab diagnostic test or panel) about how the observations used or produced by this service will look like."
* . ^mustSupport = false
* . ^mapping[0].identity = "v2"
* . ^mapping[0].map = "OM2\nOM3\nOMC"
* . ^mapping[1].identity = "rim"
* . ^mapping[1].map = "Observation[classCode=OBS, moodCode=DEF]"
* extension ..* MS
* extension ^slicing.discriminator[0].type = #value
* extension ^slicing.discriminator[0].path = "url"
* extension ^slicing.rules = #open
* extension contains http://hl7.org/fhir/uv/livd/StructureDefinition/ext-device named ObservationDefinitionDevice 1..* MS
* extension contains http://hl7.org/fhir/uv/livd/StructureDefinition/ext-vendorReferenceIdentifier named ObservationDefinitionVendorReferenceIdentifier 0..1 MS
* extension[ObservationDefinitionVendorReferenceIdentifier] ^comment = "Provides an alternate reference identifier by which the IVD Test is known.  Only the identifier.value is required."
* category 0..0
* category only CodeableConcept
* category ^definition = "A code that classifies the general type of observation."
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once. The level of granularity is defined by the category concepts in the value set."
* category ^requirements = "Used for filtering what observations are retrieved and displayed."
* category ^alias[0] = "Class of observation"
* category ^mustSupport = false
* category ^mapping[0].identity = "rim"
* category ^mapping[0].map = ".outboundRelationship[typeCode=\"COMP].target[classCode=\"LIST\", moodCode=\"DEF\"].code"
* code 1..1 MS
* code only CodeableConcept
* code ^definition = "Describes what will be observed. Sometimes this is called the observation \"name\"."
* code ^comment = "Contains both the IVD Test Code and Name of the analyte."
* code ^requirements = "Knowing what kind of observation is being made is essential to understanding the observation."
* code ^alias[0] = "Name"
* code ^mapping[0].identity = "v2"
* code ^mapping[0].map = "OM1-2"
* code ^mapping[1].identity = "rim"
* code ^mapping[1].map = "code"
* identifier 0..0
* identifier only Identifier
* identifier ^mustSupport = false
* permittedDataType 0..* MS
* permittedDataType only code
* permittedDataType ^definition = "data type allowed for the result of the observation."
* permittedDataType ^mapping[0].identity = "v2"
* permittedDataType ^mapping[0].map = "OM1-3"
* multipleResultsAllowed 0..0
* multipleResultsAllowed only boolean
* multipleResultsAllowed ^definition = "Multiple results allowed for this kind of observation."
* multipleResultsAllowed ^mustSupport = false
* method 0..1 MS
* method only CodeableConcept
* method ^definition = "The method or technique used to perform the observation."
* method ^comment = "Only used if not implicit in observation code."
* method ^requirements = "In some cases, method can impact results."
* method ^mapping[0].identity = "v2"
* method ^mapping[0].map = "OM1-14"
* method ^mapping[1].identity = "rim"
* method ^mapping[1].map = "methodCode"
* preferredReportName 0..0
* preferredReportName only string
* preferredReportName ^definition = "The preferred name to be used when reporting the results of this observation."
* preferredReportName ^mustSupport = false
* preferredReportName ^mapping[0].identity = "v2"
* preferredReportName ^mapping[0].map = "OM1-9"
* quantitativeDetails 0..1 MS
* quantitativeDetails ^definition = "Characteristics for quantitative results of this observation."
* quantitativeDetails ^mapping[0].identity = "v2"
* quantitativeDetails ^mapping[0].map = "OM2"
* quantitativeDetails.customaryUnit 0..1 MS
* quantitativeDetails.customaryUnit only CodeableConcept
* quantitativeDetails.customaryUnit ^definition = "Customary unit used to report quantitative results of this observation."
* quantitativeDetails.customaryUnit ^mapping[0].identity = "v2"
* quantitativeDetails.customaryUnit ^mapping[0].map = "OM2-2"
* quantitativeDetails.unit 0..1 MS
* quantitativeDetails.unit only CodeableConcept
* quantitativeDetails.unit ^definition = "SI unit used to report quantitative results of this observation."
* quantitativeDetails.unit ^mapping[0].identity = "v2"
* quantitativeDetails.unit ^mapping[0].map = "OM2-4"
* quantitativeDetails.conversionFactor 0..1 MS
* quantitativeDetails.conversionFactor only decimal
* quantitativeDetails.conversionFactor ^definition = "Factor for converting value expressed with SI unit to value expressed with customary unit."
* quantitativeDetails.conversionFactor ^mapping[0].identity = "v2"
* quantitativeDetails.conversionFactor ^mapping[0].map = "OM2-5"
* quantitativeDetails.decimalPrecision 0..1 MS
* quantitativeDetails.decimalPrecision only integer
* quantitativeDetails.decimalPrecision ^definition = "number of digits after decimal separator when the results of this observation are of type Quantity."
* quantitativeDetails.decimalPrecision ^mapping[0].identity = "v2"
* quantitativeDetails.decimalPrecision ^mapping[0].map = "OM2-3"
* qualifiedInterval 0..0
* qualifiedInterval ^definition = "Reference range for ordinal and continuous observations."
* qualifiedInterval ^requirements = "multiple reference ranges, for different patient contexts."
* qualifiedInterval ^mustSupport = false
* qualifiedInterval ^mapping[0].identity = "v2"
* qualifiedInterval ^mapping[0].map = "OM2-6"
* qualifiedInterval.category 0..1
* qualifiedInterval.category only code
* qualifiedInterval.category ^mustSupport = false
* qualifiedInterval.range 0..1
* qualifiedInterval.range only Range
* qualifiedInterval.range ^definition = "The value and associated unit of the low bound (inclusive) of the reference range."
* qualifiedInterval.range ^requirements = "The unit may be not relevant for ordinal values. In case it is there, it is the same as SIunit or customaryUnit."
* qualifiedInterval.range ^mustSupport = false
* qualifiedInterval.range ^mapping[0].identity = "v2"
* qualifiedInterval.range ^mapping[0].map = "OM2-6.1.1"
* qualifiedInterval.context 0..1
* qualifiedInterval.context only CodeableConcept
* qualifiedInterval.context ^definition = "Codes to indicate what part of the targeted reference population it applies to. For example, the normal or therapeutic range."
* qualifiedInterval.context ^comment = "normal range is the default."
* qualifiedInterval.context ^requirements = "what kind of reference range this is - normal, recommended, therapeutic, etc., - for proper interpretation."
* qualifiedInterval.context ^mustSupport = false
* qualifiedInterval.context ^mapping[0].identity = "v2"
* qualifiedInterval.context ^mapping[0].map = "n.a."
* qualifiedInterval.appliesTo 0..*
* qualifiedInterval.appliesTo only CodeableConcept
* qualifiedInterval.appliesTo ^definition = "Codes to indicate the target population this reference range applies to."
* qualifiedInterval.appliesTo ^comment = "If this element is not present then the global population is assumed."
* qualifiedInterval.appliesTo ^requirements = "target population (male, female, pregnancy, a specific race …."
* qualifiedInterval.appliesTo ^mustSupport = false
* qualifiedInterval.appliesTo ^mapping[0].identity = "v2"
* qualifiedInterval.appliesTo ^mapping[0].map = "OM2-6.2 OM2-6.6"
* qualifiedInterval.gender 0..1
* qualifiedInterval.gender only code
* qualifiedInterval.gender ^mustSupport = false
* qualifiedInterval.age 0..1
* qualifiedInterval.age only Range
* qualifiedInterval.age ^definition = "The age at which this reference range is applicable. This is a neonatal age (e.g. number of weeks at term) if the meaning says so."
* qualifiedInterval.age ^requirements = "Some analytes vary greatly over age."
* qualifiedInterval.age ^mustSupport = false
* qualifiedInterval.age ^mapping[0].identity = "v2"
* qualifiedInterval.age ^mapping[0].map = "OM2-6.3"
* qualifiedInterval.gestationalAge 0..1
* qualifiedInterval.gestationalAge only Range
* qualifiedInterval.gestationalAge ^definition = "The gestational age at which this reference range is applicable, in the context of pregnancy."
* qualifiedInterval.gestationalAge ^mustSupport = false
* qualifiedInterval.gestationalAge ^mapping[0].identity = "v2"
* qualifiedInterval.gestationalAge ^mapping[0].map = "OM2-6.4"
* qualifiedInterval.condition 0..1
* qualifiedInterval.condition only string
* qualifiedInterval.condition ^definition = "Text based condition for which the reference range is valid."
* qualifiedInterval.condition ^mustSupport = false
* qualifiedInterval.condition ^mapping[0].identity = "v2"
* qualifiedInterval.condition ^mapping[0].map = "OM2-6.7"
* validCodedValueSet 0..1 MS
* validCodedValueSet only Reference(http://hl7.org/fhir/StructureDefinition/ValueSet)
* validCodedValueSet ^definition = "The set of valid coded results for the observation."
* validCodedValueSet ^mapping[0].identity = "v2"
* validCodedValueSet ^mapping[0].map = "OM3-3"
* normalCodedValueSet 0..0
* normalCodedValueSet only Reference(http://hl7.org/fhir/StructureDefinition/ValueSet)
* normalCodedValueSet ^definition = "The set of normal coded results for the observation."
* normalCodedValueSet ^mustSupport = false
* normalCodedValueSet ^mapping[0].identity = "v2"
* normalCodedValueSet ^mapping[0].map = "OM3-4"
* abnormalCodedValueSet 0..0
* abnormalCodedValueSet only Reference(http://hl7.org/fhir/StructureDefinition/ValueSet)
* abnormalCodedValueSet ^definition = "The set of abnormal coded results for the observation."
* abnormalCodedValueSet ^mustSupport = false
* abnormalCodedValueSet ^mapping[0].identity = "v2"
* abnormalCodedValueSet ^mapping[0].map = "OM3-5"
* criticalCodedValueSet 0..0
* criticalCodedValueSet only Reference(http://hl7.org/fhir/StructureDefinition/ValueSet)
* criticalCodedValueSet ^definition = "The set of critical coded results for the observation."
* criticalCodedValueSet ^mustSupport = false
* criticalCodedValueSet ^mapping[0].identity = "v2"
* criticalCodedValueSet ^mapping[0].map = "OM3-6"
