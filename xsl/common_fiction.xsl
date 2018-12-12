<?xml version="1.0" encoding="utf-8"?>
<!-- This is the basic frame for presentation -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Body part of HTML document -->
    <xsl:template name="container">
        <div class="container">
            <xsl:call-template name="header"/>
            <xsl:call-template name="body"/>
            <xsl:call-template name="footer"/>
        </div>
    </xsl:template> 
    
    <!-- Header part of HTML body -->
    <xsl:template name="header">
       <div id="header"> 
         <h1> EDITOR </h1>
       </div>
    </xsl:template>
    
    <!-- Body part of HTML body -->
    <!-- This part could be replaced with other specific template body -->
    <xsl:template name="body">
        <div class="body">
            <xsl:apply-templates select="book"/>
        </div>   
    </xsl:template>    
    
    <!-- Footer part of HTML body -->
    <xsl:template name="footer">
        <div class ='clear'></div>
        <div id="footer">This is footer part
        </div>
        <hr/>
    </xsl:template>
</xsl:stylesheet>