<?xml version="1.0" encoding="utf-8"?>
<!-- This is the basic frame for presentation -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Body part of HTML body -->
    <xsl:template name="sourcesystem_dashboard">
        <div class="sidebar" id="left_side">
            <div class="module">
              hello
            </div>
        </div>
        <div class="sidebar" id="right_side">
          hello
        </div>
            
        <div id="content">
            <div class="con_module left_added">
                <table border="1">
                  <caption>Collection</caption>
                  <tr>
                      <th><xsl:value-of select="'collecting'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/collection/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>  
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/1">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add" type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>               
                  <!-- collect web contents and turn it into text file -->
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/web">
                              <input id="ad" type="text" name="web"></input>
                              <input id="add" type="submit" value="web"/>
                          </form>
                      </td>
                  </tr>
                </table>
                <hr/>  
            </div> 

            <div class="con_module left_added">
                <table border="1">
                  <caption>Building</caption>
                  <tr>
                      <th><xsl:value-of select="'Building'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/building/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/2">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add" type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                  
                </table>
                <hr/>  
            </div> 
            <div class="con_module left_added">
                <table border="1">
                  <caption>Finding</caption>
                  <tr>
                      <th><xsl:value-of select="'Finding'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/finding/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>    
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/3">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add"  type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                                             
            
                </table>
                <hr/>  
            </div>             
            <div class="con_module left_added">
                <table border="1">
                  <caption>Files</caption>
                  <tr>
                      <th><xsl:value-of select="'files'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/files/source">
                  <tr>
                      <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/4">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add"  type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                     
                </table>
                
                <hr/>  
            </div> 
            <div class="con_module left_added">
                <table border="1">
                  <caption>Functions</caption>
                  <tr>
                      <th><xsl:value-of select="'function'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/function/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/5">
                              <input id="ad" type="text" name="source"></input>
                              <input  id="add" type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div> 
            <div class="con_module"/>            
            <div class="clear"/>      
            <br/><hr/><br/>     
            <div class="con_module left_added">
                <table border="1">
                  <caption>Source</caption>
                  <tr>
                      <th><xsl:value-of select="'source'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/source/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/6">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add"  type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>
            <div class="con_module left_added">
              >>
            </div>   
            <div class="con_module left_added">
                <table border="1">
                  <caption>Function</caption>
                  <tr>
                      <th><xsl:value-of select="'function'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/func1/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/7">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add"  type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>       
            <div class="con_module left_added">
              >>
            </div>                             
            <div class="con_module left_added">
                <table border="1">
                  <caption>Resources</caption>
                  <tr>
                      <th><xsl:value-of select="'resources'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/resources/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/8">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add"  type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>
            <div class="con_module left_added">
              >>
            </div>
            <div class="clear"/>                   
            <div class="con_module left_added">
                <table border="1">
                  <caption>Expression</caption>
                  <tr>
                      <th><xsl:value-of select="'expression'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/expression/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/9">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add"  type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div> 
            <div class="con_module left_added">
              >>
            </div>            
            <div class="con_module left_added">
                <table border="1">
                  <caption>Function</caption>
                  <tr>
                      <th><xsl:value-of select="'function'"/></th>
                  </tr>
                  
                  <xsl:for-each select="sub_system/func2/source">
                  <tr>
                          <td><xsl:value-of select="title"/></td>
                  </tr> 
                  </xsl:for-each>                 
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/sourcesystem/add/10">
                              <input id="ad" type="text" name="source"></input>
                              <input id="add"  type="submit" value="add"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>      
                                                            
<!-- This is for functions for source or resources for book2 -->
            <div class="con_module"/>            
            <div class="clear"/>      
            <br/><hr/><br/>     
            <div> This is for functions for source or resources for book2</div>
            <div class="con_module left_added">
                <table border="1">
                  <caption>Remove substring</caption>
                  <tr>
                      <th><xsl:value-of select="'from paragraph.txt'"/></th>
                  </tr>                  
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/remove_substring">
                              <span>remove substring from paragraph.txt</span><br/>
                              <input id="ad" type="text" name="substring"></input>
                              <input id="ad55" type="text" name="file_name"></input>
                              <input id="add"  type="submit" value="remove_substring"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>      
            <div class="con_module left_added">
                <table border="1">
                  <caption>File rearrange</caption>
                  <tr>
                      <th><xsl:value-of select="'Rearrange files of received classic'"/></th>
                  </tr>                  
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/rearrange_paragraph">
                              <span>Rearrange files of received classic for each paragraph</span><br/>
                              <input id="re" type="text" name="rearrange"></input>
                              <input id="add"  type="submit" value="rearrange"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>      

            <div class="con_module left_added">
                <table border="1">
                  <caption>Find words</caption>
                  <tr>
                      <th><xsl:value-of select="'from a directory iterating'"/></th>
                  </tr>                  
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/find_words">
                              <span>find words from a directory iterating</span><br/>
                              <input id="st" type="text" name="string" value="string"></input>
                              <input id="re" type="text" name="directory" value="directory"></input>
                              <input id="add"  type="submit" value="find_words"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>     
            
                  
            <div class="con_module left_added">
                <table border="1">
                  <caption>UTF-8 change</caption>
                  <tr>
                      <th><xsl:value-of select="'change into UTF-8 sequence'"/></th>
                  </tr>                  
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/check_utf_8">
                              <span>change UTF-8 sequence if the file is UTF-8 string</span><br/>
                            

                              <input id="st" type="text" name="file" value="input file"></input>  
                              <!--  
                              <input id="re" type="text" name="directory" value="directory"></input>
                              -->
                              <input id="add"  type="submit" value="UTF-8 change"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>        
            

            <div class="con_module left_added">
                <table border="1">
                  <caption>~ modify</caption>
                  <tr>
                      <th><xsl:value-of select="'~ modify'"/></th>
                  </tr>                  
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/modify">
                              <span>modify book2.xml</span><br/>
                              
                              <input id="st" type="text" name="file" value="input file"></input>  
                              <!--  
                              <input id="re" type="text" name="directory" value="directory"></input>
                              -->
                              <input id="add"  type="submit" value="~ modify"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>   

            <div class="con_module left_added">
                <table border="1">
                  <caption>str_replace</caption>
                  <tr>
                      <th><xsl:value-of select="'replace'"/></th>
                  </tr>                  
                  <tr>
                      <td>
                          <form method="post" action="/allwebs/str_replace">
                              <span>Replace a stirng in book2.xml</span><br/>
                              
                              <input id="rep1" type="text" name="str1" value="from string"></input>  
                              
                              <input id="rep2" type="text" name="str2" value="to string"></input>
                              
                              <input id="rep3"  type="submit" value="replace"/>
                          </form>
                      </td>
                  </tr>                           
                </table>
                <hr/>  
            </div>                                                                                                 
            
                        
            <div class="con_module left_added">
                <hr/>  
            </div>       
            <div class="con_module"/>            
            <div class="clear"/>                   
             
            <span>M.S : Making sentences</span>     
            <div class="con_module"/>
                 
        </div>
    </xsl:template>
</xsl:stylesheet>

<!-- 

            <table border="1">
              <caption>Source System Map : sourcesystem.xml</caption>
              <tr><th>Collection System</th><th>Finding System</th><th>Files</th></tr>
              <xsl:for-each select="collection/source">
                  <tr><td><xsl:value-of select="title"/></td><td></td><td>tagger.xml</td></tr>
              </xsl:for-each>
            </table>
 -->            