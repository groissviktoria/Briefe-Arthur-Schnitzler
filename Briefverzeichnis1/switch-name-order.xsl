<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="tei:name">
        <xsl:copy>
            <xsl:for-each select="tokenize(.)">
                <xsl:choose>
                    <xsl:when test="contains(.,',')"></xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                <xsl:text> </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:for-each>
            <xsl:value-of select="replace(tokenize(.)[1],',','')"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>