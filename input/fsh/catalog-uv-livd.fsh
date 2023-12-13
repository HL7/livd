Profile: LIVDCatalog
Parent: http://hl7.org/fhir/StructureDefinition/Composition
Id: catalog-uv-livd
Title: "LIVDCatalog"
Description: "Profile on the Composition resource to specify and organize the sections and references to the necessary resource content to express the LIVD catalog."
* ^version = "1.0.0-ballot"
* ^experimental = false
* ^date = "2018-08-14"
* ^publisher = "HL7 International / Orders and Observations"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction[0].coding[0].system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction[0].coding[0].code = #001
* . ^short = "LIVDCatalog"
* . ^mustSupport = false
* extension ..* MS
* extension ^slicing.discriminator[0].type = #value
* extension ^slicing.discriminator[0].path = "url"
* extension ^slicing.rules = #open
* extension contains http://hl7.org/fhir/uv/livd/StructureDefinition/ext-region named CatalogRegion 0..* MS
* language 1..1 MS
* language only code
* language ^short = "Publication Language"
* language ^definition = "Provides the language that the LIVD Mapping Publication is expressed in."
* language ^comment = "This is represented using BCP-47 (http://tools.ietf.org/html/bcp47) which includes RFC-5646."
* identifier 1..1 MS
* identifier only Identifier
* identifier ^short = "Logical identifier of the LIVD Publication"
* identifier ^definition = "The logical identifier for the publication by the vendor."
* identifier ^comment = "See discussion in resource definition for how these relate."
* identifier ^mapping[0].identity = "workflow"
* identifier ^mapping[0].map = "Event.identifier"
* identifier ^mapping[1].identity = "rim"
* identifier ^mapping[1].map = "Document.id / Document.setId"
* identifier ^mapping[2].identity = "cda"
* identifier ^mapping[2].map = ".setId"
* identifier.use 0..0
* identifier.use ^mustSupport = false
* identifier.type 0..0
* identifier.type ^mustSupport = false
* identifier.system 1..1 MS
* identifier.system only uri
* identifier.system ^short = "Publication Identifier Name Space"
* identifier.system ^definition = "Establishes the namespace for the value - that is, a URL that describes a set values that are unique."
* identifier.value 1..1 MS
* identifier.value only string
* identifier.value ^short = "Publication Identifier Value"
* identifier.value ^definition = "Provides the value of the identifier."
* identifier.period 0..0
* identifier.period ^mustSupport = false
* identifier.assigner 1..1 MS
* identifier.assigner.reference 0..0
* identifier.assigner.reference ^mustSupport = false
* identifier.assigner.identifier 0..0
* identifier.assigner.identifier ^mustSupport = false
* identifier.assigner.display 1..1 MS
* identifier.assigner.display ^short = "Publication Vendor Name"
* identifier.assigner.display ^definition = "The display name of the organization that issued/manages the identifier."
* status 1..1 MS
* status only code
* status ^short = "preliminary | final | amended | entered-in-error"
* status ^definition = "The workflow/clinical status of this composition. The status is a marker for the clinical standing of the document."
* status ^comment = "Support for final is required, while other statuses are optional.\n\nPrior statuses listed (not accurate currently?:\ninterim | final |  withdrawn."
* status ^requirements = "Need to be able to mark interim, amended, or withdrawn compositions or documents."
* status ^mapping[0].identity = "workflow"
* status ^mapping[0].map = "Event.status"
* status ^mapping[1].identity = "rim"
* status ^mapping[1].map = "interim: .completionCode=\"IN\" & ./statusCode[isNormalDatatype()]=\"active\";  final: .completionCode=\"AU\" &&  ./statusCode[isNormalDatatype()]=\"complete\" and not(./inboundRelationship[typeCode=\"SUBJ\" and isNormalActRelationship()]/source[subsumesCode(\"ActClass#CACT\") and moodCode=\"EVN\" and domainMember(\"ReviseComposition\", code) and isNormalAct()]);  amended: .completionCode=\"AU\" &&  ./statusCode[isNormalDatatype()]=\"complete\" and ./inboundRelationship[typeCode=\"SUBJ\" and isNormalActRelationship()]/source[subsumesCode(\"ActClass#CACT\") and moodCode=\"EVN\" and domainMember(\"ReviseComposition\", code) and isNormalAct() and statusCode=\"completed\"];  withdrawn : .completionCode=NI &&  ./statusCode[isNormalDatatype()]=\"obsolete\""
* status ^mapping[2].identity = "cda"
* status ^mapping[2].map = "n/a"
* type 1..1 MS
* type only CodeableConcept
* type ^short = "Kind of composition (LOINC if possible)"
* type ^definition = "Specifies the particular kind of composition (e.g. History and Physical, Discharge Summary, Progress Note). This usually equates to the purpose of making the composition."
* type ^comment = "For Composition type, LOINC is ubiquitous and strongly endorsed by HL7. Most implementation guides will require a specific LOINC code, or use LOINC as an extensible binding."
* type ^requirements = "Key metadata element describing the composition, used in searching/filtering."
* type ^mapping[0].identity = "workflow"
* type ^mapping[0].map = "Event.code"
* type ^mapping[1].identity = "rim"
* type ^mapping[1].map = "./code"
* type ^mapping[2].identity = "cda"
* type ^mapping[2].map = ".code"
* type.coding 1..1 MS
* type.coding only Coding
* type.coding ^definition = "Provides the LOINC Code for the LIVD Mapping Publication."
* type.coding.system 1..1 MS
* type.coding.system only uri
* type.coding.system ^short = "LOINC Coding System"
* type.coding.version 1..1 MS
* type.coding.version only string
* type.coding.version ^short = "LOINC Code Version"
* type.coding.code 1..1 MS
* type.coding.code only code
* type.coding.code ^short = "LIVD Mapping Publication LOINC Code"
* type.coding.code ^definition = "LOINC Code representing the LIVD Mapping Publication."
* type.coding.display 1..1 MS
* type.coding.display only string
* type.coding.userSelected 0..0
* type.coding.userSelected only boolean
* type.coding.userSelected ^mustSupport = false
* type.text 0..0
* type.text only string
* type.text ^mustSupport = false
* category 0..0
* category only CodeableConcept
* category ^short = "Categorization of Composition"
* category ^definition = "A categorization for the type of the composition - helps for indexing and searching. This may be implied by or derived from the code specified in the Composition Type."
* category ^comment = "This is a metadata field from [XDS/MHD](http://wiki.ihe.net/index.php?title=Mobile_access_to_Health_Documents_(MHD))."
* category ^requirements = "Helps humans to assess whether the composition is of interest when viewing an index of compositions or documents."
* category ^mustSupport = false
* category ^mapping[0].identity = "workflow"
* category ^mapping[0].map = "Event.subject"
* category ^mapping[1].identity = "rim"
* category ^mapping[1].map = ".outboundRelationship[typeCode=\"COMP].target[classCode=\"LIST\", moodCode=\"EVN\"].code"
* category ^mapping[2].identity = "cda"
* category ^mapping[2].map = "n/a"
* subject 0..0
* subject only Reference(http://hl7.org/fhir/StructureDefinition/Resource)
* subject ^short = "Who and/or what the composition is about"
* subject ^definition = "Who or what the composition is about. The composition can be about a person, (patient or healthcare practitioner), a device (e.g. a machine) or even a group of subjects (such as a document about a herd of livestock, or a set of patients that share a common exposure)."
* subject ^comment = "For clinical documents, this is usually the patient."
* subject ^requirements = "Essential metadata for searching for the composition. Identifies who and/or what the composition/document is about."
* subject ^mustSupport = false
* subject ^mapping[0].identity = "rim"
* subject ^mapping[0].map = ".participation[typeCode=\"SBJ\"].role[typeCode=\"PAT\"]"
* subject ^mapping[1].identity = "cda"
* subject ^mapping[1].map = ".recordTarget"
* encounter 0..0
* encounter only Reference(http://hl7.org/fhir/StructureDefinition/Encounter)
* encounter ^short = "Context of the Composition"
* encounter ^definition = "Describes the clinical encounter or type of care this documentation is associated with."
* encounter ^requirements = "Provides context for the composition and supports searching."
* encounter ^mustSupport = false
* encounter ^mapping[0].identity = "workflow"
* encounter ^mapping[0].map = "Event.context"
* encounter ^mapping[1].identity = "rim"
* encounter ^mapping[1].map = "unique(highest(./outboundRelationship[typeCode=\"SUBJ\" and isNormalActRelationship()], priorityNumber)/target[moodCode=\"EVN\" and classCode=(\"ENC\", \"PCPR\") and isNormalAct])"
* encounter ^mapping[2].identity = "cda"
* encounter ^mapping[2].map = ".componentOf.encompassingEncounter"
* date 1..1 MS
* date only dateTime
* date ^short = "Composition editing time"
* date ^definition = "The date the LIVD Mapping Publication was published."
* date ^comment = "We do not need a separate effective date/time at this point."
* date ^requirements = "dateTime is used for tracking, organizing versions and searching."
* date ^mapping[0].identity = "workflow"
* date ^mapping[0].map = "Event.occurrence[x]"
* date ^mapping[1].identity = "rim"
* date ^mapping[1].map = ".effectiveTime[type=\"TS\"]"
* date ^mapping[2].identity = "cda"
* date ^mapping[2].map = ".effectiveTime"
* author 1..1 MS
* author only Reference(http://hl7.org/fhir/StructureDefinition/Organization)
* author ^short = "Who and/or what authored the composition"
* author ^definition = "Identifies who is responsible for the information in the LIVD Mapping Publication, not necessarily who typed it in."
* author ^requirements = "Identifies who is responsible for the content."
* author ^mapping[0].identity = "workflow"
* author ^mapping[0].map = "Event.performer"
* author ^mapping[1].identity = "rim"
* author ^mapping[1].map = ".participation[typeCode=\"AUT\"].role[classCode=\"ASSIGNED\"]"
* author ^mapping[2].identity = "cda"
* author ^mapping[2].map = ".author.assignedAuthor"
* author.reference 0..0
* author.reference only string
* author.reference ^mustSupport = false
* author.identifier 0..0
* author.identifier only Identifier
* author.identifier ^mustSupport = false
* author.display 1..1 MS
* author.display only string
* author.display ^short = "Vendor Name"
* author.display ^definition = "The name of the vendor that authored the LIVD Mapping Publication."
* title 1..1 MS
* title only string
* title ^short = "LIVD Mapping Publication Title"
* title ^definition = "Official human-readable label for the LIVD Mapping Publication."
* title ^mapping[0].identity = "rim"
* title ^mapping[0].map = "./title"
* title ^mapping[1].identity = "cda"
* title ^mapping[1].map = ".title"
* confidentiality 0..0
* confidentiality only code
* confidentiality ^short = "As defined by affinity domain"
* confidentiality ^definition = "The code specifying the level of confidentiality of the Composition."
* confidentiality ^comment = "The exact use of this element, and enforcement and issues related to highly sensitive documents are out of scope for the base specification, and delegated to implementation profiles (see security section).\n\nThis element is labeled as a modifier because highly confidential documents must not be treated as if they are not."
* confidentiality ^mustSupport = false
* confidentiality ^mapping[0].identity = "rim"
* confidentiality ^mapping[0].map = ".confidentialityCode"
* confidentiality ^mapping[1].identity = "cda"
* confidentiality ^mapping[1].map = ".confidentialityCode"
* attester 0..0
* attester ^short = "Attests to accuracy of composition"
* attester ^definition = "A participant who has attested to the accuracy of the composition/document."
* attester ^comment = "Only list each attester once."
* attester ^requirements = "Identifies responsibility for the accuracy of the composition content."
* attester ^mustSupport = false
* attester ^mapping[0].identity = "rim"
* attester ^mapping[0].map = ".participation[typeCode=\"AUTHEN\"].role[classCode=\"ASSIGNED\"]"
* attester ^mapping[1].identity = "cda"
* attester ^mapping[1].map = ".authenticator/.legalAuthenticator"
* attester.mode 1..1
* attester.mode only code
* attester.mode ^short = "personal | professional | legal | official"
* attester.mode ^definition = "The type of attestation the authenticator offers."
* attester.mode ^comment = "Use more than one code where a single attester has more than one mode (professional and legal are often paired)."
* attester.mode ^requirements = "Indicates the level of authority of the attestation."
* attester.mode ^mustSupport = false
* attester.mode ^mapping[0].identity = "rim"
* attester.mode ^mapping[0].map = "unique(./modeCode)"
* attester.mode ^mapping[1].identity = "cda"
* attester.mode ^mapping[1].map = "implied by .authenticator/.legalAuthenticator"
* attester.time 0..1
* attester.time only dateTime
* attester.time ^short = "When the composition was attested"
* attester.time ^definition = "When the composition was attested by the party."
* attester.time ^requirements = "Identifies when the information in the composition was deemed accurate.  (Things may have changed since then.)."
* attester.time ^mustSupport = false
* attester.time ^mapping[0].identity = "rim"
* attester.time ^mapping[0].map = "./time[type=\"TS\" and isNormalDatatype()]"
* attester.time ^mapping[1].identity = "cda"
* attester.time ^mapping[1].map = ".authenticator.time"
* attester.party 0..1
* attester.party only Reference(http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization)
* attester.party ^short = "Who attested the composition"
* attester.party ^definition = "Who attested the composition in the specified way."
* attester.party ^requirements = "Identifies who has taken on the responsibility for accuracy of the composition content."
* attester.party ^mustSupport = false
* attester.party ^mapping[0].identity = "rim"
* attester.party ^mapping[0].map = "./role[classCode=\"ASSIGNED\" and isNormalRole]/player[determinerCode=\"INST\" and classCode=(\"DEV\", \"PSN\") and isNormalEntity()] or ./role[classCode=\"ASSIGNED\" and isNormalRole and not(player)]/scoper[determinerCode=\"INST\" and classCode=\"ORG\" and isNormalEntity()]"
* attester.party ^mapping[1].identity = "cda"
* attester.party ^mapping[1].map = ".authenticator.assignedEnttty"
* custodian 0..0
* custodian only Reference(http://hl7.org/fhir/StructureDefinition/Organization)
* custodian ^short = "Organization which maintains the composition"
* custodian ^definition = "Identifies the organization or group who is responsible for ongoing maintenance of and access to the composition/document information."
* custodian ^comment = "This is useful when documents are derived from a composition - provides guidance for how to get the latest version of the document. This is optional because this is sometimes not known by the authoring system, and can be inferred by context. However, it is important that this information be known when working with a derived document, so providing a custodian is encouraged."
* custodian ^requirements = "Identifies where to go to find the current version, where to report issues, etc."
* custodian ^mustSupport = false
* custodian ^mapping[0].identity = "rim"
* custodian ^mapping[0].map = ".participation[typeCode=\"RCV\"].role[classCode=\"CUST\"].scoper[classCode=\"ORG\" and determinerCode=\"INST\"]"
* custodian ^mapping[1].identity = "cda"
* custodian ^mapping[1].map = ".custodian.assignedCustodian"
* relatesTo 0..0
* relatesTo ^short = "Relationships to other compositions/documents"
* relatesTo ^definition = "Relationships that this composition has with other compositions or documents that already exist."
* relatesTo ^comment = "A document is a version specific composition."
* relatesTo ^mustSupport = false
* relatesTo ^mapping[0].identity = "rim"
* relatesTo ^mapping[0].map = ".outboundRelationship"
* relatesTo ^mapping[1].identity = "cda"
* relatesTo ^mapping[1].map = ".relatedDocument"
* relatesTo.code 1..1
* relatesTo.code only code
* relatesTo.code ^short = "replaces | transforms | signs | appends"
* relatesTo.code ^definition = "The type of relationship that this composition has with anther composition or document."
* relatesTo.code ^comment = "If this document appends another document, then the document cannot be fully understood without also accessing the referenced document."
* relatesTo.code ^mustSupport = false
* relatesTo.code ^mapping[0].identity = "rim"
* relatesTo.code ^mapping[0].map = ".outboundRelationship.typeCode"
* relatesTo.code ^mapping[1].identity = "cda"
* relatesTo.code ^mapping[1].map = ".relatedDocument.typeCode"
* relatesTo.target[x] 1..1
* relatesTo.target[x] only Identifier or Reference(http://hl7.org/fhir/StructureDefinition/Composition)
* relatesTo.target[x] ^short = "Target of the relationship"
* relatesTo.target[x] ^definition = "The target composition/document of this relationship."
* relatesTo.target[x] ^mustSupport = false
* relatesTo.target[x] ^mapping[0].identity = "rim"
* relatesTo.target[x] ^mapping[0].map = ".target[classCode=\"DOC\", moodCode=\"EVN\"].id"
* relatesTo.target[x] ^mapping[1].identity = "cda"
* relatesTo.target[x] ^mapping[1].map = ".relatedDocument.id"
* event 0..0
* event ^short = "The clinical service(s) being documented"
* event ^definition = "The clinical service, such as a colonoscopy or an appendectomy, being documented."
* event ^comment = "The event needs to be consistent with the type element, though can provide further information if desired."
* event ^requirements = "Provides context for the composition and creates a linkage between a resource describing an event and the composition created describing the event."
* event ^mustSupport = false
* event ^mapping[0].identity = "rim"
* event ^mapping[0].map = "outboundRelationship[typeCode=\"SUBJ\"].target[classCode<'ACT']"
* event ^mapping[1].identity = "cda"
* event ^mapping[1].map = ".documentationOf.serviceEvent"
* event.code 0..*
* event.code only CodeableConcept
* event.code ^short = "Code(s) that apply to the event being documented"
* event.code ^definition = "This list of codes represents the main clinical acts, such as a colonoscopy or an appendectomy, being documented. In some cases, the event is inherent in the typeCode, such as a \"History and Physical Report\" in which the procedure being documented is necessarily a \"History and Physical\" act."
* event.code ^comment = "An event can further specialize the act inherent in the typeCode, such as where it is simply \"Procedure Report\" and the procedure was a \"colonoscopy\". If one or more eventCodes are included, they SHALL NOT conflict with the values inherent in the classCode, practiceSettingCode or typeCode, as such a conflict would create an ambiguous situation. This short list of codes is provided to be used as key words for certain types of queries."
* event.code ^mustSupport = false
* event.code ^mapping[0].identity = "rim"
* event.code ^mapping[0].map = ".code"
* event.code ^mapping[1].identity = "cda"
* event.code ^mapping[1].map = ".code"
* event.period 0..1
* event.period only Period
* event.period ^short = "The period covered by the documentation"
* event.period ^definition = "The period of time covered by the documentation. There is no assertion that the documentation is a complete representation for this period, only that it documents events during this time."
* event.period ^mustSupport = false
* event.period ^mapping[0].identity = "rim"
* event.period ^mapping[0].map = ".effectiveTime"
* event.period ^mapping[1].identity = "cda"
* event.period ^mapping[1].map = ".effectiveTime"
* event.detail 0..*
* event.detail only Reference(http://hl7.org/fhir/StructureDefinition/Resource)
* event.detail ^short = "The event(s) being documented"
* event.detail ^definition = "The description and/or reference of the event(s) being documented. For example, this could be used to document such a colonoscopy or an appendectomy."
* event.detail ^mustSupport = false
* event.detail ^mapping[0].identity = "rim"
* event.detail ^mapping[0].map = ".outboundRelationship[typeCode=\"SUBJ\"].target"
* event.detail ^mapping[1].identity = "cda"
* event.detail ^mapping[1].map = "n/a"
* section 1..* MS
* section only BackboneElement
* section ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section ^extension[0].valueString = "Section"
* section ^short = "Composition is broken into sections"
* section ^definition = "The set of resource instances for the same type, e.g., device definition or LOINC codes, of the LIVD Mapping Publication."
* section ^mapping[0].identity = "rim"
* section ^mapping[0].map = "./outboundRelationship[typeCode=\"COMP\" and isNormalActRelationship()]/target[moodCode=\"EVN\" and classCode=\"DOCSECT\" and isNormalAct]"
* section ^mapping[1].identity = "cda"
* section ^mapping[1].map = ".component.structuredBody.component.section"
* section.title 1..1 MS
* section.title only string
* section.title ^short = "Label for section (e.g. for Devices)"
* section.title ^definition = "The label for this particular section, e.g., Devices, LOINC Codes or Concept Maps."
* section.title ^comment = "This will be used to organize CatalogEntries, Devices, Concept Maps, and Coding System resources."
* section.title ^alias[0] = "header"
* section.title ^alias[1] = "label"
* section.title ^alias[2] = "caption"
* section.title ^mapping[0].identity = "rim"
* section.title ^mapping[0].map = "./title"
* section.title ^mapping[1].identity = "cda"
* section.title ^mapping[1].map = ".title"
* section.code 1..1 MS
* section.code only CodeableConcept
* section.code from http://hl7.org/fhir/uv/livd/ValueSet/livd-section-type (required)
* section.code ^short = "devices | concept-map | loinc-codes | ivd-test-codes | entry-definitions"
* section.code ^definition = "A code identifying the kind of content contained within the section. This must be consistent with the section title."
* section.code ^comment = "The code identifies the section for an automated processor of the document. This is particularly relevant when using profiles to control the structure of the document.   If the section has content (instead of sub-sections), the section.code does not change the meaning or interpretation of the resource that is the content of the section in the comments for the section.code."
* section.code ^requirements = "Provides computable standardized labels to topics within the document."
* section.code ^binding.description = "The type of sections used in the LIVD Mapping Publication"
* section.code ^mapping[0].identity = "rim"
* section.code ^mapping[0].map = "./code"
* section.code ^mapping[1].identity = "cda"
* section.code ^mapping[1].map = ".code"
* section.text 0..0
* section.text only Narrative
* section.text ^short = "Text summary of the section, for human interpretation"
* section.text ^definition = "A human-readable narrative that contains the attested content of the section, used to represent the content of the resource to a human. The narrative need not encode all the structured data, but is required to contain sufficient detail to make it \"clinically safe\" for a human to just read the narrative."
* section.text ^comment = "Document profiles may define what content should be represented in the narrative to ensure clinical safety."
* section.text ^mustSupport = false
* section.text ^mapping[0].identity = "rim"
* section.text ^mapping[0].map = ".text"
* section.text ^mapping[1].identity = "cda"
* section.text ^mapping[1].map = ".text"
* section.mode 0..0
* section.mode only code
* section.mode ^short = "working | snapshot | changes"
* section.mode ^definition = "How the entry list was prepared - whether it is a working list that is suitable for being maintained on an ongoing basis, or if it represents a snapshot of a list of items from another source, or whether it is a prepared list where items may be marked as added, modified or deleted."
* section.mode ^comment = "This element is labeled as a modifier because a change list must not be mis-understood as a complete list."
* section.mode ^requirements = "Sections are used in various ways, and it must be known in what way it is safe to use the entries in them."
* section.mode ^mustSupport = false
* section.mode ^mapping[0].identity = "rim"
* section.mode ^mapping[0].map = ".outBoundRelationship[typeCode=COMP].target[classCode=OBS\"].value"
* section.mode ^mapping[1].identity = "cda"
* section.mode ^mapping[1].map = "n/a"
* section.orderedBy 0..0
* section.orderedBy only CodeableConcept
* section.orderedBy ^short = "Order of section entries"
* section.orderedBy ^definition = "Specifies the order applied to the items in the section entries."
* section.orderedBy ^comment = "Applications SHOULD render ordered lists in the order provided, but MAY allow users to re-order based on their own preferences as well. If there is no order specified, the order is unknown, though there may still be some order."
* section.orderedBy ^requirements = "Important for presentation and rendering.  Lists may be sorted to place more important information first or to group related entries."
* section.orderedBy ^mustSupport = false
* section.orderedBy ^mapping[0].identity = "rim"
* section.orderedBy ^mapping[0].map = ".outboundRelationship[typeCode=COMP].sequenceNumber > 1"
* section.orderedBy ^mapping[1].identity = "cda"
* section.orderedBy ^mapping[1].map = "n/a"
* section.entry 1..* MS
* section.entry only Reference(http://hl7.org/fhir/StructureDefinition/Resource)
* section.entry ^short = "A reference to data that supports this section"
* section.entry ^definition = "A reference to the actual resource from which the narrative in the section is derived."
* section.entry ^comment = "If there are no entries in the list, an emptyReason SHOULD be provided."
* section.entry ^mapping[0].identity = "rim"
* section.entry ^mapping[0].map = ".outboundRelationship[typeCode=COMP] or  .participation[typeCode=SBJ]"
* section.entry ^mapping[1].identity = "cda"
* section.entry ^mapping[1].map = ".entry"
* section.entry.reference 1..1 MS
* section.entry.reference only string
* section.entry.identifier 0..0
* section.entry.identifier only Identifier
* section.entry.identifier ^mustSupport = false
* section.entry.display 0..0
* section.entry.display only string
* section.entry.display ^mustSupport = false
* section.emptyReason 0..0
* section.emptyReason only CodeableConcept
* section.emptyReason ^short = "Why the section is empty"
* section.emptyReason ^definition = "If the section is empty, why the list is empty. An empty section typically has some text explaining the empty reason."
* section.emptyReason ^comment = "The various reasons for an empty section make a significant interpretation to its interpretation. Note that this code is for use when the entire section content has been suppressed, and not for when individual items are omitted - implementers may consider using a text note or a flag on an entry in these cases."
* section.emptyReason ^requirements = "Allows capturing things like \"none exist\" or \"not asked\" which can be important for most lists."
* section.emptyReason ^mustSupport = false
* section.emptyReason ^mapping[0].identity = "rim"
* section.emptyReason ^mapping[0].map = ".inboundRelationship[typeCode=SUBJ,code<ListEmptyReason].value[type=CD]"
* section.emptyReason ^mapping[1].identity = "cda"
* section.emptyReason ^mapping[1].map = "n/a"
* section.section 0..0
* section.section ^short = "Nested Section"
* section.section ^definition = "A nested sub-section within this section."
* section.section ^comment = "Nested sections are primarily used to help human readers navigate to particular portions of the document."
* section.section ^contentReference = "#Composition.section"
* section.section ^mustSupport = false
* section.section ^mapping[0].identity = "rim"
* section.section ^mapping[0].map = "./outboundRelationship[typeCode=\"COMP\" and isNormalActRelationship()]/target[moodCode=\"EVN\" and classCode=\"DOCSECT\" and isNormalAct]"
* section.section ^mapping[1].identity = "cda"
* section.section ^mapping[1].map = ".component.section"
