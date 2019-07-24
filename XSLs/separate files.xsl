<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output xpath-default-namespace="tei"></xsl:output>
    <!-- Trennt die bereits in TEI-Blöcken gruppierten Briefe in einzelne XML-Dokumente auf -->
    
    <xsl:template match="tei:TEI">
        <classpath location="/home/ap/saxon/saxon8.jar" />
        <xsl:variable name="current">
            <xsl:number/>
        </xsl:variable>
       
            <xsl:result-document method="xml" href="file_{$current}-output.xml">
                
                <xsl:copy-of select="."/>
                
            </xsl:result-document>
        
    </xsl:template>
</xsl:stylesheet>