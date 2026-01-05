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

![LIVD Profile Structure](LIVD_Profile_Structure - Version 1.jpg)

* LIVD Bundle - Packages all relevant resources of the LIVD Catalog.
* LIVD Catalog Profile - This provides the information about the LIVD Publication.  The profile is based on the Catalog profile that is based on the Composition resource.   Note that, while the LIVD Catalog Profile does some organization of the resources, there is no need for representing the format of the data.  The formatting and presentation is left to the client consuming these resources.
* LIVD Device Definition Profile - This profile reflects the equipment (device) that is represented in the publication.  
   * (A) Each LIVD publication must include at least one device, and can cover many.
* LIVD Device Observation Definition - This profile reflects the IVD Test Performed that each device can produce.
   * (B) Each LIVD Device Definition has the capability to perform at least one observation, i.e., IVD Test Performed.
* LIVD Test Concept Map Profile - This profile supports the data necessary to document the actual mapping between the IVD Test for a device and the LOINC codes to consider.
   * (C) A LIVD Test Code Concept Map must be associated with at least one LIVD Device Definition.  It may represent multiple LIVD Device Definitions where, e.g., different models performing the same tests could share the same map.
   * The ConceptMap.source reflects the IVD Test Performed and must exist (D) as a LIVD Device Observation Definition.
   * The ConceptMap.target and ConceptMap.group reflects the LOINC code or codes that the IVD Test Performed's code maps to, including context information to aid in the mapping such as result, specimen or other considerations.
   * The ConceptMap.traget references through (E) the value set where the LOINC codes used in the LIVD catalog are further defined.
   * An IVD Test Performed may not have a mapping (e.g., no LOINC code available yet), one, or more.

The LIVD Bundle Profile will enable packaging of the resources.

<h3> Detailed Mapping </h3>

The following table provides the mapping of LIVD data of interest to FHIR resource attributes.  Note that the use of FHIR introduces additional attributes that either are needed as required elements in FHIR or provide additional capabilities.  In those cases the LIVD Attribute cell is empty and only the FHIR cell is valued.

<table>
<tr>
    <th style='border: 1px solid #000'><b>LIVD Attribute</b></th>
    <th style='border: 1px solid #000'><b>FHIR</b></th>
    <th style='border: 1px solid #000'><b>Comments</b></th>
</tr>
<tr>
  <td style='border: 1px solid #000'></td>
  <td style='border: 1px solid #000'>Bundle.type</td>
  <td style='border: 1px solid #000'>This is set to "collection" as LIVD is modeled in FHIR to serve as a payload while it is not needed to be in the form of a document either, thus a well structured collection.</td>
</tr>
<tr>
  <td colspan="3" style='border: 1px solid #000'>
    <b><i>Publication</i></b>
  </td>
</tr> 
<tr>
    <td style='border: 1px solid #000'>Publisher - the entity publishing the mapping information</td>
    <td style='border: 1px solid #000'>Composition.author(Organization.name)</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Publisher URL - URL to the publisher website</td>
    <td style='border: 1px solid #000'>Composition.author(Organization)
      <br>Organization.telecom.value
      <br>Organization.telecom.system="url"</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Publication Version ID - human-readable information provided by the vendor that can be used to differentiate LIVD Publication versions</td>
    <td style='border: 1px solid #000'>Composition.identifier.system
    <br>Composition.identifier.value
    <br>Composition.assigner.display</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>Composition.type.coding.code
      <br>Composition.type.coding.display
      <br>Composition.type.coding.version
      <br>Composition.type.coding.system</td>
    <td style='border: 1px solid #000'>This represents only the LOINC Code representing this publication is a LIVD Catalog.  It does not reflect the version of the LOINC code used in the detailed mapping.</td>
</tr>
<tr>
  <td style='border: 1px solid #000'> LOINC Version ID - the version of LOINC that was used for the mapping</td>
  <td style='border: 1px solid #000'> ValueSet.expansion.contains.system.version</td>
  <td style='border: 1px solid #000'>Since a LIVD Catalog can include LOINC codes from different versions</td>
</tr>
<tr>
    <td style='border: 1px solid #000'>LOINC Copyright - holds the required attribution statement</td>
    <td style='border: 1px solid #000'>Composition.section.title
      <br>Composition.section.code
      <br>Composition.section.entry.reference</td>
    <td style='border: 1px solid #000'>The relevant copyright text is in .section.entry.reference where the .section.title is "Copyrights" and the section.code is "copy-right".</td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Localization - the language used for this LIVD Publication</td>
    <td style='border: 1px solid #000'>extension-Composition.language</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Region - an optional vendor description for which geographic or administrative region this localization is valid.</td>
    <td style='border: 1px solid #000'>extension-Composition.region</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'></td>
    <td style='border: 1px solid #000'>Composition.extension-version</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>Composition.status</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>Composition.title</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>extension-Composition.note</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>Composition.section</td>
    <td style='border: 1px solid #000'>This enables organization like information together, particularly the equipment, tests, and mappings.
</tr>
<tr>
    <td  colspan="3" style='border: 1px solid #000'><b><i>Equipment</i></b></td>
</tr>
<tr>
   <td style='border: 1px solid #000'></td>
   <td style='border: 1px solid #000'>DeviceDefinition.identifier</td>
   <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Manufacturer - the name of the manufacturer of the device.</td>
    <td style='border: 1px solid #000'>DeviceDefinition.manufacturerString</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Model - the model of the device as provided by the manufacturer</td>
    <td style='border: 1px solid #000'>DeviceDefinition.modelNumber</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Testkit UID - the unique device identifier, that may be the one used in the Unique Device Identifier (UDI) constructs</td>
    <td style='border: 1px solid #000'>DeviceDefinition.udiDeviceIdentifier.deviceIdentifier</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Testkit UID Type - capable of supporting the unique device identification system to identify medical devices through their distribution and use.</td>
    <td style='border: 1px solid #000'>DeviceDefinition.udiDeviceIdentifier.issuer</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'></td>
    <td style='border: 1px solid #000'>DeviceDefinition.udiDeviceIdentifier.jurisdiction</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>DeviceDefinition.capability.type
      <br>extension-DeviceDefinition.capability.observationDefinition</td>
    <td style='border: 1px solid #000'>This enables a linkage to the ObservationDefinition that represents the test that the device can perform.</td>
</tr>
<tr>
  <td style='border: 1px solid #000'></td>
  <td style='border: 1px solid #000'>extension-DeviceDefinition.classification</td>
  <td style='border: 1px solid #000'> </td>
</tr>
<tr>
  <td style='border: 1px solid #000'></td>
  <td style='border: 1px solid #000'>extension-DeviceDefinition.hasPart</td>
  <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td colspan="3" style='border: 1px solid #000'><b><i>IVD Test Performed</i>,</b></td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Vendor Analyte Code - Vendor Transmission Code for automated tests or Vendor Analyte Identifier for manual tests.</td>
    <td style='border: 1px solid #000'>ObservationDefinition.coding.code.system
    <br>ObservationDefinition.coding.code.code
    </td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Vendor Analyte Name - human-readable text the vendor used to identify the analyte</td>
    <td style='border: 1px solid #000'>ObservationDefinition.coding.code.display</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Vendor Reference ID - an additional vendor identifier, such as an identifier that can be used to locate the associated assay insert published by the vendor.</td>
    <td style='border: 1px solid #000'>ObservationDefinition.identifier.type
    <br>ObservationDefinition.identifiervalue</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>extension-ObservationDefinition.device</td>
    <td style='border: 1px solid #000'>This enables a link to the device(s) that can perform this test</td>
</tr>
<tr>
    <td colspan="3" style='border: 1px solid #000'><b><i>IVD Analyte Code - LOINC Mapping</i></b></td>
</tr>
<tr>
  <td style='border: 1px solid #000'> LOINC Mapping Version</td>
  <td style='border: 1px solid #000'>ConceptMap.group.element.target.version</td>
  <td style='border: 1px solid #000'> </td>
</tr>
<tr>
  <td style='border: 1px solid #000'></td>
  <td style='border: 1px solid #000'>ConceptMap.identifier</td>
  <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Vendor Specimen Description - human-readable text that provides information about the specimen used for the test, such as “Serum or Plasma.”</td>
    <td style='border: 1px solid #000'>ConceptMap.group.element.target.dependsOn:specimen.property
    <br>ConceptMap.group.element.target.dependsOn:specimen.value
    </td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Vendor Result Description - human-readable text that provides information about the result that is produce
    <br>Binary
    <br>Ordinal
    <br>Nominal
    </td>
    <td style='border: 1px solid #000'>ConceptMap.group.element.target.dependsOn:result.property
    <br>ConceptMap.group.element.target.dependsOn:result.value
    </td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Vendor Device Description</dt>
    <td style='border: 1px solid #000'>ConceptMap.group.element.target.dependsOn:device.property
    <br>ConceptMap.group.element.target.dependsOn:device.value
    </td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Vendor Comment - human-readable text clarification, such as “This is a STAT (prioritized) version of the test”.</td>
    <td style='border: 1px solid #000'>ConceptMap.group.element.target.dependsOn:other.property
    <br>ConceptMap.group.element.target.dependsOn:other.value
    </td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>ConceptMap.status</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>ConceptMap.source</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>ConceptMap.target</td>
    <td style='border: 1px solid #000'>This represents the target value set where the suggested LOINC codes are further defined.</td>
</tr>
<tr>
  <td style='border: 1px solid #000'></td>
  <td style='border: 1px solid #000'>ConceptMap.group.target
  <br>ConceptMap.group.targetVerion</td>
  <td style='border: 1px solid #000'>This represents the LOINC code system and the version that was used for the mapping to the LOINC codes referenced.</td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>ConceptMap.group.element.code</td>
    <td style='border: 1px solid #000'>This represents the test code used by the manufacturer for which a mapping to a LOINC is provided.</td>
</tr>
<tr>
    <td style='border: 1px solid #000'> </td>
    <td style='border: 1px solid #000'>ConceptMap.group.element.target.display</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
 <td colspan="3" style='border: 1px solid #000'><b><i>Test Code Value Set</i></b></td>
</tr>
<tr>
    <td style='border: 1px solid #000'></td>
    <td style='border: 1px solid #000'>ValueSet.version</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'></td>
    <td style='border: 1px solid #000'>ValueSet.status</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
 <td colspan="3" style='border: 1px solid #000'><b><i>Test Code Value Set</i></b></td>
</tr>
<tr>
    <td style='border: 1px solid #000'></td>
    <td style='border: 1px solid #000'>ValueSet.version</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'></td>
    <td style='border: 1px solid #000'>ValueSet.status</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>LOINC Code</td>
    <td style='border: 1px solid #000'>ValueSet.expansion.contains.code</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>LOINC Long Name</td>
    <td style='border: 1px solid #000'>ValueSet.expansion.contains.display</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'></td>
    <td style='border: 1px solid #000'>ValueSet.expansion.contains.system</td>
    <td style='border: 1px solid #000'> </td>
</tr>
<tr>
    <td style='border: 1px solid #000'>Component, Property, time Aspect, System, Scale Type, Method Type</td>
    <td style='border: 1px solid #000'>extension-ValueSet.expansion.conctains.extR5-property.code ("COMPONENT", "PROPERTY", "TIME ASPCT", "SYSTEM", "SCALE TYPE", "METHOD")
    <br>extension-ValueSet.expansion.conctains.extR5-property.valueCoding.code
    </td>
    <td style='border: 1px solid #000'> </td>
</tr>
</table>



