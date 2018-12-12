<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="common_fiction.xsl"/>
    <xsl:import href="fiction_dashboard.xsl"/>

    <xsl:param name="num"/>
    <xsl:param name="title"/>
    
    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Fiction Book Design</title>
                <link rel="stylesheet" type="text/css" href="../static/style_fiction.css"/>
            </head>
            <body>                          
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Shows the list of course departments -->     
    <xsl:template match="book">
      <xsl:call-template name="fiction_dashboard"></xsl:call-template>
    </xsl:template>
</xsl:stylesheet>