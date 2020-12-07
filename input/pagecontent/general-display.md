<h3> Implementation Consideraitons </h3>

<h4> Workflow Considerations </h4>
The device manufacturer creates the LIVD mappings based on their intended use of IVD test and result codes relative to the appropriate LOINC and/or SNOMED codes.  The manufacturer may already create a spreadsheet based mapping based on the LOINC transmission document for IVDs (LIVD) standard, which is a standard explicitly developed for this purpose by the IVD Industry Connectivity Consortium (IICC).  This will help visualize the mapping described in the next sections to aid in the creation of the FHIR based LIVD maps.  One may opt to generate it directly from the available spreadsheet, or any other source that is used internally by the manufacturer to document these mappings.  If not yet documented, and there are no immediate plans to use the FHIR based format for internal documentation as well, it is recommended to use the IICC spreadsheet format is it is likely also one of the formats in which the Lab technician may be presented with the LIVD mappings.

<h4> Display Considerations </h4>
When displaying the information to those configuring the mappings between IVD Test Codes, Result Values, and the appropriate LOINC or SNOMED code, one must consider the relevant data to assist in the mapping.  We provide the following guidance for consideration:

<ul>
   <li> General </li>
     <ul>
       <li> Whenever LOINC codes and other contents are displayed, the license agreement requires the proper notice to be displayed according to the <a href=https://loinc.org/license/>this guidance</a>.  One may want to link to the proper web page, or make otherwise easily accessible.</li>
       <li> Whenever the information is made available in multiple languages, one may make alternate languages available from the default language for the laboratory.</li>
     </ul>
   <li> Test Codes </li>
     <ul>
       <li> IVD Test Codes  </li>
          <ul>
            <li> IVD Test Codes, particularly when presented from a multi-vendor catalog, should clearly be associated and recognized as belonging to a specific device model (including equipment UID and type), and the device vendor.</li>
         </ul>
       <li> LOINC Code(s)  </li>
          <ul>
            <li> For each of the suggested LOINC codes for the IVD Test Code, one should dispay the LOINC long name and the vendor descriptions of results, specimen, and other comments together, while the LOINC part information should be easily accessible or directly displayed as well.  </li>
          </ul>
      </ul>  
  <li> Result Values  </li>
     <ul>
        <li> Vendor Values  </li>
           <ul>
            <li> Vendor Values should clearly be recognized as belonging to a specific IVD test code for a particular device model (including equipment UID and type), and the device vendor.</li>
           </ul>  
        <li> SNOMED Codes and/or LOINC Codes  </li>
           <ul>
              <li> While typically only SNOMED code or LOINC codes are presented based on local vocabulary choices, if both are made available not all vendor values may have a corresponding SNOMED and/or LOINC code.  On should therefore consider clearly distinguish either mapping by using columns or separate lists.</li> 
           </ul>
     </ul>  
</ul>
