<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Shows the list of course departments -->     
    <xsl:template name="html_editor_dashboard">
    <div class="sidebar" id="left_side">
    </div>
    <div class="sidebar" id="right_side">
    </div>
    
    <div id="content">
        <!-- Recursion for 40 buttons  -->
        <xsl:for-each select="(//node())[20 >= position()]">
            <xsl:variable name="button" select="position()"></xsl:variable>
            <button><a href="{$button}"><xsl:value-of select="$button"/></a></button>
        </xsl:for-each>    

        <button ><a href="source">Source</a></button>        

        <form method="post" action="form2/modify/{$num}">
          <input type="submit" value = "modify" />
          <textarea name="mod" id="mod" rows="40" cols="90">
              <xsl:value-of select="body/item[$num]/contents"/>
          </textarea>
        </form><br/>
    </div>   
                <script>
                CKEDITOR.replace( 'mod' );
                </script>   
      <div id="bottom"></div>      
    </xsl:template>
</xsl:stylesheet>