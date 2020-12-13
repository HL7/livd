This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard and therefore uses terminology, notations and design principles that are specific to FHIR.  Before continuing to read this implementation guide, it's important to be familiar with some of the basic principles of FHIR as well as general guidance on how to read FHIR specifications.  Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html)
* (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

<h3> Overview </h3>

The concepts described above are mapped to a number of FHIR resources that have been profiled to support the scope of the LIVD Publication.  The diagram below shows the HL7 FHIR resources/profiles and their relationship:

![LIVD Profile Structure](LIVD_Profile_Structure.jpg)

* LIVD Bundle - Packages all relevant resources of the LIVD Catalog.
* LIVD Catalog Profile - This provides the information about the LIVD Publication.  The profile is based on the Catalog profile based on the Composition resource.   Note that, while the LIVD Catalog Profile does some organization of the resources, there is no need for representing the format of the data.  The formatting and presentation is left to the client consuming these resources.
* LIVD Device Definition Profile - This profile reflects the equipment (device) that is represented in the publication.  
   * (A) Each LIVD publication must include at least one device, and can cover many.
* LIVD Device Observation Definition - This profile reflects the IVD test codes that each device can produce.
  * (B) Each LIVD Device Definition has the capability to perform at least one observation, i.e., IVD test.
* LIVD Test Code Concept Map Profile - This profile supports the data necessary to document the actual mapping between the IVD test code for a device and the LOINC codes to consider.
   * (C) A LIVD Test Code Concept Map must be associated with at least one LIVD Device Definition.  It may represent multiple LIVD Device Definitions where, e.g., different models performing the same tests could share the same map.
   * The ConceptMap.source reflects the IVD Test Code and must exist (D) as a LIVD Device Observation Definition.
   * The ConceptMap.target reflects the LOINC code that the IVD Test Code maps to, as well as context information to aid in the mapping such as result, specimen or other considerations.
      * An IVD Test Code may not have a mapping (e.g., no LOINC code available yet), one, or more.
* LIVD LOINC Value Set Profile - This profile supports the applicable LOINC codes from the LOINC Code System that is relevant to the mapping process.
      * (E) Each LOINC code in the LIVD Test Code Concept Map must exist in the LIVD LOINC Value Set.
* LIVD LOINC Code System Profile - This profile supports the relevant LOINC Code System data to assist in the mapping process.  This enables the mapping process to be off-line as needed.
   * (F) Each LOINC Code in the LIVD LOINC Value Set must exist in the LIVD LOINC Code System
* LIVD Result Value Set Sub-Set Profile - This profile supports the non-quantitative, coded values that an IVD Test can yield as the observation value.
   * (G) Each LIVD Device Observation Definition can only reference one Result Value Value Set Sub Set.
   * (H) Each LIVD Result Value Value Set Sub Set may further reference another LIVD Result Value Value Set Sub Set to ease configuration and re-use.
* LIVD Result Value Code System Profile - This profile contains the full set of result values used across devices sharing the same result value definitions.
   * (I) Each LIVD Result Value in the LIVD Result Value Value Set Sub Set must exist in the LIVD Result Value Code System
* LIVD Result Value Value Set Super-Set Profile - This profile is used to eas the mapping definitions by aggregating the all LIVD Result Values to be mapped.
   * (J) Each LIVD Result Value in the LIVD Result Value Value Set Super Set must exist in the LIVD Result Value Code System
* LIVD Result Value Concept Map Profile - This profile contains the mappings from the IVD Test Result Values to the respective SNOMED and/or LOINC codes
   * The ConceptMap.source reflects the IVD Test Result Value and must exist int eh LIVD Result Value Value Set Super Set (K) in the context of the LIVD Result Value Value Set Subset (L) for the LIVD Device Observation Definition at hand.
   * The ConceptMap.target reflects the SNOMED and/or LOINC codes that the IVD Test Code maps to.  Although an IVD Test Result Value can have both a SNOMED and a LOINC code representation, it can only have one of each.
* LIVD LOINC Answer Value Set Profile - This profile supports the applicable LOINC codes from the LOINC Code System that is relevant to the mapping process.
   * (M) Each LOINC code in the LIVD Result Value Concept Map must exist in the LIVD LOINC Answer Value Set or the LIVD SNOMED Value Set.
   * (N) Each LIVD LOINC Answer code must exist in the LIVD LOINC Code System.
* LIVD SNOMED Code System Profile - This profile supports the relevant SNOMED Code System data to assist in the mapping process.  This enables the mapping process to be off-line as needed.
   * (O) Each LIVD SNOMED code must exist in the LIVD SNOMED Code Sysetm.

 

The LIVD Bundle Profile will enable packaging of the resources.

<h3> Detailed Mapping </h3>

The following table provides the mapping of LIVD data of interest to FHIR resource attributes.  Note that the use of FHIR introduces additional attributes that either are needed as required elements in FHIR or provide additional capabilities.
<table>
<tr>
    <th><b>LIVD Attribute</b></th>
    <th><b>FHIR</b></th>
    <th><b>Comments</b></th>
</tr>
<tr>
    <td><b><i>Publication</i></b></td>
</tr>
<tr>
    <td>Publisher</td>
    <td>Composition.author.display</td>
</tr>
<tr>
    <td>Publication Version ID</td>
    <td>Composition.identifier.system
    <br>Composition.identifier.value</td>
</tr>
<tr>
    <td>LOINC Version ID</td>
    <td>CodeSystem.version</td>
    <td>This represents only the version of LOINC from which the LOINC code for the LIVD Catalog has been obtained.  It does not reflect the version of the LOINC code used in the detailed mapping.
</tr>
<tr>
    <td>LOINC Copyright</td>
    <td>CodeSystem.copyright</td>
</tr>
<tr>
    <td> </td>
    <td>CodeSystem.publisher</td>
</tr>
<tr>
    <td> </td>
    <td>CodeSystem.status</td>
</tr>
<tr>
    <td> </td>
    <td>CodeSystem.title</td>
</tr>
<tr>
    <td> </td>
    <td>CodeSystem.name</td>
</tr>
<tr>
    <td>Localization</td>
    <td>Composition.language</td>
</tr>
<tr>
    <td>Region</td>
    <td>Composition.ext-region</td>
</tr>
<tr>
    <td> </td>
    <td>Composition.type</td>
</tr>
<tr>
    <td> </td>
    <td>Composition.status</td>
</tr>
<tr>
    <td> </td>
    <td>Composition.date</td>
</tr>
<tr>
    <td> </td>
    <td>Composition.title</td>
</tr>
<tr>
    <td> </td>
    <td>Composition.section</td>
</tr>
<tr>
    <td><b><i>Equipment</i></b></td>
</tr>
<tr>
    <td>Manufacturer</td>
    <td>DeviceDefinition.manufacturerString</td>
</tr>
<tr>
    <td>Model</td>
    <td>DeviceDefinition.modelNumber</td>
</tr>
<tr>
    <td>UID</td>
    <td>DeviceDefinition.uidDeviceIdentifier.deviceIdentifier</td>
</tr>
<tr>
    <td>UID Type</td>
    <td>DeviceDefinition.udiDeviceIdentifier.issuer</td>
</tr>
<tr>
    <td></td>
    <td>DeviceDefinition.udiDeviceIdentifier.jurisdiction</td>
</tr>
<tr>
    <td> </td>
    <td>DeviceDefintiion.capability.ext-observationDefinition</td>
</tr>
<tr>
    <td><b><i>IVD Test Results</i>,</b></td>
</tr>
<tr>
    <td>Vendor Analyte Code
    <br>Vendor Transmission Code
    <br>Vendor Analyte Identifier
    </td>
    <td>ObservationDefinition.code.system
    <br>ObservationDefinition.code.code
    </td>
</tr>
<tr>
    <td>Vendor Analyte Name</td>
    <td>ObservationDefinition.code.display</td>
</tr>
<tr>
    <td>Vendor Reference ID</td>
    <td>ObservationDefinition.ext-vendorReferenceIdentifier</td>
</tr>
<tr>
    <td> </td>
    <td>ObservationDefinition.code.version</td>
</tr>
<tr>
    <td> </td>
    <td>ObservationDefinition.permittedDataType</td>
</tr>
<tr>
    <td> </td>
    <td>ObservationDefinition.method</td>
</tr>
<tr>
    <td> </td>
    <td>ObservationDefinition.quantitativeDetails</td>
</tr>
<tr>
    <td> </td>
    <td>ObservationDefinition.validCodedValueSet</td>
</tr>
<tr>
    <td> </td>
    <td>ObservationDefinition.ext-device</td>
</tr>
<tr>
    <td><b><i>IVD Analyte Code - LOINC Mapping</i></b></td>
</tr>
<tr>
  <td> LOINC Mapping Version</td>
  <td>ConceptMap.group.element.target.version</td>
</tr>
<tr>
    <td>Vendor Specimen Description</td>
    <td>ConceptMap.group.element.target.dependsOn.property
    <br>ConceptMap.group.element.target.dependsOn.value
    </td>
</tr>
<tr>
    <td>Vendor Result Description
    <br>Binary
    <br>Ordinal
    <br>Nominal
    </td>
    <td>ConceptMap.group.element.target.dependsOn.property
    <br>ConceptMap.group.element.target.dependsOn.value
    </td>
</tr>
<tr>
    <td>Vendor Device Description</dt>
    <td>ConceptMap.group.element.target.dependsOn.property
    <br>ConceptMap.group.element.target.dependsOn.value
    </td>
</tr>
<tr>
    <td>Vendor Comment</td>
    <td>ConceptMap.group.element.target.comment</td>
</tr>
<tr>
    <td> </td>
    <td>ConceptMap.status</td>
</tr>
<tr>
    <td> </td>
    <td>ConceptMap.source</td>
</tr>
<tr>
    <td> </td>
    <td>ConceptMap.group.element.code</td>
</tr>
<tr>
    <td> </td>
    <td>ConceptMap.group.element.display</td>
</tr>
<tr>
 <td><b><i>Test Result Values</i></b></td>
 </tr>
<tr>
 <td>Vendor Test Result Value Code</td>	
 <td>to be provided</td>
</tr>
<tr>
 <td>Vendor Test Result Value Code Name</td>
 <td>to be provided</td>
</tr>
<tr>
 <td>Vendor Test Result Value Coding System</td>	
 <td>to be provided</td>
</tr>
<tr>
    <td><b><i>LOINC Code System</i></b></td>
</tr>
<tr>
    <td>LOINC Code</td>
    <td>CodeSystem.concept.code</td>
</tr>
<tr>
    <td>LOINC Long Name</td>
    <td>CodeSystem.concept.display</td>
</tr>
<tr>
    <td>Component</td>
    <td>CodeSystem.concept.property.code
    <br>CodeSystem.concept.property.valueCoding.code
    </td>
</tr>
<tr>
    <td>Property</td>
    <td>CodeSystem.concept.property.code
    <br>CodeSystem.concept.property.valueCoding.code
    </td>
</tr>
<tr>
    <td>Time</td>
    <td>CodeSystem.concept.property.code
    <br>CodeSystem.concept.property.valueCoding.code
    </td>
</tr>
<tr>
    <td>System</td>
    <td>CodeSystem.concept.property.code
    <br>CodeSystem.concept.property.valueCoding.code
    </td>
</tr>
<tr>
    <td>Scale</td>
    <td>CodeSystem.concept.property.code
    <br>CodeSystem.concept.property.valueCoding.code
    </td>
</tr>
<tr>
    <td>Method</td>
    <td>CodeSystem.concept.property.code
    <br>CodeSystem.concept.property.valueCoding.code
    </td>
</tr>
<tr>
    <td> </td>
    <td>CodeSystem.property</td>
</tr>
<tr>
    <td> </td>
    <td>CodeSystem.content</td>
</tr>
</table>
