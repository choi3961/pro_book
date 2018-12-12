<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="common_fiction.xsl"/>
    <xsl:import href="user_interface_dashboard.xsl"/>

    <!-- Override the basic frame of presentation for HTML title -->
    <xsl:template match="/">
        <html>
            <head>
                <title>User Interface for book design</title>
                <link rel="stylesheet" type="text/css" href="../static/style_fiction.css"/>
                <script src="../static/js/jquery-min.js"></script>                
            </head>
            
            <body>
                                     
                <xsl:call-template name="container"/>

                <script src="../static/js/fiction_interface.js"> </script>                               
            </body>
        </html>
    </xsl:template>
    
    <!-- Shows the list of course departments -->     
    <xsl:template match="book">
      <xsl:call-template name="user_interface_dashboard"></xsl:call-template>    
    </xsl:template>
</xsl:stylesheet>