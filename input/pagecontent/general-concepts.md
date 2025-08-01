The basic structure that the LIVD Publication must support is based on the **_[Digital Format for Publication of LOINC to Vendor IVD Test Results](https://ivdconnectivity.org/wp-content/uploads/2024/01/2021_02_28_-_IICC_LIVD_Digital_Format_V2.pdf)_** as published by [IICC](https://ivdconnectivity.org/) - IVD Industry Connectivity Consortium. It can be represented as follows:

![LIVD Publication Structure](Publication Structure - Version 1.jpg)

The implementation guide supports the following mappings:

<h3> IVD Test Performed </h3>
<ul>
     <li> A publication is typically for one vendor's devices, but it is possible to combine information from multiple vendors into an aggregate publication.
     </li>
     <li> One <b><i>IVD Test Performed</i></b> to zero or many <b><i>LOINC</i></b>s </li>
         <ul>
             <li> Depending on the context of the result, specimen, or other qualification, the same IVD Test Performed can be mapped to different suggested LOINC codes as also shown in the example in Section 2.1 [general-summary.html#example-1-%E2%80%93-glucose] and 2.2 [general-summary.html#example-2-total-protein-csf-urine].  An example may be that an IVD Test Performed for serum glucose could map to one LOINC code considering a mass concentration (e.g. mg/dL) or another LOINC considering a substance concentration (e.g. mol/L). Or, a urine albumin could map to one LOINC code for a 24 hour excretion rate with units of mg/(24.h), versus another LOINC code for a random urine with unit of md/dL.</li>
             <li> It is also possible that a LOINC code is not yet known or available at the time of the LIVD Publication, thus it is possible to not indicate any mapping.</li>
         </ul>
     <li> One <b><i>LOINC</i></b> to zero or many vendor <b><i>IVD Test Performed</i></b></li>
         <ul>
             <li> Having a LOINC code mapped to by multiple IVD Test Performed for a given device is less likely, but having the same LOINC code referenced by difference IVD Test Performed for different Vendor Equipment, certainly by different vendors, is very common.</li>
                  <ul>
                     <li> For example, an IVD instrument may distinguish stat tests from routine tests by the IVD Test Performed's vendor analyte code. In this case, the LOINC [13969-1] Creatine kinase.MB [Mass/volume] in Serum or Plasma is associated with two IVD Test Performed, depending if the test is routine or stat (prioritized).</li>
                     <li> Or, consider a susceptibility test that has different IVD Test Performed IDs based on the original specimen source. In this case, the LOINC [6932-8] Penicillin [Susceptibility] by Minimum inhibitory concentration (MIC), which is named for testing on the isolate, could be associated with multiple IVD Test Performed for one IVD Instrument depending on the clinical context. For example, the break points are different for suspected meningitis versus blood infections and to date LOINC has only distinguished test codes by suspected source of infection for some antibiotic susceptibility codes.</li>
                 </ul>
        </ul>
     <li> The IVD Test Map enable these many to many mappings, also considering that there may not be a suggested LOINC code for a particular IVD Test, or clearly that not every LOINC code is related to an IVD Test Performed.</li>
</ul>
