<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:date">
        <xsl:copy>
            <xsl:if test="contains(., '?') or contains(., '[') or contains(., ']')">
                <xsl:attribute name="cert">
                    <xsl:text>low</xsl:text>
                </xsl:attribute>
            </xsl:if>

            <xsl:value-of select="replace(., '(\?|\[|\])', '')"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
