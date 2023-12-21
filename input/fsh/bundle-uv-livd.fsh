Profile: LIVDBundle
Parent: http://hl7.org/fhir/StructureDefinition/Bundle
Id: bundle-uv-livd
Title: "LIVDBundle"
Description: "LIVD constraints on the Bundle resource"
* ^version = "1.0.0-ballot"
* ^status = #draft
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDBundle"
* . ^mustSupport = false
* . ^mapping[0].identity = "v2"
* . ^mapping[0].map = "N/A"
* . ^mapping[1].identity = "rim"
* . ^mapping[1].map = "N/A"
* identifier 1..1 MS
* identifier ^comment = "This value must be the same as the Composition.identifier value as there is only on instance of LIVDCatalogProfile in the bundle.  It represents the logical identifier for the publication by the vendor."
* type 1..1 MS
* type only code
* type from http://hl7.org/fhir/uv/livd/ValueSet/livd-bundle-type (required)
* type ^short = "The bundle type"
* type ^definition = "Indicates the purpose of this bundle - how it was intended to be used.  It can be either a collection or a transaction (may depend on what servers will support)."
* type ^comment = "The bundle represents a collection of resources that make up the LIVD Publication."
* type ^binding.description = "Allowed types of bundles for the LIVD catalog"
* timestamp 0..0
* timestamp ^comment = "This element is constrained out as it is more suitable for dynamic query responses than when a publication was created considering that Composition.date already captures that."
* timestamp ^mustSupport = false
* total 0..0
* total ^mustSupport = false
* link 0..0
* link ^mustSupport = false
* link.relation ^mustSupport = false
* link.url ^mustSupport = false
* entry 5..* MS
* entry ^comment = "The bundle must contain at least 5 entries such that there is exactly one LIVDCatalog instance, at least one LIVDObservationDefinition instance, at least one LIVDDeviceDefinition instance, at least one LIVDTestCodeConceptMap instance, and at least one LIVDValueSet instance."
* entry.link 0..0
* entry.link ^mustSupport = false
* entry.fullUrl 0..1 MS
* entry.resource 1..1 MS
* entry.resource ^definition = "The Resources for the entry."
* entry.resource ^comment = "(LIVDCatalog | LIVDObservationDefinition | LIVDDeviceDefinition | LIVDTestCodeConceptMap | LIVDValueSet )."
* entry.search 0..0
* entry.search ^mustSupport = false
* entry.search.mode ^mustSupport = false
* entry.search.score ^mustSupport = false
* entry.request 0..1 MS
* entry.request ^short = "Transaction Related Information"
* entry.request ^definition = "Additional information about how this entry should be processed as part of a transaction."
* entry.request.method 1..1 MS
* entry.request.method ^short = "GET | POST | PUT | DELETE"
* entry.request.method ^definition = "The HTTP verb for this entry in either a change history, or a transaction/ transaction response."
* entry.request.url 1..1 MS
* entry.request.ifNoneMatch ^mustSupport = false
* entry.request.ifModifiedSince ^mustSupport = false
* entry.request.ifMatch ^mustSupport = false
* entry.request.ifNoneExist ^mustSupport = false
* entry.response 0..0
* entry.response ^mustSupport = false
* entry.response.status ^mustSupport = false
* entry.response.location ^mustSupport = false
* entry.response.etag ^mustSupport = false
* entry.response.lastModified ^mustSupport = false
* entry.response.outcome ^mustSupport = false
* signature 0..0
