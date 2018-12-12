<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Shows the list of course departments -->     
    <xsl:template name="fiction_dashboard">
    <div class="sidebar" id="right_side">
      <div class="btn"><span class='span007'>Auth</span></div><br/>
      <div><form action="in_once4" method="POST">
      
      
       <!--
              <input type="text" name ="in_put" value = "hello" /><br/><br/>
               -->       

              <input type="file" name ="file"/><br/><br/>
              
       
              
              <input type="submit" />
            </form>
      </div><br/>   
      <div class="btn"><a href="in_once4" target="_blank">FCMMSPPDAD</a></div><br/>
      <div class="btn"><a href="start" target="_blank">first</a></div><br/>
      <div class="btn"><a href="combine" target="_blank">combine</a></div><br/>      
      <div class="btn"><a href="modify_fiction" target="_blank">modify</a></div><br/>
      <div class="btn"><a href="trans/modify333" target="_blank">modify333</a></div><br/>
      <div class="btn"><a href="sig_tags" target="_blank">sig_tags</a></div><br/>     
      <div class="btn"><a href="p_tag" target="_blank">p_tag</a></div><br/>         
      <div class="btn"><a href="parser" target="_blank">parser</a></div><br/>  
      <div class="btn"><a href="distinct_tags" target="_blank">distinct_tags</a></div><br/>    
      <div class="btn"><a href="aux_files" target="_blank">aux_files</a></div><br/>  
      <div class="btn"><a href="default_setting" target="_blank">default_setting</a></div><br/>
      <div class="btn"><a href="default_fo" target="_blank">default_fo</a></div><br/>    
      <div class="btn"><a href="default_base" target="_blank">default_base</a></div><br/>                  
      <div class="btn"><a href="user_interface" target="_blank">user_interface</a></div><br/>
      <div class="btn"><a href="save_default" target="_blank">save_default</a></div><br/>      
      <div class="btn"><a href="fiction_interfere" target="_blank">fiction_interfere</a></div><br/>    
      <div class="btn"><a href="t_tag" target="_blank">t_tag</a></div><br/>
      <div class="btn"><a href="tip_tag" target="_blank">tip_tag</a></div><br/>
      <div class="btn"><a href="bold" target="_blank">bold_tag</a></div><br/>
      <div class="btn"><a href="utf" target="_blank">UTF</a></div><br/>
      <div class="btn"><a href="bold_modify" target="_blank">bold_modify</a></div><br/> 
      <div class="btn"><a href="fop" target="_blank">fop</a></div><br/>
      
      <div class="btn" id='example'><a>속성사용 예</a></div><br/>

    </div>
    
    <div id="content">
        <!-- buttons contents  -->
        <div id="btn_header">
            <!-- Recursion for 24 buttons  -->
            <xsl:for-each select="body/item">          
                <xsl:choose>
                    <xsl:when test="style/text()='chapter'">
                        <xsl:variable name="button" select="'ch'"/>
                        <xsl:variable name="pointer" select="position()"/>
                        <button><a href="{$pointer}"><xsl:value-of select="$button"/></a></button>                
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="button" select="position()"></xsl:variable>
                        <button><a href="{$button}"><xsl:value-of select="$button"/></a></button>                
                    </xsl:otherwise>
                </xsl:choose>   
            </xsl:for-each>   
            
            <button> <a href="101">front</a></button>
            <button> <a href="102">back</a></button>
        </div>
        
        <div class='body_contents'>
            <div class = "item_title">
                <xsl:value-of select="body/item[$num]/title"/>
            </div>
        </div>
        
        <!-- body contents -->        
        <xsl:choose>
            
            <xsl:when test="$num =101">
                <xsl:for-each select="front/child::*"><!-- The number of child is 12 -->
                    <xsl:variable name="num2" select="position()"/>
                    <xsl:choose>
                      <xsl:when test="$num2 = 1 or $num2 = 2 or $num2 = 3 or $num2 = 4 or $num2 = 5 or $num2 = 6">
                          <div class='body_contents'>
                          <form method="post" action="form2/page_modify_f/{$num}/{$num2}">
                              <input type="submit" value = "page_modify" /><br/>
                              
                              <textarea name="page" rows="7" cols="90"><xsl:value-of select="."/></textarea>
                          </form><br/> 
                          </div>
                      </xsl:when>
                                                               
                      <xsl:otherwise>
                          <div class='body_contents'>
                     <!-- 
                          
                          <form method="post" action="form2/page_modify/{$num}/{$num2}">
                              <input type="submit" value = "page_modify" /><br/>
                              
                              <textarea name="page" rows="1" cols="90"><xsl:value-of select="."/></textarea>
                          </form><br/> 
                          
                         -->
                         </div>
                      </xsl:otherwise>                
                    </xsl:choose>  
                </xsl:for-each>     
            </xsl:when>
            <xsl:when test="$num =102">
                <xsl:for-each select="back/child::*"><!-- The number of child is 12 -->
                    <xsl:variable name="num2" select="position()"/>
                    <xsl:choose>
                      <xsl:when test="$num2 = 1 or $num2 = 2 or $num2 = 3 or $num2 = 4 or $num2 = 5 or $num2 = 6">
                          <div class='body_contents'>
                          <form method="post" action="form2/page_modify_b/{$num}/{$num2}">
                              <input type="submit" value = "page_modify" /><br/>
                              
                              <textarea name="page" rows="7" cols="90"><xsl:value-of select="."/></textarea>
                          </form><br/> 
                          </div>
                      </xsl:when>
                                                               
                      <xsl:otherwise>
                          <div class='body_contents'>
                    <!--  
                          
                          <form method="post" action="form2/page_modify/{$num}/{$num2}">
                              <input type="submit" value = "page_modify" /><br/>
                              
                              <textarea name="page" rows="1" cols="90"><xsl:value-of select="."/></textarea>
                          </form><br/> 
                          
-->          
                          </div>                
                      </xsl:otherwise>                
                    </xsl:choose>  
                </xsl:for-each>     
            </xsl:when>            

            <xsl:otherwise>    
                <div class='body_contents'>    
                 <!--    
                <form method="post" action="form2/modify/{$num}">
                   <input type="submit" value = "modify" /><br/>
                   <textarea name="mod" rows="15" cols="90"><xsl:value-of select="body/item[$num]/contents/con_header"/></textarea>
                </form><br/>  
           
                <form method="post" action="con_header_trans/{$num}">
                   <input type="submit" value = "trans" /><br/>
                   <textarea name="con_header_trans" rows="9" cols="90"><xsl:value-of select="body/item[$num]/contents/con_header_trans"/></textarea>
                </form><br/> -->
                </div>

                     
                <xsl:for-each select="body/item[$num]/contents/page">
                    <xsl:variable name="num2" select="position()"/>
                    <xsl:choose>
                      <xsl:when test="$num2 = 1 or $num2 = 2 or $num2 = 3 or $num2 = 4 or $num2 = 5 or $num2 = 6 or $num2 = 7">
                      <div class='body_contents'>
          <!--  -->
                        <form method="post" action="form2/page_modify/{$num}/{$num2}">
                          
                          <input type="submit" value = "page_modify" /><br/><br/>
                          <xsl:value-of select="title"/><br/>
                          <textarea name="page" rows="25" cols="90"><xsl:value-of select="text()"/></textarea>
                        </form><br/><br/>
                 <!--
                        <form method="post" action="form2/page_trans_modify/{$num}/{$num2}">
                            <input type="submit" value = "translation" /><br/>
                            <textarea name="page_trans" rows="22" cols="90"><xsl:value-of select="trans"/></textarea>
                        </form><br/>  
                            
                        <form method="post" action="form2/page_tips_modify/{$num}/{$num2}">
                            <input type="submit" value = "tips" /><br/>
                            <textarea name="page_tips" rows="13" cols="90"><xsl:value-of select="tips"/></textarea>
                        </form><br/>   -->  
                      </div> 
                      </xsl:when>
                                                               
                      <xsl:otherwise>
                        <div class='body_contents'>
      <!--               
                        <form method="post" action="form2/page_modify/{$num}/{$num2}">
                          <input type="submit" value = "page_modify" /><br/>
                          <textarea name="page" rows="19" cols="90"><xsl:value-of select="./text()"/></textarea>
                        </form><br/> 
                        <form method="post" action="form2/page_trans_modify/{$num}/{$num2}">
                            <input type="submit" value = "translation" /><br/>
                            <textarea name="page_trans" rows="1" cols="90"><xsl:value-of select="trans"/></textarea>
                        </form><br/> 
               -->         
                      </div>              
                      </xsl:otherwise>                
                    </xsl:choose>                                         
                </xsl:for-each>                  
                <div class='body_contents'>
                <form method="post" action="form2/reserve/{$num}">
                   <input type="submit" value = "reserve" /><br/>
                   <textarea name="reserve" rows="19" cols="90"><xsl:value-of select="body/item[$num]/contents/reserve"/></textarea>
                </form><br/>           
 <!-- 
           -->
                </div>
            </xsl:otherwise>
 
        </xsl:choose>
      </div>   
           
    </xsl:template>
</xsl:stylesheet>