<blockquote class="stu-note">
<p>
This specification is the is the third STU ballot, which represents the updates since the second ballot (December 2020).  It temporarily removes updates that were made in the 0.3.0 (December 2020) version which were intended to support the addition of Result Value mapping guidance.  These updates for supporting Result Value mapping are expected to be brought back and further developed in a subsequent version. The intent is to publish LIVD STU R1 version upon completing the reconciliation for this current January 2024 ballot.
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

By voluntarily adopting the format described here as an industry convention, IVD vendors will understand what data and in what format they should provide when publishing suggested LOINC codes for their IVD tests. By doing so, this work will significantly reduce the variability of the content and format of the multiple publications received by laboratory environments, further reducing the time and effort required by laboratories to review and integrate this information into their laboratory software systems. The format includes additional vendor information, such as a description of the result, used to easily discriminate between multiple LOINC codes for the same IVD test. 

Ideally it is envisioned that the LOINC codes selected by manufacturers would be reviewed by a common party (e.g. Regenstrief) for correctness and consistency across vendors, and also that the industry would establish conventions for the storage and access of the IVD vendor LOINC publications. The effort required for these objectives will also be reduced by having this standard publication format and associated content.

### Scope

#### In Scope
The **initial** scope of this implemnentation guide R1 is to support the IICC LIVD 2.0 specification and Excel format described <a href="https://ivdconnectivity.org/livd/">here</a>.

#### Out of Scope

The following topics are out of scope of this initial, first version R1:

* The mapping of IVD test orders, which requires additional data and alignment on a standardized coding system for orders.  Although IVD test orders and IVD test results are related, information required for IVD test order mapping should be provided by a separate mapping table.
* The mapping of result values to LOINC answer codes and/or SNOMED.
* Any long-term or common storage locations hosting the published LOINC codes.
* Regulatory impacts of vendors providing LOINC codes for their IVD tests.
* The definition of the specific protocols or technologies that could be used to transmit the industry-defined digital content between IVD and LIS or other systems.
* Transmitting LOINC codes directly from IVD instruments, leaving that content to be represented by vendor-defined codes due to issues in achieving one-to-one appropriate LOINC codes, as discussed in the Data Definition section.
* Which LOINC codes vendors should choose for their tests, or what content is needed to make this decision. It only addresses the format used to publish these associations, for use by laboratory personnel or laboratory applications.
* What information is required to automatically set up a configuration between an IVD instrument and an IVD software system.
