## LIVD Concepts

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
