<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="1.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Shows the list of allwebs from ../xml/allwebs.xml -->     
    <xsl:template name="allwebs_dashboard">
    <div class="sidebar" id="left_side">
      <div class="module">
        <xsl:value-of select="'hello'"/>
      </div>   
    </div>
    
    <div class="sidebar" id="right_side">
      <div>
          Hello
      </div>          
    </div>
    
    <div id="content">
        <div class="con_module">
            <h2>This is Source Colloceting Server</h2>
            <form method="post" action="modify.php">
                <textarea cols="97" rows="15" name="memo">
                    <xsl:value-of select="$modified"/>
                </textarea><br/>
                <input type="submit" value="modify"></input>
            </form>
        </div>
      </div>   
    </xsl:template>
</xsl:stylesheet>