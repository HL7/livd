<h3> Workflow Considerations </h3>
The main goal of this IG is the definition of the proper data exchange format. The following provides a general process context from the initial creation of the LIVD Catalog and its use by the laboratory.

The device manufacturer creates the LIVD mappings based on their intended use of IVD Test Performed and Coded Result Values relative to the appropriate LOINC and/or SNOMED codes. The manufacturer is expected to make the LIVD Catalog available in accordance with this LIVD IG defined format. The FHIR-based LIVD Catalog mwy actually be generated from a spreadsheet based mapping based on the LOINC transmission document for IVDs (LIVD) standard, which is a standard explicitly developed for this purpose by the IVD Industry Connectivity Consortium (IICC). They may use their own spreadsheet formats as well.

The manufacturer may provide the LIVD Catalog using any of the following methods and may include a spreadsheet format as well for human readability when not used in its electronic form by the receiver:

* includes the LIVD Catalog in whole or in part (e.g., specific to the device) as an electronic insert to the device's electronic documentation
* makes the LIVD Catalog accessable as a downloadable file on the manufacturer's site in whole across all their devices, or in parts for each of their devices.
* enables a FHIR based API, with or without a subscription capability enabling notification when content changes

An intermediary organization may gather LIVD catalogs from multiple vendors and makes those available through a library that laboratories and/or LIS systems can access.

A laboratory may receive the LIVD Catalog in varying forms, directly from the manufacturer or through an intermediary party:

* laboratory staff accesses the manufacturer's website to download the most current version when they configure a new device
* laboratory staff uses the LIVD catalog included in the device's package insert that came with the device
* the LIS queries for the LIVD catalog entries for the device being configured and either displays the mappings, or may suggest a mapping based on other information available in the LIS for the device and intended tests at hand

<h3> Display Considerations </h3>
When displaying the information to those configuring the mappings between IVD Test Performed and the appropriate LOINC codes, one must consider the relevant data to assist in the mapping.  We provide the following guidance for consideration:

<ul>
   <li> General </li>
     <ul>
       <li> Whenever external code systems are being displayed (e.g. LOINC and SNOMED CT) care should be taken to follow the rules in the respective license agreement.  For LOINC see <a href="https://loinc.org/license/">this guidance</a>. 
       <li> Whenever the information is made available in multiple languages, one may make alternate languages available from the default language for the laboratory.</li>
     </ul>
   <li> Test Codes </li>
     <ul>
       <li> IVD Test Performed </li>
          <ul>
            <li> IVD Test Performed, particularly when presented from a multi-vendor catalog, should clearly be associated and recognized as belonging to a specific device model (including equipment UID and type), and the device vendor.</li>
         </ul>
       <li> LOINC Code(s)  </li>
          <ul>
            <li> For each of the suggested LOINC codes for the IVD Test Performed, one should display the LOINC long name and the vendor descriptions of results, specimen, and other comments together, while the applicable LOINC part information should be directly displayed or easily accessible as well.  </li>
          </ul>
      </ul>  
</ul>
