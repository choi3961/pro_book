<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Shows the list of allwebs from ../xml/allwebs.xml -->     
    <xsl:template name="allwebs_dashboard">
    <div class="sidebar" id="left_side">
      <div class="module">
        <xsl:value-of select="'hello'"/>
      </div>       
      
      <div class="module"> 
      <div><xsl:value-of select="$root"></xsl:value-of></div>
      </div>                         

      <div class="module"> 
      </div>   
    </div>
    
    <div class="sidebar" id="right_side">
      <div>
          <form method="post" action="form2/queue">
              <input type="submit" value="queue"></input>
              <textarea cols="14" rows="5" name="item">
                  
              </textarea>
          </form>
      </div>    
      <div>
          <form method="post" action="form2/memo">
              <input type="submit" value="memo"></input>
              <textarea cols="14" rows="5" name="item">
                  
              </textarea>
          </form>
      </div><br/>    
      
    </div>
    <div id="content">
        <div class="con_module">
            <h2>All The Webs</h2>
            <xsl:for-each select="body/file_web/web">
                <button><a href="{contents/link}" target="_blank"><xsl:value-of select="title"/></a></button>
            </xsl:for-each>
        </div>
      </div>   
    </xsl:template>
</xsl:stylesheet>