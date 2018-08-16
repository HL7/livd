<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile ConceptMap
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:ConceptMap</sch:title>
    <sch:rule context="f:ConceptMap">
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:name) &lt;= 0">name: maximum cardinality of 'name' is 0</sch:assert>
      <sch:assert test="count(f:title) &lt;= 0">title: maximum cardinality of 'title' is 0</sch:assert>
      <sch:assert test="count(f:experimental) &lt;= 0">experimental: maximum cardinality of 'experimental' is 0</sch:assert>
      <sch:assert test="count(f:date) &lt;= 0">date: maximum cardinality of 'date' is 0</sch:assert>
      <sch:assert test="count(f:publisher) &lt;= 0">publisher: maximum cardinality of 'publisher' is 0</sch:assert>
      <sch:assert test="count(f:contact) &lt;= 0">contact: maximum cardinality of 'contact' is 0</sch:assert>
      <sch:assert test="count(f:description) &lt;= 0">description: maximum cardinality of 'description' is 0</sch:assert>
      <sch:assert test="count(f:useContext) &lt;= 0">useContext: maximum cardinality of 'useContext' is 0</sch:assert>
      <sch:assert test="count(f:jurisdiction) &lt;= 0">jurisdiction: maximum cardinality of 'jurisdiction' is 0</sch:assert>
      <sch:assert test="count(f:purpose) &lt;= 0">purpose: maximum cardinality of 'purpose' is 0</sch:assert>
      <sch:assert test="count(f:copyright) &lt;= 0">copyright: maximum cardinality of 'copyright' is 0</sch:assert>
      <sch:assert test="count(f:source[x]) &gt;= 1">source[x]: minimum cardinality of 'source[x]' is 1</sch:assert>
      <sch:assert test="count(f:target[x]) &gt;= 1">target[x]: minimum cardinality of 'target[x]' is 1</sch:assert>
      <sch:assert test="count(f:group) &gt;= 1">group: minimum cardinality of 'group' is 1</sch:assert>
      <sch:assert test="count(f:group) &lt;= 1">group: maximum cardinality of 'group' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ConceptMap</sch:title>
    <sch:rule context="f:ConceptMap">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources (inherited)</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated (inherited)</sch:assert>
      <sch:assert test="not(exists(for $contained in f:contained return $contained[not(parent::*/descendant::f:reference/@value=concat('#', $contained/*/id/@value) or descendant::f:reference[@value='#'])]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource or SHALL refer to the containing resource (inherited)</sch:assert>
      <sch:assert test="exists(f:text/h:div)">A resource should have narrative for robust management (inherited)</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:security))">If a resource is contained in another resource, it SHALL NOT have a security label (inherited)</sch:assert>
      <sch:assert test="not(exists(f:name/@value)) or matches(f:name/@value, '[A-Z]([A-Za-z0-9_]){0,254}')">Name should be usable as an identifier for the module by machine processing applications such as code generation (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ConceptMap/f:group</sch:title>
    <sch:rule context="f:ConceptMap/f:group">
      <sch:assert test="count(f:source) &lt;= 0">source: maximum cardinality of 'source' is 0</sch:assert>
      <sch:assert test="count(f:sourceVersion) &lt;= 0">sourceVersion: maximum cardinality of 'sourceVersion' is 0</sch:assert>
      <sch:assert test="count(f:target) &lt;= 0">target: maximum cardinality of 'target' is 0</sch:assert>
      <sch:assert test="count(f:targetVersion) &lt;= 0">targetVersion: maximum cardinality of 'targetVersion' is 0</sch:assert>
      <sch:assert test="count(f:unmapped) &lt;= 0">unmapped: maximum cardinality of 'unmapped' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ConceptMap.group</sch:title>
    <sch:rule context="f:ConceptMap/f:group">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ConceptMap/f:group/f:element</sch:title>
    <sch:rule context="f:ConceptMap/f:group/f:element">
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ConceptMap.group.element</sch:title>
    <sch:rule context="f:ConceptMap/f:group/f:element">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ConceptMap/f:group/f:element/f:target</sch:title>
    <sch:rule context="f:ConceptMap/f:group/f:element/f:target">
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:dependsOn) &gt;= 2">dependsOn: minimum cardinality of 'dependsOn' is 2</sch:assert>
      <sch:assert test="count(f:dependsOn) &lt;= 2">dependsOn: maximum cardinality of 'dependsOn' is 2</sch:assert>
      <sch:assert test="count(f:product) &lt;= 0">product: maximum cardinality of 'product' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ConceptMap.group.element.target</sch:title>
    <sch:rule context="f:ConceptMap/f:group/f:element/f:target">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:comment) or not(exists(f:equivalence)) or ((f:equivalence/@value != 'narrower') and (f:equivalence/@value != 'inexact'))">If the map is narrower or inexact, there SHALL be some comments (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ConceptMap/f:group/f:element/f:target/f:dependsOn</sch:title>
    <sch:rule context="f:ConceptMap/f:group/f:element/f:target/f:dependsOn">
      <sch:assert test="count(f:system) &lt;= 0">system: maximum cardinality of 'system' is 0</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ConceptMap.group.element.target.dependsOn</sch:title>
    <sch:rule context="f:ConceptMap/f:group/f:element/f:target/f:dependsOn">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ConceptMap.group.unmapped</sch:title>
    <sch:rule context="f:ConceptMap/f:group/f:unmapped">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="(f:mode/@value != 'other-map') or exists(f:url)">If the mode is 'other-map', a url must be provided (inherited)</sch:assert>
      <sch:assert test="(f:mode/@value != 'fixed') or exists(f:code)">If the mode is 'fixed', a code must be provided (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
