<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:ng="http://docbook.org/docbook-ng"
                xmlns:db="http://docbook.org/ns/docbook"
                exclude-result-prefixes="db ng exsl"
                version='1.0'>
<xsl:import href="../docbook-xsl/fo/docbook.xsl"/>

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
 
<xsl:param name="body.font.family">WenQuanYiMicroHeiLight</xsl:param>
<xsl:param name="monospace.font.family">WenQuanYiMicroHeiLight</xsl:param>
<xsl:param name="title.font.family">WenQuanYiMicroHeiLight</xsl:param>
<xsl:param name="dingbat.font.family">WenQuanYiMicroHeiLight</xsl:param>
<xsl:param name="symbol.font.family">WenQuanYiMicroHeiLight</xsl:param>
<xsl:param name="sans.font.family">WenQuanYiMicroHeiLight</xsl:param>


</xsl:stylesheet>
