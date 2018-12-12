<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Shows the list of allwebs from ../xml/allwebs.xml -->     
    <xsl:template name="work_process_dashboard">
    <div class="sidebar" id="left_side">
        hello
    </div>
    
    <div class="sidebar" id="right_side">

    </div>
    <div id="content">
        <div class="con_module">
            <xsl:for-each select = "/signals/signal">
                <xsl:variable name="sig" select="position()"/>
                <xsl:choose>
                    <xsl:when test = "$sig =1">
                        <li> ======== <xsl:value-of select="title"></xsl:value-of> ========</li>
                        <li><xsl:value-of select="contents/purpose"></xsl:value-of></li>
                        <li><xsl:value-of select="contents/function"></xsl:value-of></li>
                        <li><xsl:value-of select="contents/signal"></xsl:value-of></li>
                        <hr/>                    
                    </xsl:when>
                    <xsl:otherwise>
                        <li><xsl:value-of select="title"></xsl:value-of></li>
                        <li> Purpose  : <xsl:value-of select="contents/purpose"></xsl:value-of></li>
                        <li> Function : <xsl:value-of select="contents/function"></xsl:value-of></li>
                        <li> Signal : <xsl:value-of select="contents/signal"></xsl:value-of></li>
                        <hr/>                    
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:for-each>  
        </div>
    </div>   
    </xsl:template>
</xsl:stylesheet>