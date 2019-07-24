<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs page"
    version="3.0">
    <xsl:output indent="yes"></xsl:output>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:param name="addr" select="document('Briefverzeichnis2-v4-final.xml')"/>
    <xsl:key name="name-of" match="tei:item" use="tei:name"/>
    
    <xsl:template match="correspDate" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
        
        <xsl:variable name="name" select="ancestor::correspAction/following-sibling::correspAction/child::persName"/>
        <xsl:variable name="letterCount">
            <xsl:number count="TEI[descendant::correspAction[@type='received']/child::persName=$name]" from="PcGts" level="any"/>
        </xsl:variable>
        
        <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:choose>
                <xsl:when test="key('name-of',ancestor::correspAction/following-sibling::correspAction/child::persName ,$addr)/date[number($letterCount)]/@when">
                    <xsl:attribute name="when">
                        <xsl:value-of select="key('name-of',ancestor::correspAction/following-sibling::correspAction/child::persName ,$addr)/date[number($letterCount)]/@when"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="notBefore">
                        <xsl:value-of select="key('name-of',ancestor::correspAction/following-sibling::correspAction/child::persName ,$addr)/date[number($letterCount)]/@notBefore"/>
                    </xsl:attribute>
                    <xsl:attribute name="notAfter">
                        <xsl:value-of select="key('name-of',ancestor::correspAction/following-sibling::correspAction/child::persName ,$addr)/date[number($letterCount)]/@notAfter"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="key('name-of',ancestor::correspAction/following-sibling::correspAction/child::persName ,$addr)/date[number($letterCount)]"/>
        </xsl:element>
    </xsl:template>
    
    <!-- <xsl:variable name="i">
    <xsl:number count="b/c" from="a" level="any" />
</xsl:variable> -->
    
</xsl:stylesheet>