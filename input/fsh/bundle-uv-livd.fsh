Profile: LIVDBundle
Parent: http://hl7.org/fhir/StructureDefinition/Bundle
Id: bundle-uv-livd
Title: "LIVDBundle"
Description: "Explanation of what this profile contains/is for"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International - Orders and Observations Work Group"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://hl7.org/Special/committees/orders/index.cfm"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDBundle"
* . ^mustSupport = false
* . ^mapping[0].identity = "v2"
* . ^mapping[0].map = "N/A"
* . ^mapping[1].identity = "rim"
* . ^mapping[1].map = "N/A"
* identifier 1..1 MS
* identifier ^short = "Persistent identifier for the bundle"
* identifier ^definition = "A persistent identifier for the batch that won't change as a batch is copied from server to server."
* identifier ^comment = "This value must be the same as the Composition.identifier value as there is only on instance of LIVDCatalogProfile in the bundle.  It represents the logical identifier for the publication by the vendor."
* type 1..1 MS
* type only code
* type from http://hl7.org/fhir/uv/livd/ValueSet/livd-bundle-type (required)
* type ^short = "The bundle type"
* type ^definition = "Indicates the purpose of this bundle - how it was intended to be used.  It can be either a collection or a transaction (may depend on what servers will support)."
* type ^comment = "The bundle represents a collection of resources that make up the LIVD Publication."
* type ^binding.description = "Allowed types of bundles for the LIVD catalog"
* timestamp 0..0
* timestamp ^short = "When the bundle was assembled"
* timestamp ^definition = "The date/time that the bundle was assembled - i.e. when the resources were placed in the bundle."
* timestamp ^comment = "This element is constrained out as it is more suitable for dynamic query responses than when a publication was created considering that Composition.date already captures that."
* timestamp ^mustSupport = false
* total 0..0
* total ^short = "If search, the total number of matches"
* total ^definition = "If a set of search matches, this is the total number of matches for the search (as opposed to the number of results in this bundle)."
* total ^comment = "Only used if the bundle is a search result set. The total does not include resources such as OperationOutcome and included resources, only the total number of matching resources."
* total ^mustSupport = false
* link 0..0
* link ^short = "Links related to this Bundle"
* link ^definition = "A series of links that provide context to this bundle."
* link ^mustSupport = false
* link.relation 1..1
* link.relation ^short = "See http://www.iana.org/assignments/link-relations/link-relations.xhtml#link-relations-1"
* link.relation ^definition = "A name which details the functional use for this link - see [http://www.iana.org/assignments/link-relations/link-relations.xhtml#link-relations-1](http://www.iana.org/assignments/link-relations/link-relations.xhtml#link-relations-1)."
* link.relation ^mustSupport = false
* link.url 1..1
* link.url ^short = "Reference details for the link"
* link.url ^definition = "The reference details for the link."
* link.url ^mustSupport = false
* entry 6..* MS
* entry ^short = "Entry in the bundle - will have a resource, or information"
* entry ^definition = "An entry in a bundle resource - will either contain a resource, or information about a resource (transactions and history only)."
* entry ^comment = "The bundle must contain at least 6 entries such that there is at exactly one LIVDCatalogProfile instance, at least one LIVDCatalogEntryProfile instance, at least one LIVDDeviceDefinitionProfile instance, at least one LIVDConceptMapProfile instance, and at least one LIVDCodeSystemProfile instance."
* entry.link 0..0
* entry.link ^short = "Links related to this entry"
* entry.link ^definition = "A series of links that provide context to this entry."
* entry.link ^mustSupport = false
* entry.fullUrl 0..1 MS
* entry.fullUrl ^short = "Absolute URL for resource (server address, or UUID/OID)"
* entry.fullUrl ^definition = "The Absolute URL for the resource.  The fullUrl SHALL not disagree with the id in the resource. The fullUrl is a version independent reference to the resource. The fullUrl element SHALL have a value except that: \n* fullUrl can be empty on a POST (although it does not need to when specifying a temporary id for reference in the bundle)\n* Results from operations might involve resources that are not identified."
* entry.fullUrl ^comment = "fullUrl may not be [unique in the context of a resource](bundle.html#bundle-unique). Note that since [FHIR resources do not need to be served through the FHIR API](references.html), the absolute URL may not end with the logical id of the resource (Resource.id), but if the fullUrl does look like a RESTful server URL (e.g. meets the [regex](references.html#regex), then it SHALL end with the Resource.id."
* entry.resource 1..1 MS
* entry.resource ^short = "A resource in the bundle"
* entry.resource ^definition = "The Resources for the entry."
* entry.resource ^comment = "(LIVDCatalogProfile | LIVDCatalogEntryProfile | LIVDDeviceDefinitionProfile | LIVDConceptMapProfile | LIVDTestCodeSystemProfile | LIVDLOINCCodeSystemProfile )."
* entry.search 0..0
* entry.search ^short = "Search related information"
* entry.search ^definition = "Information about the search process that lead to the creation of this entry."
* entry.search ^mustSupport = false
* entry.search.mode 0..1
* entry.search.mode ^short = "match | include | outcome - why this is in the result set"
* entry.search.mode ^definition = "Why this entry is in the result set - whether it's included as a match or because of an _include requirement."
* entry.search.mode ^comment = "There is only one mode. In some corner cases, a resource may be included because it is both a match and an include. In these circumstances, 'match' takes precedence."
* entry.search.mode ^mustSupport = false
* entry.search.score 0..1
* entry.search.score ^short = "Search ranking (between 0 and 1)"
* entry.search.score ^definition = "When searching, the server's search ranking score for the entry."
* entry.search.score ^comment = "Servers are not required to return a ranking score. 1 is most relevant, and 0 is least relevant. Often, search results are sorted by score, but the client may specify a different sort order."
* entry.search.score ^mustSupport = false
* entry.request 0..1 MS
* entry.request ^short = "Transaction Related Information"
* entry.request ^definition = "Additional information about how this entry should be processed as part of a transaction."
* entry.request.method 1..1 MS
* entry.request.method ^short = "GET | POST | PUT | DELETE"
* entry.request.method ^definition = "The HTTP verb for this entry in either a change history, or a transaction/ transaction response."
* entry.request.url 1..1 MS
* entry.request.url ^short = "URL for HTTP equivalent of this entry"
* entry.request.url ^definition = "The URL for this entry, relative to the root (the address to which the request is posted)."
* entry.request.url ^comment = "E.g. for a Patient Create, the method would be \"POST\" and the URL would be \"Patient\". For a Patient Update, the method would be PUT, and the URL would be \"Patient/[id]\"."
* entry.request.ifNoneMatch 0..1
* entry.request.ifNoneMatch ^short = "For managing cache currency"
* entry.request.ifNoneMatch ^definition = "If the ETag values match, return a 304 Not Modified status. See the API documentation for [\"Conditional Read\"](http.html#cread)."
* entry.request.ifNoneMatch ^mustSupport = false
* entry.request.ifModifiedSince 0..1
* entry.request.ifModifiedSince ^short = "For managing update contention"
* entry.request.ifModifiedSince ^definition = "Only perform the operation if the last updated date matches. See the API documentation for [\"Conditional Read\"](http.html#cread)."
* entry.request.ifModifiedSince ^mustSupport = false
* entry.request.ifMatch 0..1
* entry.request.ifMatch ^short = "For managing update contention"
* entry.request.ifMatch ^definition = "Only perform the operation if the Etag value matches. For more information, see the API section [\"Managing Resource Contention\"](http.html#concurrency)."
* entry.request.ifMatch ^mustSupport = false
* entry.request.ifNoneExist 0..1
* entry.request.ifNoneExist ^short = "For conditional creates"
* entry.request.ifNoneExist ^definition = "Instruct the server not to perform the create if a specified resource already exists. For further information, see the API documentation for [\"Conditional Create\"](http.html#ccreate). This is just the query portion of the URL - what follows the \"?\" (not including the \"?\")."
* entry.request.ifNoneExist ^mustSupport = false
* entry.response 0..0
* entry.response ^short = "Transaction Related Information"
* entry.response ^definition = "Additional information about how this entry should be processed as part of a transaction."
* entry.response ^mustSupport = false
* entry.response.status 1..1
* entry.response.status ^short = "Status response code (text optional)"
* entry.response.status ^definition = "The status code returned by processing this entry. The status SHALL start with a 3 digit HTTP code (e.g. 404) and may contain the standard HTTP description associated with the status code."
* entry.response.status ^mustSupport = false
* entry.response.location 0..1
* entry.response.location ^short = "The location, if the operation returns a location"
* entry.response.location ^definition = "The location header created by processing this operation."
* entry.response.location ^mustSupport = false
* entry.response.etag 0..1
* entry.response.etag ^short = "The etag for the resource (if relevant)"
* entry.response.etag ^definition = "The etag for the resource, it the operation for the entry produced a versioned resource (see [Resource Metadata and Versioning](http.html#versioning) and [Managing Resource Contention](http.html#concurrency))."
* entry.response.etag ^comment = "Etags match the Resource.meta.versionId. The ETag has to match the version id in the header if a resource is included."
* entry.response.etag ^mustSupport = false
* entry.response.lastModified 0..1
* entry.response.lastModified ^short = "Server's date time modified"
* entry.response.lastModified ^definition = "The date/time that the resource was modified on the server."
* entry.response.lastModified ^comment = "This has to match the same time in the meta header if a resource is included."
* entry.response.lastModified ^mustSupport = false
* entry.response.outcome 0..1
* entry.response.outcome ^short = "OperationOutcome with hints and warnings (for batch/transaction)"
* entry.response.outcome ^definition = "An OperationOutcome containing hints and warnings produced as part of processing this entry in a batch or transaction."
* entry.response.outcome ^comment = "For a POST/PUT operation, this is the equivalent outcome that would be returned for prefer = operationoutcome - except that the resource is always returned whether or not the outcome is returned."
* entry.response.outcome ^mustSupport = false
* signature 0..1 MS
* signature ^short = "Digital Signature"
* signature ^definition = "Digital Signature - base64 encoded. XML-DSIg or a JWT."
* signature ^comment = "The signature could be created by the \"author\" of the bundle or by the originating device.   Requirements around inclusion of a signature, verification of signatures and treatment of signed/non-signed bundles is implementation-environment specific."
* signature ^requirements = "This element allows capturing signatures on documents. It also allows signatures on messages, transactions or even query responses. It may support content-authentication, non-repudiation or other business cases. This is primarily relevant where the bundle may travel through multiple hops or via other mechanisms where HTTPS non-repudiation is insufficient."
