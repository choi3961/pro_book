<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="common.xsl"/>
    <xsl:import href="lab_webs_dashboard.xsl"/>

    <xsl:param name="num"/>
    <xsl:param name="title"/>


    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>All Webs</title>
                <link rel="stylesheet" type="text/css" href="../../static/style.css"/>
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
            </head>
            
            <body>
                <svg width="100" height="100">
                  <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
                   Sorry, your browser does not support inline SVG.
                </svg>             
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Shows the list of course departments -->     
    <xsl:template match="allwebs">
      <xsl:call-template name="lab_webs_dashboard"></xsl:call-template>       
    </xsl:template>

    <!-- Body part of HTML body -->
    <xsl:template name="body">
        <div class="body">
            <xsl:apply-templates select="allwebs"/>
        </div>
        
    </xsl:template>        
</xsl:stylesheet>