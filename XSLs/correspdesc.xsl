<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output indent="yes"/>
    <xsl:mode on-no-match="shallow-skip"/>
    
    <!-- extrahiert CMIF (corresp-file), Anwendung vor Trennung der Briefe in separate Dokumente -->
    
    <xsl:template match="page:PcGts">
        <xsl:element name="TEI">
            <xsl:element name="teiHeader">
                <xsl:element name="fileDesc">
                    <xsl:element name="titleStmt"/>
                    <xsl:element name="publicationStmt"/>
                   
                    <xsl:element name="sourceDesc"/>
                        
                    
                </xsl:element>
                <xsl:element name="profileDesc">
                    <xsl:for-each select="descendant::correspDesc">
                        <xsl:copy-of select="."></xsl:copy-of>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
</xsl:stylesheet>