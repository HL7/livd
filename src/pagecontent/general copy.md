### Structure and Supported Mappings

The basic structure that the LIVD Publication must support can be represented as follows, using the HL7® V2 message syntax of brackets ([…]) to identify optional items and braces ({…}) to identify repeatable items. The italic items are used to provide grouping and cardinality, while the bold items are actual data elements of the definition.

<ul>
     <li> <i>IVD LOINC Publication</i> begin 
         <ul>
             <li> <b>Vendor Publication</b> </li>
             <li> {<i>Vendor Equipment Mapping</i> begin 
                <ul>
                     <li> <b>Equipment</b> </li>
                     <li> {<i>IVD Test Mapping</i> begin
                         <ul>
                             <li> <b>IVD Test Result</b> </li>
                             <li> [<b>LOINC</b>] </li>
                         </ul>
                     </li>
                     <li> <i>IVD Test Mapping</i> end} </li>
                 </ul>
             </li>
             <li> <i>Vendor Equipment Mapping</i> end} </li>
        </ul>
     </li>
     <li> <i>IVD LOINC Publication</i> end </li>
</ul>

The implementation guide supports the following mappings:

<ul>
     <li> One vendor <b><i>IVD Test Result</i></b> to many <b><i>LOINC</i></b>s
         <ul>
             <li> This is a very common occurrence. For example, an IVD test for serum glucose could map to a LOINC code for a mass concentration (e.g. mg/dL) or one that defines a substance concentration (e.g. mol/L). Or, a urine albumin could map to a LOINC test for a 24 hour excretion rate with units of mg/(24.h),  versus one for a random urine with unit of md/dL.</li>
            <li> The structure of the data definition naturally supports this relationship.</li>
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
             <li> The structure of the data definition supports this relationship through repeating LOINC data content across multiple <b><i>IVD Test Results</i></b>. </li>
        </ul>
     </li>
</ul>

### Data Definitions
#### Publication
This information establishes the version for the publication are expressed through the LIVD Catalog profile, including.

* **_Publisher_** is the entity publishing the mapping information.
* **_Publication Version ID_** is human-readable information provided by the vendor that can be used to differentiate LOINC publication versions.
* **_LOINC Version ID_** is the version of LOINC that was used for the mapping.
* The **_[LOINC License](https://loinc.org/license/)_** requires a statement of attribution and notice that LOINC content is copyrighted. 
* **_LOINCCopyright_** component holds the required attribution statement.
* **_Localization_** is the language used for this publication.
* **_Region_** is an optional vendor description for which geographic or administrative region this localization is valid, e.g. de-CH is self-explanatory, but not en-CH.

#### Equipment
The equipment elements are expressed through the LIVD Device Definition profile, including:

* **_Manufacturer_** is the name of the manufacturer of the device.
* **_Model_** is the model of the device as provided by the manufacturer.
* **_UID_** is the unique device identifier, that may be the one used in the Unique Device Identifier (UDI) constructs.
* **_UID Type_** is capable of supporting the unique device identification system to identify medical devices through their distribution and use. When fully implemented, the label of most devices will include a unique device identifier (UDI) in human- and machine-readable form.

Note that types and cardinality are aligned with values reported in LAW OBX-18 Equipment Instance Identifier.

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

Additionally, various details on the Observation Definition that can aid in the mapping from the IVD Test Code to a LOINC are included as optional attributes, even though not referenced in the original IICC white paper.

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

#### IICC-FHIR Structural Mappings
Provide mapping between IICC spreadsheet column headers and FHIR components used.

Clarify that this is only using FHIR definitions, but does not depend on FHIR based APIs, RESTful services, SMART, or any other particular implementation.


### Underlying technologies

This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard.

#### FHIR

This implementation guide uses terminology, notations and design principles that are
specific to FHIR.  Before reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR as well
as general guidance on how to read FHIR specifications.  Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following
prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html)
* (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)