<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="1.0" xmlns ="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="common.xsl"/>
    <xsl:import href="memo_dashboard.xsl"/>
    
    <xsl:param name="mod"/>
    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>All Webs</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            
            <body>
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Body part of HTML body -->
    <xsl:template name="body">
        <div class="body">
            <xsl:apply-templates select="allwebs"/>
        </div>
    </xsl:template>    
        
    <!-- Shows the list of course departments -->
    <xsl:template match="allwebs">
      <xsl:call-template name="allwebs_dashboard"></xsl:call-template>       
    </xsl:template>
     
    
</xsl:stylesheet>