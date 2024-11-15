<blockquote class="stu-note">
<p>
This specification represents the updates from the first ballot (September 2019) and subsequent addition enabling documentation of Result Value mapping guidance.  It furthermore reflects updates in the "LIVD - Digital Format for Publication of LOINC to Vendor IVD Test Results" specification that is undergoing further updates to reflect Result Value mapping as well.  A draft is available  <a href="https://github.com/HL7/livd/blob/master/input/images/IICC%20LIVD%20Digital%20Format%20v2%20-%20Final%20Draft%20v0.1%20-%2020201113.docx">here</a>.  This is the second STU ballot with the intent to publish LIVD STU R1 version upon completing ballot reconciliaton.
</p>
<p>
Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR Jira tracker</a>
</p>
</blockquote>

### Background

The objective of this implementation guide is to define an In Vitro Diagnostic (IVD) industry format to facilitate the publication and exchange of suggested LOINC codes for vendor IVD test assays, based on either vendor IVD test transmission codes or manual test identification, for use by laboratory personnel or laboratory applications. It is not intended to cover information for other related activities, such as purchasing tests from a vendor. Expected systems using the format include Laboratory Information Systems (LIS), clinical middleware applications, databases, and terminology servers.

This implementation guide defines a digital format that can be easily:

* Used as-is by IVD software systems to guide the mapping between vendor IVD test transmission codes and LOINC codes.
* Transformed into an alternate format, such as an Excel spreadsheet, to support the manual selection of LOINC codes for results produced by vendor IVD tests used by the laboratory.

Both vendor-defined IVD tests performed by a vendor IVD instrument and vendor-defined manual IVD tests are in scope.

The content uses FHIR resource profiles that can be expressed in either JSON or XML, where JSON is the minimum required format to conform to this guide.  That can then in turn be expressed for a user in a table format, such as Microsoft Excel, that further simplifies its use within a laboratory setting, or consumed into the device configurator's workbench that is part of an Laboratory Information System (LIS) or other middleware connecting devices to LIS.

By voluntarily adopting the format described here as an industry convention, IVD vendors will understand what data and in what format they should provide when publishing suggested LOINC codes for their IVD Tests. By doing so, this work will significantly reduce the variability of the content and format of the multiple publications received by laboratory environments, further reducing the time and effort required by laboratories to review and integrate this information into their laboratory software systems. The format includes additional vendor information, such as a description of the result, used to easily discriminate between multiple LOINC codes for the same IVD Test. 

Ideally it is envisioned that the LOINC codes selected by manufacturers would be reviewed by a common party (e.g. Regenstrief) for correctness and consistency across vendors, and also that the industry would establish conventions for the storage and access of the IVD vendor LOINC publications. The effort required for these objectives will also be reduced by having this standard publication format and associated content.

### Out of Scope

The implementation guide has an **initial** scope that does not address:

* The mapping of IVD Test Orders, which requires additional data and alignment on a standardized coding system for orders.  Although IVD Test Orders and IVD Test Results are related, information required for IVD Test Order mapping should be provided by a separate mapping table.
* The mapping of result values to LOINC and/or SNOMED.
* Any long-term or common storage locations hosting the published LOINC codes.
* Regulatory impacts of vendors providing LOINC codes for their IVD tests.
* The definition of the specific protocols or technologies that could be used to transmit the industry-defined digital content between IVD and LIS or other systems.
* Transmitting LOINC codes directly from IVD instruments, leaving that content to be represented by vendor-defined codes due to issues in achieving one-to-one appropriate LOINC codes, as discussed in the Data Definition section.
* Which LOINC codes vendors should choose for their tests, or what content is needed to make this decision. It only addresses the format used to publish these associations, for use by laboratory personnel or laboratory applications.
* What information is required to automatically set up a configuration between an IVD instrument and an IVD software system.
