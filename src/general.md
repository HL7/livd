### Structure and Supported Mappings

The basic structure that the LIVD Publication must support can be represented as follows, using the HL7® V2 message syntax of brackets ([…]) to identify optional items and braces ({…}) to identify repeatable items. The italic items are used to provide grouping and cardinality, while the bold items are actual data elements of the definition.

-- *IVD LOINC Publication* begin
   -- **Vendor Publication**
   -- {*Vendor Equipment Mapping* begin
       -- **Equipment**
       -- {*IVD Test Mapping* begin
            -- **IVD Test Result**
            -- [**LOINC**]

       -- *IVD Test Mapping* end}
   -- *Vendor Equipment Mapping* end}

-- *IVD LOINC Publication* end

The implementation guide supports the following mappings:

* One vendor **_IVD Test Result_** to many **_LOINC_**s
       * This is a very common occurrence. For example, an IVD test for serum glucose could map to a LOINC code for a mass concentration (e.g. mg/dL) or one that defines a substance concentration (e.g. mol/L). Or, a urine albumin could map to a LOINC test for a 24 hour excretion rate with units of mg/(24.h),  versus one for a random urine with unit of md/dL.
       * The structure of the data definition naturally supports this relationship.
* One **_LOINC_** to many vendor **_IVD Test Results_**
       * This is a much less common occurrence.
             * For example, an IVD instrument may distinguish stat tests from routine tests by the IVD test code. In this case, the LOINC [13969-1] Creatine kinase.MB [Mass/volume] in Serum or Plasma is associated with two **_IVD Test Results_**, depending if the test is routine or stat (prioritized).
             * Or, consider a susceptibility test that has different IVD Test IDs based on the original specimen source. In this case, the LOINC [6932-8] Penicillin [Susceptibility] by Minimum inhibitory concentration (MIC), which is named for testing on the isolate, could be associated with multiple **_IVD Test Results_** for one IVD Instrument depending on the clinical context. For example, the break points are different for suspected meningitis versus blood infections and to date LOINC has only distinguished test codes by suspected source of infection for some antibiotic susceptibility codes.
       * The structure of the data definition supports this relationship through repeating LOINC data content across multiple IVD Test Results.

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

* **_Vendor Analyte Code_** is one of two possible values:
       * For an automated test result, it contains **_Vendor Transmission Code_** used by the instrument when sending the test result to a health information system, such as an LIS.
       * For a manual test result, it is the **_Vendor Analyte Identifier_** for the test result produced by the Test Kit.
* **_Vendor Analyte Name_** is human-readable text the vendor used to identify the analyte. The text might be displayed by the instrument or could be used within an assay insert.
* **_Vendor Reference ID_** is an additional vendor identifier, such as an identifier that can be used to locate the associated assay insert published by the vendor.

Additionally, various details on the Observation Definition that can aid in the mapping from the IVD Test Code to a LOINC are included as optional attributes, even though not referenced in the original IICC white paper.

#### IVD Analyte Code - LOINC Mapping

The potential mappings of the IVD Analyte Code to LOINC code are captured in the LIVD Concept Map profile.  For each IVD Analyte Code and a suggested LOINC code, the following attributes are captured.

* **_Vendor Specimen Description_** is human-readable text that provides information about the specimen used for the test, such as “Serum or Plasma.” The field is used to document the vendor description of the specimen used for the IVD test.
* **_Vendor Result Description_** is human-readable text that provides information about the result that is produced.
       *For non-numeric results, this field should describe the result by including one of the following:
             * **Binary** – pos/neg, reactive/non-reactive.
             * **Ordinal** – none, few, many.
             * **Nominal** – the test can report none found or one or more possibilities from a taxonomy of choices, such as organism names.
       * Numeric results and associated units of measure:
             * For numeric results, this field should describe the result by including a representative unit of measure, preferably represented as a UCUM unit.
             * If one unit of measure is reported, then include it in this field.
             * If multiple units can be reported that can be converted to one another by a multiplicative scale factor independent of the analyte (such as mg/L and ug/dL), select one of the units as a representative unit.
             * If multiple units can be reported that cannot be converted by an analyte-independent scale factor (such as mol/L and as mg/L), then define a mapping for each unit. These different types of numeric results require their own LOINC codes – one for the test reported as molar concentration and one for the test reported as mass concentration. Similarly, the results of a urine analyte (e.g. Sodium) reported as either mmol/L (spot urine) versus mmol/(24.h) (24 hour urine) have different LOINC properties and map to two different LOINC codes. The same is true for viral loads which can be reported in units of copies/mL, Log (copies/mL), IU/mL and Log (IU)/mL; and none of which can be converted by a simple scale factor. These result types have different properties and thus different LOINC codes. In such cases, define a mapping for all units that are appropriate for this IVD test.
             * In some cases, the same IVD Test may be reported as a **Binary** result, or a spot numeric result of the mass concentration, etc. In such instances, the same **_IVD Test Result_** will map to multiple LOINCs. The Vendor Result Description should be used to assist the laboratory in manually selecting the appropriate LOINC for their laboratory. 
* **_Vendor Comment_** is human-readable text clarification, such as “This is a STAT (prioritized) version of the test”. 

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