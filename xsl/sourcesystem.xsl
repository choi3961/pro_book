<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="common.xsl"/>
    <xsl:import href="sourcesystem_dashboard.xsl"/>

    <xsl:param name="num"/>
    <xsl:param name="how"/>
    <xsl:param name="title"/>
    
    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Source System</title>
                <link rel="stylesheet" type="text/css" href="../static/style.css"/>
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
    <xsl:template match="sourcesystem">
      <xsl:call-template name="sourcesystem_dashboard"></xsl:call-template>       
    </xsl:template>

    <xsl:template name="body">
        <div class="body">
            <xsl:apply-templates select="sourcesystem"/>
        </div>
    </xsl:template>     
</xsl:stylesheet>