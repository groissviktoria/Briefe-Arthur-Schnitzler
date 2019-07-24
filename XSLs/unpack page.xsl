<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:page="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs xsl page"
    version="2.0">
    <xsl:mode on-no-match="shallow-copy"/>
    
    
    <xsl:template match="page:Page">
       
        <xsl:copy-of select="node()"></xsl:copy-of>
    </xsl:template>
</xsl:stylesheet>