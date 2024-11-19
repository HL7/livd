When communicating results from a device to the Laboratory Information System (LIS), the following concepts must be mapped: 
<ul>
    <li> The IVD Test Performed (In-Vitro Diagnostic Test) representing the analyte to the LIS Test Result; and</li>
    <li> The IVD Coded Result Value to the LIS Test Result's Coded Result Value when non-quantitative and codified</li>
</ul>
Neither the IVD Test Performed, the LIS Test Result, nor the respective IVD Coded Result Values are likely based on industry standard vocabulary.  The manufacturer assigns analyte information such as vendor analyte code (transmission code or identifier), a name, and reference identifier, plus associated IVD Coded Result Value codes, while the Laboratory creates LIS Test Results and its LIS Result Values for the tests they provide.  Through LIS configuration tools, the IVD Test Performed's Vendor Analyte Code is associated with one or more LIS Test Result Codes based on context, e.g., IVD Test Performed used with one vs. another specimen would yield a different LIS Test Results.  This process has been in place for decades and has been optimized to support the Laboratory's specific reporting requirements (including conformance to Clinical Laboratory Improvement Amendments (CLIA) for the US).

To enable analytics and clinical decision support, harmonization to a common vocabulary is critical.  For laboratory test results, Logical Observation Identifiers Names and Codes (LOINC<sup>(R)</sup>) is the coding system of choice, while for non-quantitative, encoded result values, SNOMED and LOINC are both in use to enable a consistent expression.  This introduces the question on how to map the LIS Test Result code to LOINC, as well as corresponding Coded Result Value code to either LOINC or SNOMED, and do so consistently across all laboratories to enable analytics and clinical decision support reliably.

For now, and particularly until an LIS communicates ordered tests to the device using LOINC, the device cannot provide the appropriate LOINC code for the IVD Test Performed with the test result and similarly the SNOMED or LOINC code for the Coded Result Value.  The LIS must provide the mapping as they associate the IVD Test Performed and its IVD Coded Result Value with the LIS Test Result and its LIS Result value respectively.   To date this mapping process has relied on a combination of the LOINC registry, RELMA, and the individual's knowledge of LOINC plus the LIS' test compendium and further information on the Vendor Analyte Code's Coded Result Value codes to arrive at the appropriate LOINC or SNOMED codes for the actual value where applicable.

The device manufacturer can aid in the process by providing a list of suggested LOINC codes for each of their IVD Test Performed, including context of the result, specimen, and other considerations that would influence the choice, as well as the appropriate LOINC or SNOMED codes for their IVD Coded Result Values.  Such guidance would help reduce the scope of potential LOINC and SNOMED codes to consider, thus improving efficiency and quality of the mapping process, particularly across laboratories, i.e., arriving at the same LOINC or SNOMED code for the same test.

The following diagram may help further clarify that:

![LIVD FHIR Mapping](LIVD_FHIR_Mapping - Version 2.jpg)

<ul>
    <li> The LIS maintains a map between the IVD Test Performed's vendor analyte code and their LIS Test Result code.</li>
        <ul>
            <li> One IVD Test Performed can yield different LIS Test Results depending on specimen and other parameters.</li>
            <li> Each of the LIS Test Results must have a LOINC code associated with it so the results report includes the appropriate LOINC code as well for downstream use.</li>
            <li> Laboratory staff today rely on LOINC definitions (using RELMA or the web based tool), their local mappings, and their expertise/knowledge about the device, test, and parameters, to associate a specific LOINC code to the LIS Test Result Code. </li>
        </ul>
    <li> The LIS also maintains a map between the Vendor Analyte Coded Result Value and the LIS Test Result's Coded Result Values.</li>
        <ul>
            <li> One IVD Coded Result Value yields one LOINC code or SNOMED code.</li>  
            <li> While it may have a map to both, local reporting requirements would yield an LIS to only use the LOINC or only then SNOMED codes.</li>
        </ul>
    <li> Adding the LIVD suggested mappings, where available, enhances the Laboratory's staff to arrive more quickly and correctly at the right LOINC and SNOMED codes.</li>
</ul>

When the laboratory professional builds the test results that their LIS will manage and interact with the devices, they can use the device vendor's suggestions to more accurately, consistently, and efficiently map the results in their LIS to a LOINC and/or SNOMED code in context of the device's IVD Test Performed and the IVD Coded Result Value.  Note that, as these are device vendor's suggestions, the expectation is that the suggested mappings are displayed and assist the laboratory staff to narrow the likely options that fit the laboratory's intended use based.  Therefore, the mappings are not suitable for automated configuration. The following example clarifies the information a laboratory professional would use during their configuration.

<h3> Example#1 – Glucose</h3>
Vendor Analyte Code = 1067 (Gluc) is mapped in the LIS to:
<ul>
   <li> LIS Test Result Info = 123 - Glucose CSF mg/dL </li>
   <li> LIS Test Result Info = 456 - Fasting Glucose Urine mg/dL </li>
   <li> LIS Test Result Info = 789 - 1 Hour Glucose Plasma mg/dL </li>
</ul>
LIVD Mapping Vendor Analyte Code = 1067 (Gluc) suggests:
<ul>
   <li> Based on vendor comment [comment], vendor result description [result] A, vendor specimen description [specimen] "cerebrospinal", unit of measure "mg/dL", LOINC axes => 2342-4 Glucose [Mass/volume] in Cerebral spinal fluid </li>
   <li> Based on vendor comment [comment], vendor result description [result] B, vendor specimen description "urine", unit of measure "mg/dL", LOINC axes => 63382-6 </li>
   <li> Based on vendor comment [comment], vendor result description [result] C, vendor specimen description "serum/plasma", unit of measure "mg/dL", LOINC axes => 20438-8 </li>
</ul>
Consequently, most appropriate mapping:
<ul>
   <li> LIS Test Result Code = 123 - Glucose CSF mg/dL MAP TO LOINC Code = 2342-4 Glucose [Mass/volume] in Cerebral spinal fluid </li>
   <li> LIS Test Result Code = 456 - Fasting Glucose Urine mg/dL MAP TO LOINC Code = 63382-6 Fasting glucose [Mass/volume] in Urine </li>
   <li> LIS Test Result Code = 789 - 1 Hour Glucose Plasma mg/dL MAP TO LOINC Code = 20438-8 Glucose [Mass/volume] in Serum or Plasma --1 hour post dose glucose </li>
</ul>

<h3> Example#2 - Total Protein (CSF/Urine)</h3>
This IVD "test kit" is usually named Total Protein (CSF/Urine) and utilized for the analysis of CSF, Random/Spot Urine, or Timed urine (24 hr, 2 hr, etc) specimens.  It is often used to perform body fluid Total Proteins.  However, a different IVD "test kit" is typically used for serum/plasma Total Protein levels, which is out of scope for this example. Note that the LIVD file would NOT contain the local Ask at ORder entry questions (local codes 444 and 555), nor the calculated value for local code 777. CSF=Cerebrospinal Fluid.
Vendor Analyte Code = 1099 (Total Protein CSF/Ur) is mapped in the LIS to:
<ul>
   <li> LIS Test Info =  Result Code 111 - Result Name <b>Protein, CSF</b>  Units <b>mg/dL</b> </li>
   <li> LIS Test Info =  Result Code 222 - Result Name <b>Protein, Random Urine</b>  Units <b>mg/dL</b> </li>
   <li> LIS Test Info =  Result Code 333 - Result Name <b>Protein, 24 Hour Urine</b>  Units <b>mg/dL</b> </li>
</ul>
LIVD Mapping Vendor Analyte Code = 1099 (Total Protein CSF/Ur) suggests:
<ul>
   <li> Based on vendor comment [comment], vendor <b>result description</b> [result] A, vendor <b>specimen</b> description [specimen] "<b>CSF</b>", LOINC axes => 2880-3 </li>
   <li> Based on vendor comment [comment], vendor <b>result description</b> [result] B, vendor <b>specimen</b> description [specimen] "<b>Urine</b>", LOINC axes => 2888-6 </li>
   <li> Based on vendor comment [comment], vendor <b>result description</b> [result] C, vendor <b>specimen</b> description [specimen] "<b>24 hour Urine</b>", LOINC axes => 21482-5 </li>
</ul> 
Consequently, most appropriate mapping would be:
<ul>
   <li>LIS Test Info =  Result Code111 - Result Name <b>Protein, CSF</b>  Units <b>mg/dL</b> </li>
   <ul>
       <li> LOINC Code = 2880-3 Protein [Mass/volume] in Cerebral spinal fluid </li>
   </ul>
   <li> LIS Test Info =  Result Code 222 - Result Name <b>Protein, Random Urine</b>  Units <b>mg/dL</b> </li>
   <ul>
      <li> LOINC Code = 2888-6 Protein [Mass/volume] in Urine </li>
   </ul>
   <li> LIS Test Info =  Result Code 333 - Result Name <b>Protein, 24 Hour Urine</b>  Units <b>mg/dL</b> </li>
   <ul>
      <li> LOINC Code = 21482-5 Protein [Mass/volume] in 24 hour Urine </li>
   </ul>
   <li> LIS Test Info =  Result Code 444 - Result Name <b>Hours of Collection</b> Units <b>Hours</b> - calculated from values in 333 and 444 </li>
   <ul> 
      <li> LOINC Code = 13362-9 Collection duration of Urine - provided as AOE </li>
   </ul>
   <li> LIS Test Info =  Result Code 555 - Result Name <b>Total Volume 24 Hour Urine Volume</b>  Units <b>mL</b> </li>
   <ul>
      <li> LOINC Code = 3167-4 Volume of 24 hour Urine - provided as AOE </li>
   </ul>
   <li> LIS Test Info =  Result Code 777 - Result Name <b>Total Protein, 24 Hour Urine Rate</b>  Units <b>g/24 Hr</b> </li>
   <ul>
       <li> LOINC Code = 2889-4 Protein [Mass/time] in 24 hour Urine - calculated from values in 333, 444 and 555 </li>
   </ul>
</ul>

<h3> Example #3 - Coded Result Values </h3>

A manufacturer defined the following codes for an Immunoassay molecular antigen test:
<ul>
    <li>Positive</li>
    <li>Negative</li>
    <li>Invalid</li>
</ul>
The manufacture established the following SNOMED CT mappings for the result values:
<ul>
    <li>Positive = 260373001, “Detected”</li>
    <li>Negative = 260415000, “Not Detected”</li>
    <li>Invalid = 455371000124106, “Invalid result”</li>
</ul>
