<?xml version="1.0" encoding="utf-8"?>
<!-- This is the basic frame for presentation -->
<xsl:stylesheet version="1.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Body part of HTML document -->
    <xsl:template name="container">
        <div class="container">
            <button class="right_button"> <a href="">Temp 1</a></button>
            <button class="right_button"> <a href="">Temp 2</a></button>

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
           <xsl:value-of select="'Hello memo'"/>
         </h1>
       </div>
    </xsl:template>
    
    <!-- Footer part of HTML body -->
    <xsl:template name="footer">
        <div class="footer">This is footer part
        </div>
        <hr/>
    </xsl:template>
</xsl:stylesheet>