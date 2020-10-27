## LOINC Mapping Summary

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
