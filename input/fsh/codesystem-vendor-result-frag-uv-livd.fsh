Profile: LIVDCodeSystemFragmentVendorResult
Parent: http://hl7.org/fhir/StructureDefinition/CodeSystem
Id: codesystem-vendor-result-frag-uv-livd
Title: "LIVDCodeSystemFragmentVendorResult"
Description: "Profile on the CodeSystem resource to include the relevant information from a manufacturer for their set of IVD Result Codes that are relevant to this LIVD catalog."
* ^version = "1.0.0-ballot"
* ^status = #draft
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDCodeSystemFragmentVendorResult"
* . ^mustSupport = false
* . ^mapping[0].identity = "rim"
* . ^mapping[0].map = "N/A"
* url 1..1 MS
* url only uri
* url ^short = "& (Coding.system)"
* url ^definition = "& This is used in [Coding]{datatypes.html#Coding}.system."
* version ^short = "& (Coding.version)"
* version ^definition = "& This is used in [Coding]{datatypes.html#Coding}.version."
* name 1..1 MS
* title 1..1 MS
* status 1..1 MS
* date ^mustSupport = false
* contact 0..0
* contact ^mustSupport = false
* useContext 0..0
* useContext ^mustSupport = false
* jurisdiction ^mustSupport = false
* purpose 0..0
* purpose ^mustSupport = false
* caseSensitive 0..1
* caseSensitive only boolean
* caseSensitive = false (exactly)
* caseSensitive ^mustSupport = false
* valueSet 0..0
* valueSet ^mustSupport = false
* hierarchyMeaning 0..0
* hierarchyMeaning ^mustSupport = false
* compositional 0..0
* compositional ^mustSupport = false
* versionNeeded 0..0
* versionNeeded ^mustSupport = false
* content 1..1 MS
* content only code
* content = #fragment (exactly)
* content ^short = "fragment"
* content ^definition = "This codes system profile contains the applicable subset of the IVD Vendor Result codes used in the LIVD Catalog."
* supplements 0..0
* supplements ^mustSupport = false
* count 0..0
* count ^mustSupport = false
* filter 0..0
* filter ^mustSupport = false
* property 0..0
* property ^mustSupport = false
* concept 1..* MS
* concept.code 1..1 MS
* concept.display 1..1 MS
* concept.display ^comment = "This contains the manufacturers result description (commonly will be the same as the code)."
* concept.definition 0..0
* concept.definition ^mustSupport = false
* concept.designation 0..0
* concept.designation ^mustSupport = false
* concept.property 0..0
* concept.property ^mustSupport = false
* concept.concept 0..0
* concept.concept ^mustSupport = false