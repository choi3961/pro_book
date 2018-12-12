<?xml version="1.0" encoding="utf-8"?>
<!-- This is the basic frame for presentation -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Body part of HTML document -->
    <xsl:template name="container">
        <div class="container">
            <button class="right_button"> <a href="/allwebs/regular/1">Regular Webs</a></button>
            <button class="right_button"> <a href="/allwebs/xml/1">Xml Webs</a></button>
            <button class="right_button"> <a href="/allwebs/file/1">File Webs</a></button>
            <button class="right_button"> <a href="/allwebs/lab/1">Lab Webs</a></button>
            <button class="right_button"> <a href="/allwebs/overview/1">Over View</a></button>
            <button class="left_button"> <a href="/allwebs/regular/1">Left Button</a></button>
            <xsl:call-template name="header"/>
            <xsl:call-template name="body"/>
            <xsl:call-template name="footer"/>
        </div>
    </xsl:template> 
    
    <!-- Header part of HTML body -->
    <xsl:template name="header">
       <div id="header"> 
         <h3> My Expressions bloom everywhere</h3>
         <h1>
           <xsl:value-of select="$title"/>
         </h1>
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
        <div class="footer">This is footer part
        </div>
        <hr/>
    </xsl:template>
</xsl:stylesheet>