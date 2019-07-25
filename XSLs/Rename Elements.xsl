<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    
    exclude-result-prefixes=""
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy" />
    
    <!-- Nicht benötigte Elemente werden entfernt, die übrigen werden umbenannt. -->
   
    <xsl:template match="page:ReadingOrder"></xsl:template>
    <xsl:template match="page:PrintSpace"></xsl:template>
    <xsl:template match="page:Metadata"></xsl:template>
    <xsl:template match="page:SeparatorRegion"></xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'title')]">
                <xsl:element name="title">
                    <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
                </xsl:element>
    </xsl:template>
    
    
    
    <xsl:template match="page:TextRegion[contains(@custom,'dateline')]">
      
        <xsl:element name="dateline">
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'salute')]">
        <xsl:element name="salute">
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'closer')]">
        <xsl:element name="closer">
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'pb')]">
        <xsl:element name="pb">
            
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'head')]">
        <xsl:element name="head">
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'postscript')]">
        <xsl:element name="postscript">
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'structure {type:p;}')]">
        <xsl:element name="p">
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="page:TextRegion[contains(@custom,'structure {type:type;}')]">
        <xsl:element name="type">
            <xsl:value-of select="./page:TextEquiv/page:Unicode"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>