<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output xpath-default-namespace="tei"></xsl:output>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output indent="yes"></xsl:output>
    
    <xsl:template match="tei:teiHeader">
        <xsl:copy>
           
            <xsl:element name="fileDesc">
                
                <xsl:element name="titleStmt">
                    <xsl:element name="title">
                        <xsl:attribute name="level">
                            <xsl:text>a</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Arthur Schnitzler an</xsl:text>
                        <xsl:value-of select="substring(child::tei:title,3)"/>
                    </xsl:element>
                </xsl:element>
                
               
                
                
            <xsl:element name="sourceDesc">
                <listBibl>
                    <biblStruct>
                        <monogr>
                            <author>Schnitzler, Arthur</author>
                            <title level="m">Briefe 1875–1912</title>
                            <editor>Hg. Therese Nickl und Heinrich Schnitzler</editor>
                            <imprint>
                                <pubPlace>Frankfurt am Main</pubPlace>
                                <publisher>S. Fischer</publisher>
                                <date when="1981">1981</date>
                            </imprint>
                            <biblScope unit="pp">
                                <xsl:value-of select="child::tei:pagenumberS"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="child::tei:pagenumberE"/>
                            </biblScope>
                        </monogr> 
                    </biblStruct>
                </listBibl>
            </xsl:element>
            </xsl:element>
                
                <xsl:element name="profileDesc">
                    <xsl:element name="correspDesc">
                        
                        <xsl:element name="correspAction">
                            <xsl:attribute name="type">
                                <xsl:text>sent</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="persName">
                                <xsl:text>Arthur Schnitzler</xsl:text>
                            </xsl:element>
                            
                            <xsl:element name="placeName"/>
                               
                            
                            
                            
                            <xsl:element name="correspDate">
                                <!-- Datumselement angelegt, Datumseintrag über Referenz auf Verzeichnis über Empfänger-Matching => match-letters-to-dates-briefv-1.xsl -->
                            </xsl:element>
                           
                        </xsl:element>
                        
                        <xsl:element name="correspAction">
                            <xsl:attribute name="type">
                                <xsl:text>received</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="persName">
                                <xsl:choose>
                                    <xsl:when test="contains(child::tei:title, 'Mutter')">
                                        <xsl:text>Louise Schnitzler</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(child::tei:title, 'Vater')">
                                        <xsl:text>Johann Schnitzler</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(child::tei:title, 'Eltern')">
                                        <xsl:text>Johann und Louise Schnitzler</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="substring(child::tei:title,4)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    
                </xsl:element>
                
                
                
        
            
            
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>