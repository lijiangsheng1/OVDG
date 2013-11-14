<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:ng="http://docbook.org/docbook-ng"
                xmlns:db="http://docbook.org/ns/docbook"
                exclude-result-prefixes="db ng exsl"
                version='1.0'>
<xsl:import href="/home/lee/Docbook/docbook/fo/docbook.xsl"/>

<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <!-- font size is calculated dynamically by section.heading template -->
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="text-align">left</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>
 
<xsl:param name="body.font.family">wqy-microhei</xsl:param>
<xsl:param name="monospace.font.family">wqy-microhei</xsl:param>
<xsl:param name="title.font.family">wqy-microhei</xsl:param>
<xsl:param name="dingbat.font.family">wqy-microhei</xsl:param>
<xsl:param name="symbol.font.family">wqy-microhei</xsl:param>
<xsl:param name="sans.font.family">wqy-microhei</xsl:param>


<!-- about image media format -->

<!-- about ulink options -->
<xsl:param name="ulink.show">0</xsl:param>
<xsl:param name="ulink.hyphenate">&#x200B;</xsl:param>

<xsl:param name="highlight.source" select="1"/>


</xsl:stylesheet>
