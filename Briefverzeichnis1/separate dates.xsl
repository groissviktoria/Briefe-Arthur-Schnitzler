<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei='http://www.tei-c.org/ns/1.0'
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    
    
    <xsl:template match="tei:l">
        <xsl:choose>
           
        <xsl:when test="matches(.,'(\d\d\d\d)')">
            
           <xsl:element name="date">
              
               <xsl:value-of select="."/>
           </xsl:element>
            
            
       </xsl:when>
            
            <xsl:when test="not(tokenize(.)[2]) and matches(.,'\d')">
                <xsl:element name="day">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="name">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
</xsl:stylesheet>