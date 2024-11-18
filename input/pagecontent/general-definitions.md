The following provides the specific definitions for each of the data elements relevant to LIVD.

We encourage the use of GUIDs (Globally Unique IDentifier) for identifiers to enable consumers and aggregators of LIVD Catalogs to easily merge and identify duplicates.

<h3> LIVD Publication </h3>
This information that describes the overall LIVD publication is expressed through the [LIVD Catalog](StructureDefinition-catalog-uv-livd.html) profile, including:

* **_Publisher_** is the entity publishing the mapping information.
* **_Publication Version ID_** is human-readable information provided by the vendor that can be used to differentiate LIVD Publication versions.
* **_LOINC Version ID_** is the version of LOINC that was used for the mapping.
* The **_[LOINC License](https://loinc.org/license/)_** requires a statement of attribution and notice that LOINC content is copyrighted.
* **_LOINCCopyright_** component holds the required attribution statement.
* **_Localization_** is the language used for this LIVD Publication.
* **_Region_** is an optional vendor description for which geographic or administrative region this localization is valid, e.g.  de-CH (German (Switzerland)) is self-explanatory, but not en-CH (English (Switzerland)).

<h3> Equipment </h3>
The equipment elements are expressed through the [LIVD Device Definition](StructureDefinition-devicedefinition-uv-livd.html) profile, including:

* **_Manufacturer_** is the name of the manufacturer of the device.
* **_Model_** is the model of the device as provided by the manufacturer.
* **_UID_** is the unique device identifier, that may be the one used in the Unique Device Identifier (UDI) constructs.
* **_UID Type_** is capable of supporting the unique device identification system to identify medical devices through their distribution and use. When fully implemented, the label of most devices will include a unique device identifier (UDI) in human- and machine-readable form.

Note that types and cardinality are aligned with values reported in the Integrating the Healthcare Enterpires (IHE) [Laboratory Analytical Workflow (LAW) Profile](https://www.ihe.net/resources/technical_frameworks/#PaLM) OBX-18 Equipment Instance Identifier.

<h3> IVD Test Performed </h3>

The IVD Test Performed attributes are aligned with obvservation definition attributes and expressed using the [LIVD Observation Definition](StructureDefinition-observationdefinition-uv-livd.html) profile.

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

Additionally, various details on the Observation Definition that can aid in the mapping from the IVD Test Performed's Vendor Analyte Code to a LOINC are included as optional attributes, even though not referenced in the original [IICC white paper](http://ivdconnectivity.org/wp-content/uploads/delightful-downloads/2017/06/IICC_LIVD_Digital_Format_2017_06_01_R2.pdf).

<h3> IVD Test Performed - LOINC Mapping </h3>

The potential mappings of the IVD Test Performed's Vendor Analyte Code to LOINC code are captured in the [LIVD Test Concept Map](StructureDefinition-conceptmap-testcode-uv-livd.html) profile.  For each IVD Test Performed's Vendor Analyte Code and a suggested LOINC code, the following attributes are captured.

<ul>
     <li> <b><i>Vendor Specimen Description</i></b> is human-readable text that provides information about the specimen used for the test, such as “Serum or Plasma.” The field is used to document the vendor description of the specimen used for the IVD Test Performed.</li>
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
                     <li> If multiple units can be reported that cannot be converted by an analyte-independent scale factor (such as mol/L and as mg/L), then define a mapping for each unit. These different types of numeric results require their own LOINC codes – one for the test reported as molar concentration and one for the test reported as mass concentration. Similarly, the results of a urine analyte (e.g. Sodium) reported as either mmol/L (spot urine) versus mmol/(24.h) (24 hour urine) have different LOINC properties and map to two different LOINC codes. The same is true for viral loads which can be reported in units of copies/mL, Log (copies/mL), IU/mL and Log (IU)/mL; and none of which can be converted by a simple scale factor. These result types have different properties and thus different LOINC codes. In such cases, define a mapping for all units that are appropriate for this IVD Test Performed.</li>
                      <li> In some cases, the same IVD Test Performed may be reported as a <b>Binary</b> result, or a spot numeric result of the mass concentration, etc. In such instances, the same <b><i>LIVD Test Performed</i></b> will map to multiple LOINCs. The Vendor Result Description should be used to assist the laboratory in manually selecting the appropriate LOINC for their laboratory.</li>
                 </ul>
             </li>
         </ul>
     </li>
     <li> <b><i>Vendor Comment</i></b> is human-readable text clarification, such as “This is a STAT (prioritized) version of the test”. </li>
</ul>

Note that **_Vendor Specimen Description_**, **_Vendor Result Description_**, and **_Vendor Comment_** are included to assist a laboratory in selecting the appropriate LOINC code(s) for the vendor IVD Test Performed used by the laboratory. This information is not intended to be parsed by an IVD Software System that automates the mapping of vendor IVD transmission codes to LOINC codes. The inclusion of this information should reduce errors in the manual selection of LOINC codes by a laboratory.

<h3> LOINC Code System </h3>
For each of the LOINC codes being considered, a minimum set from the code system is included to further aid in the mapping process.  These are included in the [LIVD LOINC Fragment CodeSystem](StructureDefinition-codesystem-loinc-frag-uv-livd.html) profile.

* **_LOINC Code_**
* **_LOINC Long Name_**
* **_Component_**
* **_Property_**
* **_Time_**
* **_System_**
* **_Scale_**
* **_Method_**

<h3> Sample Data </h3>
As part of defining the whitepaper, IICC also developed a spreadsheets that contains the relevant data and a potential representation of that data that can be found [here](https://ivdconnectivity.org/livd/).
