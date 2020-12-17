Profile: LIVDCodeSystemFragmentSNOMED
Parent: http://hl7.org/fhir/StructureDefinition/CodeSystem
Id: codesystem-snomed-frag-uv-livd
Title: "LIVDCodeSystemFragmentSNOMED"
Description: "Profile on the CodeSystem resource to include the relevant information from SNOMED CT to enable the full mapping context without having to connect to a remote terminology service or other source of SNOMED CT terminology content."
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International - Orders and Observations Work Group"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://hl7.org/Special/committees/orders/index.cfm"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDCodeSystemFragmentSNOMED"
* . ^mustSupport = false
* . ^mapping[0].identity = "rim"
* . ^mapping[0].map = "N/A"
* url 1..1 MS
* url only uri
* url = "http://snomed.info/sct" (exactly)
* url ^short = "& (Coding.system)"
* url ^definition = "& This is used in [Coding]{datatypes.html#Coding}.system."
* identifier 1..1 MS
* version 1..1 MS
* version ^short = "& (Coding.version)"
* version ^definition = "& This is used in [Coding]{datatypes.html#Coding}.version."
* name 1..1 MS
* title 1..1 MS
* status 1..1 MS
* experimental 0..0
* experimental ^mustSupport = false
* date ^mustSupport = false
* publisher 1..1 MS
* contact 0..0
* contact ^mustSupport = false
* description 0..0
* description ^alias[0] = "Scope"
* description ^alias[1] = "Purpose"
* description ^mustSupport = false
* description ^mapping[0].identity = "rim"
* description ^mapping[0].map = "N/A"
* useContext 0..0
* useContext ^mustSupport = false
* jurisdiction ^mustSupport = false
* purpose 0..0
* purpose ^mustSupport = false
* copyright 1..1 MS
* copyright ^comment = "... Sometimes, the copyright differs between the code system and the codes that are included. The copyright statement should clearly differentiate between these when required."
* caseSensitive 0..1
* caseSensitive only boolean
* caseSensitive = false (exactly)
* caseSensitive ^short = "If code comparison is case sensitive"
* caseSensitive ^definition = "If code comparison is case sensitive when codes within this system are compared to each other."
* caseSensitive ^comment = "If this value is missing, then it is not specified whether a code system is case sensitive or not. When the rule is not known, Postel's law should be followed: produce codes with the correct case, and accept codes in any case. This element is primarily provided to support validation software."
* caseSensitive ^mustSupport = false
* valueSet 0..0
* valueSet ^short = "Canonical URL for value set with entire code system"
* valueSet ^definition = "Canonical URL of value set that contains the entire code system."
* valueSet ^comment = "The definition of the value set SHALL include all codes from this code system, and it SHALL be immutable."
* valueSet ^mustSupport = false
* hierarchyMeaning 0..0
* hierarchyMeaning ^short = "grouped-by | is-a | part-of | classified-with"
* hierarchyMeaning ^definition = "The meaning of the hierarchy of concepts."
* hierarchyMeaning ^mustSupport = false
* compositional 0..0
* compositional ^short = "If code system defines a post-composition grammar"
* compositional ^definition = "True If code system defines a post-composition grammar."
* compositional ^comment = "Note that the code system resource does not define what the compositional grammar is, only whether or not there is one."
* compositional ^alias[0] = "grammar"
* compositional ^mustSupport = false
* versionNeeded 0..0
* versionNeeded ^short = "If definitions are not stable"
* versionNeeded ^definition = "This flag is used to signify that the code system has not (or does not) maintain the definitions, and a version must be specified when referencing this code system."
* versionNeeded ^comment = "Best practice is that code systems do not redefine concepts, or that if concepts are redefined, a new code system definition is created. But this is not always possible, so some code systems may be defined as 'versionNeeded'."
* versionNeeded ^mustSupport = false
* content 1..1 MS
* content only code
* content = #fragment (exactly)
* content ^short = "fragment"
* content ^definition = "This codes system profile contains the applicable subset of the LOINC codes used in the LIVD Catalog."
* supplements 0..0
* supplements ^mustSupport = false
* count 0..0
* count ^short = "Total concepts in the code system"
* count ^definition = "The total number of concepts defined by the code system. Where the code system has a compositional grammar, the count refers to the number of base (primitive) concepts."
* count ^comment = "The count of concepts defined in this resource cannot be more than this value, but may be less for several reasons - see the content value."
* count ^mustSupport = false
* filter 0..0
* filter ^short = "Filter that can be used in a value set"
* filter ^definition = "A filter that can be used in a value set compose statement when selecting concepts using a filter."
* filter ^mustSupport = false
* filter.code 1..1 MS
* filter.code ^short = "Code that identifies the filter"
* filter.code ^definition = "The code that identifies this filter when it is used in the instance."
* filter.description 0..1 MS
* filter.description ^short = "How or why the filter is used"
* filter.description ^definition = "A description of how or why the filter is used."
* filter.operator 1..* MS
* filter.operator ^short = "Operators that can be used with filter"
* filter.operator ^definition = "A list of operators that can be used with the filter."
* filter.value 1..1 MS
* filter.value ^short = "What to use for the value"
* filter.value ^definition = "A description of what the value for the filter should be."
* property 0..0
* property ^mustSupport = false
* concept 1..* MS
* concept ^short = "Concepts in the code system"
* concept ^definition = "Concepts that are in the code system. The concept definitions are inherently hierarchical, but the definitions must be consulted to determine what the meaning of the hierarchical relationships are."
* concept ^comment = "If this is empty, it means that the code system resource does not represent the content of the code system."
* concept.code 1..1 MS
* concept.code ^short = "Code that identifies concept"
* concept.code ^definition = "A code - a text symbol - that uniquely identifies the concept within the code system."
* concept.display 1..1 MS
* concept.display ^short = "Text to display to the user"
* concept.display ^definition = "A human readable string that is the recommended default way to present this concept to a user."
* concept.display ^comment = "This contains the LOINC Long Name."
* concept.definition 0..0
* concept.definition ^short = "Formal definition"
* concept.definition ^definition = "The formal definition of the concept. The code system resource does not make formal definitions required, because of the prevalence of legacy systems. However, they are highly recommended, as without them there is no formal meaning associated with the concept."
* concept.definition ^mustSupport = false
* concept.designation 0..0
* concept.designation ^short = "Additional representations for the concept"
* concept.designation ^definition = "Additional representations for the concept - other languages, aliases, specialized purposes, used for particular purposes, etc."
* concept.designation ^requirements = "Many concept definition systems support multiple representations, in multiple languages, and for multiple purposes."
* concept.designation ^mustSupport = false
* concept.designation.language 0..1
* concept.designation.language ^short = "Human language of the designation"
* concept.designation.language ^definition = "The language this designation is defined for."
* concept.designation.language ^comment = "In the absence of a language, the resource language applies."
* concept.designation.language ^mustSupport = false
* concept.designation.use 0..1
* concept.designation.use ^short = "Details how this designation would be used"
* concept.designation.use ^definition = "A code that details how this designation would be used."
* concept.designation.use ^comment = "If no use is provided, the designation can be assumed to be suitable for general display to a human user."
* concept.designation.use ^mustSupport = false
* concept.designation.value 1..1
* concept.designation.value ^short = "The text value for this designation"
* concept.designation.value ^definition = "The text value for this designation."
* concept.designation.value ^mustSupport = false
* concept.property 0..0
* concept.property ^mustSupport = false
* concept.concept 0..0
* concept.concept ^mustSupport = false
