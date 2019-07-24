<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    exclude-result-prefixes="xs page"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output indent="yes"></xsl:output>
    
    <xsl:template match="teiHeader" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
        <xsl:copy copy-namespaces="yes">
           
            <fileDesc>
                
                <titleStmt>
                    <title>
                        <xsl:attribute name="level">
                            <xsl:text>a</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Arthur Schnitzler an</xsl:text>
                        <xsl:value-of select="substring(child::title,3)"/>
                    </title>
                </titleStmt>
                
                <publicationStmt><publisher></publisher></publicationStmt>
                
                
            <sourceDesc>
                <listBibl>
                    <biblStruct>
                        <monogr>
                            <author>Schnitzler, Arthur</author> 
                            <title level="m">Briefe 1913–1931</title>
                            <editor>Hg. Peter Michael Braunwarth, Richard Miklin, Susanne Pertlik und Heinrich Schnitzler</editor>
                            <imprint>
                                <pubPlace>Frankfurt am Main</pubPlace>
                                <publisher>S. Fischer</publisher>
                                <date when="1984">1984</date>
                            </imprint>
                            <biblScope unit="pp">
                                <xsl:value-of select="child::pagenumberS"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="child::pagenumberE"/>
                            </biblScope>
                        </monogr> 
                    </biblStruct>
                </listBibl>
            </sourceDesc>
            </fileDesc>
                
            <xsl:element name="profileDesc" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="correspDesc" namespace="http://www.tei-c.org/ns/1.0">
                        
                    <xsl:element name="correspAction" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="type">
                                <xsl:text>sent</xsl:text>
                            </xsl:attribute>
                        <xsl:element name="persName" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:text>Arthur Schnitzler</xsl:text>
                            </xsl:element>
                            
                        <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0"/>
                               
                            
                            
                            
                        <xsl:element name="correspDate" namespace="http://www.tei-c.org/ns/1.0">
                                <!-- Datumselement angelegt, Datumseintrag über Referenz auf Verzeichnis über Empfänger-Matching => match-letters-to-dates-briefv-1.xsl -->
                            </xsl:element>
                           
                        </xsl:element>
                        
                    <xsl:element name="correspAction" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="type">
                                <xsl:text>received</xsl:text>
                            </xsl:attribute>
                        <xsl:element name="persName" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:choose>
                                    <xsl:when test="contains(child::title, 'Mutter')">
                                        <xsl:text>Louise Schnitzler</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(child::title, 'Vater')">
                                        <xsl:text>Johann Schnitzler</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(child::title, 'Eltern')">
                                        <xsl:text>Johann und Louise Schnitzler</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="substring(child::title,4)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    
                </xsl:element>
                
                
                
        
            
            
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>