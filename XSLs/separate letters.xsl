<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:mode on-no-match="shallow-copy"/>
<xsl:output indent="yes"></xsl:output>

<!-- Trennt die Briefe innerhalb eines Dokuments in TEI-Blöcke auf. Header wird angelegt, aber durch separates XSL ergänzt.
    Der übrige Brief wird ins TEI-Format übertragen-->
    
    <xsl:template match="title">
        <xsl:element name="TEI">
            <!-- HEADER -->
            <xsl:element name="teiheader">
                
              

                <!-- TITLE AND PAGENUMBERS -->

                <xsl:element name="title">
                    <xsl:value-of select="."/>
                </xsl:element>
                <xsl:element name="pagenumberS">

                    <xsl:value-of select="following-sibling::pb[1]"/>
                </xsl:element>



                <xsl:choose>
                    <xsl:when test="following-sibling::title/preceding-sibling::node()[1] = head">
                        <xsl:element name="pagenumberE">
                            
                            
                            <xsl:value-of
                                select="following-sibling::title[1]/preceding-sibling::pb[1]"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="pagenumberE">
                           
                            <xsl:value-of
                                select="following-sibling::title[1]/following-sibling::pb[1]"/>
                            
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>


                <xsl:if test="following-sibling::type[1]/preceding-sibling::title[1] = .">
                    <xsl:element name="type">
                        <xsl:value-of select="following-sibling::type[1]"/>
                    </xsl:element>
                </xsl:if>
                
                
                
              
            </xsl:element>


            <!-- BODY -->

            <xsl:element name="text">
                <xsl:element name="body">
                    <xsl:element name="div">
                        <xsl:attribute name="type">
                            <xsl:text>writingSession</xsl:text>
                        </xsl:attribute>
                        <!-- OPENER -->
                        <xsl:element name="opener">

                            
                            <xsl:element name="dateline">
                                <xsl:value-of select="following-sibling::dateline[1]"/>
                            </xsl:element>

                            <xsl:element name="salute">
                                <xsl:value-of select="following-sibling::salute[1]"/>
                            </xsl:element>

                        </xsl:element>

                        <!-- TEXT -->
                        <xsl:element name="p">
                            <xsl:call-template name="getP">
                                <xsl:with-param name="firstTitle" select="."/>
                                <xsl:with-param name="par" select="following-sibling::p[1]"/>
                            </xsl:call-template>
                        </xsl:element>

                        <!-- CLOSER -->
                        <xsl:if test="following-sibling::closer[1]/preceding-sibling::title[1] = .">
                            <xsl:element name="closer">
                                <xsl:value-of select="following-sibling::closer[1]"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if
                            test="following-sibling::postscript[1]/preceding-sibling::title[1] = .">
                            <xsl:element name="postscript">
                                <xsl:value-of select="following-sibling::postscript[1]"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>

    </xsl:template>

    <xsl:template name="getP">
        <xsl:param name="par"/>
        <xsl:param name="firstTitle"/>


        <xsl:if test="$par/preceding-sibling::title[1] = $firstTitle">
            <xsl:value-of select="$par"/>
            <xsl:call-template name="getP">
                <xsl:with-param name="par" select="$par/following-sibling::p[1]"/>
                <xsl:with-param name="firstTitle" select="$firstTitle"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template
        match="SeparatorRegion | type | dateline | salute | p | closer | pb | postscript | head"/>


</xsl:stylesheet>
