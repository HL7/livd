### LOINC Mapping Summary

When communicating results from a device to the Laboratory Information System (LIS), two concepts must be mapped: the device's Vendor Analyte Code to the LIS Test Result code.  Neither In-Vitro Diagnostic (IVD) Test codes or LIS Test Result codes are based on industry standard vocabulary.  The manufacturer assigns Vendor Analyte Code to their devices, while the Laboratory creates test result codes for the tests they provide.  Through LIS configuration tools, the test result code is associated with one or more LIS test result codes based on context, e.g., IVD Test Code used with one vs. another specimen would yield a different LIS test result code.  This process has been in place for decades and has been optimized to support the Laboratory's specific reporting requirements (including conformance to Clinical Laboratory Improvement Amendments (CLIA) for the US).

To enable analytics and clinical decision support, harmonization to a common vocabulary is critical.  For Lab test results, Logical Observation Identifiers Names and Codes (LOINC(R)) is the coding system of choice, thus introducing the question on how to map the LIS Test Result Code to LOINC and do so consistently across all labs to enable analytics and clinical decision support reliably.

For now, and particularly until an LIS communicates ordered tests with the device using LOINC, the device cannot provide the appropriate LOINC code with the test result.  The LIS must provide the mapping as they associate the Vendor Analyte Code with the LIS Test Result Code.   To date this mapping process has relied on a combination of the LOINC registry, RELMA, and the individual's knowledge of LOINC plus the LIS' test compendium.

The device manufacturer can aid in the process by providing a list of suggested LOINC codes for each of their IVD Test Codes, including context of the result, specimen, and other considerations that would influence the choice.  Such guidance would help reduce the scope of potential LOINC codes to consider, thus improving efficiency and quality of the mapping process, particularly across laboratories, i.e., arriving at the same LOINC code for the same test.

The following diagram may help further clarify that:

![LIVD FHIR Mapping](LIVD_FHIR_Mapping.jpg)

<ul>
    <li> The LIS maintains a map between the IVD Test Code and their LIS Test Result Code.  
        <ul>
            <li> One IVD Test Code can yield different LIS Test Result Codes depending on specimen and other parameters.</li>
        </ul>
    </li>
    <li> Each of the LIS Test Result Codes must have a LOINC code associated with it so the results report includes the appropriate LOINC code as well for downstream use.</li>
    <li> Laboratory staff today rely on LOINC definitions (using RELMA or the web based tool), their local mappings, and their expertise/knowledge about the device, test, and parameters, to associate a specific LOINC code to the LIS Test Result Code. </li>
    <li> Adding the LIVD suggested mappings, where available, enhances the Laboratory's staff to arrive more quickly and correctly at the right LOINC code.</li>
</ul>

When the lab professional builds the test results that their LIS will manage and interact with the devices, they can use the device vendor's suggestions to more accurately, consistently, and efficiently map the results in their LIS to a LOINC code in context of the device's IVD Test Code.  The following example clarifies the information a lab professional would use during their configuration.

Example:

<ul> 
    <li> Vendor Analyte Code = 1067 (Gluc) is mapped in the LIS to:
        <ul>
            <li> LIS Test Result Code = 123 - Random Glucose</li>
            <li> LIS Test Result Code = 456 - Fasting Glucose</li>
            <li> LIS Test Result Code = 789 - 1 Hour Glucose</li>
        </ul>
    </li>
    <li> LIVD Mapping Vendor Analyte Code = 1067 (Gluc) suggests:
        <ul>
            <li> Based on vendor comment [comment], vendor result description [result] A, vendor specimen description [specimen] "cerebrospinal", LOINC axes => 2342-4</li>
            <li> Based on  vendor comment [comment], vendor result description [result] B, vendor specimen description "urine", LOINC axes => 63382-6</li>
            <li> Based on  vendor comment [comment], vendor result description [result] C, vendor specimen description "serum/plasma", LOINC axes => 20438-8</li>
        </ul>
    </li>
    <li> Consequently, most appropriate mapping:
        <ul>
            <li> LIS Test Result Code = 123 - Random Glucose
                <ul>
                    <li> LOINC Code = 2342-4</li>
                </ul>
            </li>
            <li> LIS Test Result Code = 456 - Fasting Glucose
                <ul>
                    <li> LOINC Code = 63382-6</li>
                </ul>
            </li>
            <li> LIS Test Result Code = 789 - 1 Hour Glucose
                <ul>
                    <li> LOINC Code = 20438-8</li>
                </ul>
            </li>
        </ul>
    </li>
</ul>

### LIVD Concepts

The basic structure that the LIVD Publication must support is based on the **_[Digital Format for Publication of LOINC to Vendor IVD Test Results](http://ivdconnectivity.org/wp-content/uploads/delightful-downloads/2017/06/IICC_LIVD_Digital_Format_2017_06_01_R2.pdf)_** as published by [IICC](https://ivdconnectivity.org/) - IVD Industry Connectivity Consortium. It can be represented as follows:

![LIVD Publication Structure](Publication_Structure.jpg)

The implementation guide supports the following mappings:

<ul>
     <li> A publication is typically for one vendor's devices, but it is possible to combine information from multiple vendors into an aggregate publication.
     </li>
     <li> One vendor <b><i>IVD Test Result</i></b> to many <b><i>LOINC</i></b>s
         <ul>
             <li> This is a very common occurrence. Depending on the context of the result, specimen, or other qualification, the same IVD Test Result can be mapped to different suggested LOINC codes as also shown in the example above.  Antoher example may be that an IVD test for serum glucose could map to one LOINC code considering a mass concentration (e.g. mg/dL) or another LOINC considering a substance concentration (e.g. mol/L). Or, a urine albumin could map to one LOINC code for a 24 hour excretion rate with units of mg/(24.h), versus another LOINC code for a random urine with unit of md/dL.</li>
         </ul>
     </li>
     <li> One <b><i>LOINC</i></b> to many vendor <b><i>IVD Test Results</i></b>
         <ul>
             <li> This is a much less common occurrence.
                  <ul>
                     <li> For example, an IVD instrument may distinguish stat tests from routine tests by the IVD test code. In this case, the LOINC [13969-1] Creatine kinase.MB [Mass/volume] in Serum or Plasma is associated with two <b><i>IVD Test Results</i></b>, depending if the test is routine or stat (prioritized).</li>
                     <li> Or, consider a susceptibility test that has different IVD Test IDs based on the original specimen source. In this case, the LOINC [6932-8] Penicillin [Susceptibility] by Minimum inhibitory concentration (MIC), which is named for testing on the isolate, could be associated with multiple <b><i>IVD Test Results</i></b> for one IVD Instrument depending on the clinical context. For example, the break points are different for suspected meningitis versus blood infections and to date LOINC has only distinguished test codes by suspected source of infection for some antibiotic susceptibility codes.</li>
                 </ul>
             </li>
        </ul>
     </li>
     <li> The IVD Test Code Map enable these many to many mappings, also considering that there may not be a suggested LOINC code for a particular IVD Test Result, or clearly that not every LOINC code is related to an IVD Test Result.</li>
</ul>

### LIVD Data Definitions
#### LIVD Publication
This information establishes the version for the publication as expressed through the LIVD Catalog profile, including:

* **_Publisher_** is the entity publishing the mapping information.
* **_Publication Version ID_** is human-readable information provided by the vendor that can be used to differentiate LIVD Publication versions.
* **_LOINC Version ID_** is the version of LOINC that was used for the mapping.
* The **_[LOINC License](https://loinc.org/license/)_** requires a statement of attribution and notice that LOINC content is copyrighted. 
* **_LOINCCopyright_** component holds the required attribution statement.
* **_Localization_** is the language used for this LIVD Publication.
* **_Region_** is an optional vendor description for which geographic or administrative region this localization is valid, e.g.  de-CH (German (Switzerland)) is self-explanatory, but not en-CH (English (Switzerland)).

#### Equipment
The equipment elements are expressed through the LIVD Device Definition profile, including:

* **_Manufacturer_** is the name of the manufacturer of the device.
* **_Model_** is the model of the device as provided by the manufacturer.
* **_UID_** is the unique device identifier, that may be the one used in the Unique Device Identifier (UDI) constructs.
* **_UID Type_** is capable of supporting the unique device identification system to identify medical devices through their distribution and use. When fully implemented, the label of most devices will include a unique device identifier (UDI) in human- and machine-readable form.

Note that types and cardinality are aligned with values reported in [Laboratory Analytical Workflow (LAW) Profile](https://www.ihe.net/resources/technical_frameworks/#PaLM) OBX-18 Equipment Instance Identifier.

#### IVD Test Results

The IVD Test Result components are aligned with values reported in OBX-3 Observation Identifier as applicable and expressed using the LIVD Observation Definition profile.

<ul>
     <li> <b><i>Vendor Analyte Code</i></b> is one of two possible values:
         <ul>
             <li> For an automated test result, it contains <b><i>Vendor Transmission Code</i></b> used by the instrument when sending the test result to a health information system, such as an LIS.</li>
             <li> For a manual test result, it is the <b><i>Vendor Analyte Identifier</i></b> for the test result produced by the Test Kit.</li>
         </ul>
     </li>
     <li> <b><i>Vendor Analyte Name</i></b> is human-readable text the vendor used to identify the analyte. The text might be displayed by the instrument or could be used within an assay insert.</li>
     <li> <b><i>Vendor Reference ID</i></b> is an additional vendor identifier, such as an identifier that can be used to locate the associated assay insert published by the vendor.</li>
</ul>

Additionally, various details on the Observation Definition that can aid in the mapping from the IVD Test Code to a LOINC are included as optional attributes, even though not referenced in the original [IICC white paper](http://ivdconnectivity.org/wp-content/uploads/delightful-downloads/2017/06/IICC_LIVD_Digital_Format_2017_06_01_R2.pdf).

#### IVD Analyte Code - LOINC Mapping

The potential mappings of the IVD Analyte Code to LOINC code are captured in the LIVD Concept Map profile.  For each IVD Analyte Code and a suggested LOINC code, the following attributes are captured.

<ul>
     <li> <b><i>Vendor Specimen Description</i></b> is human-readable text that provides information about the specimen used for the test, such as “Serum or Plasma.” The field is used to document the vendor description of the specimen used for the IVD test.</li>
     <li> <b><i>Vendor Result Description</i></b> is human-readable text that provides information about the result that is produced.
         <ul>
             <li> For non-numeric results, this field should describe the result by including one of the following:
                 <ul>
                     <li> <b>Binary</b> – pos/neg, reactive/non-reactive.</li>
                     <li> <b>Ordinal</b> – none, few, many.</li>
                     <li> <b>Nominal</b> – the test can report none found or one or more possibilities from a taxonomy of choices, such as organism names.</li>
                 </ul>
             </li>
             <li> Numeric results and associated units of measure:
                 <ul>
                     <li> For numeric results, this field should describe the result by including a representative unit of measure, preferably represented as a UCUM unit.</li>
                     <li> If one unit of measure is reported, then include it in this field.</li>
                     <li> If multiple units can be reported that can be converted to one another by a multiplicative scale factor independent of the analyte (such as mg/L and ug/dL), select one of the units as a representative unit.</li>
                     <li> If multiple units can be reported that cannot be converted by an analyte-independent scale factor (such as mol/L and as mg/L), then define a mapping for each unit. These different types of numeric results require their own LOINC codes – one for the test reported as molar concentration and one for the test reported as mass concentration. Similarly, the results of a urine analyte (e.g. Sodium) reported as either mmol/L (spot urine) versus mmol/(24.h) (24 hour urine) have different LOINC properties and map to two different LOINC codes. The same is true for viral loads which can be reported in units of copies/mL, Log (copies/mL), IU/mL and Log (IU)/mL; and none of which can be converted by a simple scale factor. These result types have different properties and thus different LOINC codes. In such cases, define a mapping for all units that are appropriate for this IVD test.</li>
                     <li> In some cases, the same IVD Test may be reported as a **Binary** result, or a spot numeric result of the mass concentration, etc. In such instances, the same **_IVD Test Result_** will map to multiple LOINCs. The Vendor Result Description should be used to assist the laboratory in manually selecting the appropriate LOINC for their laboratory.</li> 
                 </ul>
             </li>
         </ul>
     </li>
     <li> <b><i>Vendor Comment</i></b> is human-readable text clarification, such as “This is a STAT (prioritized) version of the test”. </li>
</ul>

Note that **_Vendor Specimen Description_**, **_Vendor Result Description_**, and **_Vendor Comment_** are included to assist a laboratory in selecting the appropriate LOINC code(s) for the vendor IVD tests used by the laboratory. This information is not intended to be parsed by an IVD Software System that automates the mapping of vendor IVD transmission codes to LOINC codes. The inclusion of this information should reduce errors in the manual selection of LOINC codes by a laboratory.

#### LOINC Code System
For each of the LOINC codes being considered, a minimum set from the code system is included to further aid in the mapping process.  These are included in the LIVD LOINC Code System profile.

* **_LOINC Code_**
* **_LOINC Long Name_**
* **_Component_**
* **_Property_**
* **_Time_**
* **_System_**
* **_Scale_**
* **_Method_**

### Sample Data
As part of defining the whitepaper, IICC also developed a spreadsheets that contains the relevant data and a potential representation of that data that can be found [here](https://ivdconnectivity.org/livd/).


### LIVD Data Mappings to FHIR

This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard and therefore uses terminology, notations and design principles that are specific to FHIR.  Before continue reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR as well as general guidance on how to read FHIR specifications.  Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html)
* (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

#### Overview

The concepts described above are mapped to a number of FHIR resource that have been profiled to support the scope of the LIVD Publication.  The diagram below shows the HL7 FHIR resources/profiles and their relationship:

![LIVD Profile Structure](LIVD_Profile_Structure.jpg)

* LIVD Catalog Profile - This provides the information about the LIVD Publication.  The profile is based on the Catalog profile based on the Composition resource.   Note that, while the LIVD Catalog Profile does some organization of the resources, there is no need for representing the format of the data.  The formatting and presentation is left to the client consuming these resources.
* LIVD Device Definition Profile - This profile reflects the equipment (device) that is represented in the publication.  Each LIVD publication must include at least one device, and can be many.
* LIVD Device Observation Definition - This profile reflects the IVD test codes that each device can produce.
* LIVD Concept Map Profile - This profile supports the data necessary to document the actual mapping between the IVD test code for a device and the LOINC codes (0, 1, or more) to consider.
* LIVD LOINC Code System Profile - This profile supports the relevant LOINC code data to assist in the mapping process.

The LIVD Bundle Profile will enable packaging of the resources.  

#### Detailed Mapping

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
    <td>ObservationDefinitio.validCodedValueSet</td>
</tr>
<tr>
    <td> </td>
    <td>ObservvationDefinition.ext-device</td>
</tr>
<tr>
    <td><b><i>IVD Analyte Code - LOINC Mapping</i></b></td>
</tr>
<tr>
    <td>Vendor Specimen Description
    <br>ConceptMap.group.element.target.dependsOn.property
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
    <td>ConceptMap.group.element.display	
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