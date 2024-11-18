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

![LIVD Profile Structure](LIVD_Profile_Structure - Version 2.jpg)

* LIVD Bundle - Packages all relevant resources of the LIVD Catalog.
* LIVD Catalog Profile - This provides the information about the LIVD Publication.  The profile is based on the Catalog profile based on the Composition resource.   Note that, while the LIVD Catalog Profile does some organization of the resources, there is no need for representing the format of the data.  The formatting and presentation is left to the client consuming these resources.
* LIVD Device Definition Profile - This profile reflects the equipment (device) that is represented in the publication.  
   * (A) Each LIVD publication must include at least one device, and can cover many.
* LIVD Device Observation Definition - This profile reflects the IVD Tests that each device can produce.
  * (B) Each LIVD Device Definition has the capability to perform at least one observation, i.e., IVD Test.
* LIVD Test Concept Map Profile - This profile supports the data necessary to document the actual mapping between the IVD Test for a device and the LOINC codes to consider.
   * (C) A LIVD Test Concept Map must be associated with at least one LIVD Device Definition.  It may represent multiple LIVD Device Definitions where, e.g., different models performing the same tests could share the same map.
   * The ConceptMap.source reflects the IVD Test's code and must exist (D) as a LIVD Device Observation Definition.
   * The ConceptMap.target reflects the LOINC code that the IVD Test's code maps to, as well as context information to aid in the mapping such as result, specimen or other considerations.
      * An IVD Test may not have a mapping (e.g., no LOINC code available yet), one, or more.
* LIVD LOINC Value Set Profile - This profile supports the applicable LOINC codes from the LOINC Code System that is relevant to the mapping process.
      * (E) Each LOINC code in the LIVD Test Concept Map must exist in the LIVD LOINC Value Set.
* LIVD LOINC Code System Profile - This profile supports the relevant LOINC Code System data to assist in the mapping process.  This enables the mapping process to be off-line as needed.
   * (F) Each LOINC Code in the LIVD LOINC Value Set must exist in the LIVD LOINC Code System
* LIVD Coded Result Value Set Sub-Set Profile - This profile supports the non-quantitative, coded values that an IVD Test can yield as the observation value.
   * (G) Each LIVD Device Observation Definition can only reference one Result Value Value Set Sub Set.
   * (H) Each LIVD Coded Result Value Value Set Sub Set may further reference another LIVD Coded Result Value Value Set Sub Set to ease configuration and re-use.
* LIVD Coded Result Value Code System Profile - This profile contains the full set of result values used across devices sharing the same result value definitions.
   * (I) Each LIVD Coded Result Value in the LIVD Coded Result Value Value Set Sub Set must exist in the LIVD Coded Result Value Code System
* LIVD Coded Result Value Value Set Super-Set Profile - This profile is used to eas the mapping definitions by aggregating the all LIVD Coded Result Values to be mapped.
   * (J) Each LIVD Coded Result Value in the LIVD Coded Result Value Value Set Super Set must exist in the LIVD Coded Result Value Code System
* LIVD Coded Result Value Concept Map Profile - This profile contains the mappings from the IVD Test Coded Result Values to the respective SNOMED and/or LOINC codes
   * The ConceptMap.source reflects the IVD Coded Result Value and must exist in the LIVD Coded Result Value Value Set Super Set (K) in the context of the LIVD Coded Result Value Value Set Subset (L) for the LIVD Device Observation Definition at hand.
   * The ConceptMap.target reflects the SNOMED and/or LOINC Answer codes that the IVD Test's code maps to.  Although an IVD Coded Result Value can have both a SNOMED and a LOINC Answer code representation, it can only be mapped to one or the other based on for the actual coded result value for the test performed.
* LIVD LOINC Answer Value Set Profile - This profile supports the applicable LOINC codes from the LOINC Code System that is relevant to the mapping process.
   * (M) Each LOINC code in the LIVD Coded Result Value Concept Map must exist in the LIVD LOINC Answer Value Set or the LIVD SNOMED Value Set.
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
  <td></td>
  <td>Bundle.type</td>
  <td>This is set to "collection" as LIVD is modeled in FHIR to serve as a payload while it is not needed to be in the form of a document either, thus a well structured collection.</td>
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
    <br>Composition.identifier.value
    <br>Composition.assigner.display</td>
</tr>
<tr>
    <td>Catalog LOINC Code</td>
    <td>Composition.type.coding.code
      <br>Composition.type.coding.display
      <br>Composition.type.coding.version
      <br>Composition.type.coding.system</td>
    <td>This represents only the code and version of LOINC from which the LOINC code for the LIVD Catalog has been obtained.  It does not reflect the version of the LOINC code used in the detailed mapping.</td>
</tr>
<tr>
  <td> LOINC Mapping Version</td>
  <td> ValueSet.expansion.contains.system.version</td>
  <td>This represents the version of LOINC used in the mapping for the code mapped in the ConceptMap.</td>
</tr>
<tr>
    <td>LOINC Copyright</td>
    <td>Composition.section.title
      <br>Composition.section.code
      <br>Composition.section.entry.reference</td>
    <td>The relevant copyright text is in .section.entry.reference where the .section.title is "Copyrights" and the section.code is "copy-right".</td>
</tr>
<tr>
    <td>Localization</td>
    <td>extension-Composition.language</td>
</tr>
<tr>
    <td>Region</td>
    <td>extension-Composition.region</td>
</tr>
<tr>
    <td></td>
    <td>Composition.extension-version</td>
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
    <td>extension-Composition.note</td>
</tr>
<tr>
    <td> </td>
    <td>Composition.section</td>
    <td>This enables organization like information together, particularly the equipment, tests, and mappings.
</tr>
<tr>
    <td><b><i>Equipment</i></b></td>
</tr>
<tr>
   <td></td>
   <td>DeviceDefinition.identifier</td>
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
    <td>DeviceDefinition.udiDeviceIdentifier.deviceIdentifier</td>
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
    <td>DeviceDefinition.capability.type
      <br>extension-DeviceDefinition.capability.observationDefinition</td>
    <td>This enables a linkage to the ObservationDefinition that represents the test that the device can perform.</td>
</tr>
<tr>
  <td></td>
  <td>extension-DeviceDefinition.classification</td>
</tr>
<tr>
  <td></td>
  <td>extension-DeviceDefinition.hasPart</td>
</tr>
<tr>
    <td><b><i>IVD Tests</i>,</b></td>
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
    <td>ObservationDefinition.identifier.type
    <br>ObservationDefinition.identifiervalue</td>
</tr>
<tr>
    <td> </td>
    <td>extension-ObservationDefinition.device</td>
    <td>This enables a link to the device(s) that can perform this test</td>
</tr>
<tr>
    <td><b><i>IVD Analyte Code - LOINC Mapping</i></b></td>
</tr>
<tr>
  <td> LOINC Mapping Version</td>
  <td>ConceptMap.group.element.target.version</td>
</tr>
<tr>
  <td></td>
  <td>ConceptMap.identifier</td>
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
    <td>ConceptMap.target</td>
    <td>This represents the target value set where the suggested LOINC codes are further defined.</td>
</tr>
<tr>
  <td></td>
  <td>ConceptMap.group.target
  <br>ConceptMap.group.targetVerion</td>
  <td>This represents the LOINC code system and the version that was used for the mapping to the LOINC codes referenced.</td>
</tr>
<tr>
    <td> </td>
    <td>ConceptMap.group.element.code</td>
    <td>This represents the test code used by the manufacturer for which a mapping to a LOINC is provided.</td>
</tr>
<tr>
    <td> </td>
    <td>ConceptMap.group.element.target.display</td>
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
 <td><b><i>Test Code Value Set</i></b></td>
</tr>
<tr>
    <td></td>
    <td>ValueSet.version</td>
</tr>
<tr>
    <td></td>
    <td>ValueSet.status</td>
</tr>
<tr>
    <td>LOINC Code</td>
    <td>ValueSet.expansion.contains.code</td>
</tr>
<tr>
    <td>LOINC Long Name</td>
    <td>ValueSet.expansion.contains.display</td>
</tr>
<tr>
    <td></td>
    <td>ValueSet.expansion.contains.system</td>
</tr>
<tr>
    <td>Component, Property, time Aspect, System, Scale Type, Method Type</td>
    <td>extension-ValueSet.expansion.conctains.property.code
    <br>extension-ValueSet.expansion.conctains.property.valueCoding.code
    </td>
</tr>
</table>











