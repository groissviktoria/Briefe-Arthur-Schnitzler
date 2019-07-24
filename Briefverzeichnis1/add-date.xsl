<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="tei:date">
        <xsl:copy>
            <xsl:if test="./@cert">
                <xsl:attribute name="cert">
                    <xsl:value-of select="./@cert"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="tokenize(.)[3]">
                <xsl:attribute name="when">
                    <xsl:value-of select="tokenize(.)[3]"/>
                    <xsl:text>-</xsl:text>
                    <xsl:if test="string-length(tokenize(.)[2]) &lt; 2">
                        <xsl:text>0</xsl:text>
                    </xsl:if>
                    <xsl:value-of select="tokenize(.)[2]"/>
                    <xsl:text>-</xsl:text>
                    <xsl:if test="string-length(tokenize(.)[1]) &lt; 2">
                        <xsl:text>0</xsl:text>
                    </xsl:if>
                    <xsl:value-of select="tokenize(.)[1]"/>
                </xsl:attribute>
            
            <xsl:value-of select="tokenize(.)[1]"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="tokenize(.)[2]"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="tokenize(.)[3]"/>
            </xsl:if>
            <xsl:if test="not(tokenize(.)[3])">
                <xsl:attribute name="notBefore">
                    <xsl:value-of select="tokenize(.)[2]"/>
                    <xsl:text>-</xsl:text>
                    <xsl:choose>
                        <xsl:when test="tokenize(.)[1]='Sommer'">
                            <xsl:text>06</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="string-length(tokenize(.)[1]) &lt; 2">
                                <xsl:text>0</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="tokenize(.)[1]"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>-01</xsl:text>
                </xsl:attribute>
                
                <xsl:attribute name="notAfter">
                    <xsl:choose>
                        <xsl:when test="tokenize(.)[1]='12'">
                            <xsl:value-of select="number(tokenize(.)[2]) + 1"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="tokenize(.)[2]"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:text>-</xsl:text>
                    <xsl:choose>
                        <xsl:when test="tokenize(.)[1]='Sommer'">
                            <xsl:text>09</xsl:text>
                        </xsl:when>
                        <xsl:when test="tokenize(.)[1]='12'">
                        <xsl:text>01</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="number(tokenize(.)[1]) &lt; 9">
                                <xsl:text>0</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="number(tokenize(.)[1]) + 1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>-01</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="tokenize(.)[1]"/>
                <xsl:text>. </xsl:text>
                <xsl:value-of select="tokenize(.)[2]"/>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>