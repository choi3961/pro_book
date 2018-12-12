<?xml version="1.0" encoding="utf-8"?>
<!-- Shows the list of departments of the courses -->
<xsl:stylesheet version="2.0" xmlns ="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Shows the list of allwebs from ../xml/allwebs.xml -->     
    <xsl:template name="tagger_dashboard">
    <div class="sidebar" id="left_side">
    </div>
    
    <div class="sidebar" id="right_side">
    </div>
    <div id="content">
        <div class="con_module">
            <h3>static, batch sentences</h3>
        </div>
        <div class="con_module right_added">
            <h3>static, batch paragraphs -- searching</h3>
            two things : xml file for the tag, xquery function 
        <form id = "sentence_form" method="post" action="/book2/paragraphs" target="_blank">
            <ul>
                <caption>Tagging</caption>
                <li>word</li>
                <select class="filter" name="tagger" size = "9" style="width:150px">
                    <xsl:for-each select="document('../xml/tagger_oneword.xml')/tagger/body/tag">
                        <xsl:sort select="title"/>
                        <option><xsl:value-of select="name"/></option>
                    </xsl:for-each>
                </select> 
                                            
                <li>number</li>
                <input class="filter" name = "num" type = "number" value="1"/>
                
                <li>mod</li>
                <input class="filter" name = "num2" type = "number" value="0"/>           
            </ul>
            <input class="filter" type="submit" value = "paragraphs"/>
        </form>           
        </div>        
        <div class="con_module">
            <h3>static, batch paragraphs -- making</h3>
            two things : xml file for the tag, xquery function.
            "tagger.xml" file has two kinds of tag(one word tag and the other). So 
            You should be careful when you add a new tagger. 
            <form method="post" action="/book2/build_static_batch_tag" target="_blank">
                <select class="filter" name="tagger" size = "9" style="width:150px">
                    <xsl:for-each select="document('../xml/tagger_oneword.xml')/tagger/body/tag">
                        <xsl:sort select="title"/>
                        <option><xsl:value-of select="name"/></option>
                    </xsl:for-each>
                </select>   <br/>           
                <input class="filter" type="submit" value = "Build Tag(no way)"/>    
                <span>use paragraph.php</span>
            </form>    <br/><br/> 
            <form method="post" action="/book2/add_tag" target="_blank">
                <input name= "tag" type="text" />
                <input class="filter" type="submit" value = "Add Tag"/>    
            </form>                           
        </div>
        <div class="clear"></div>

        <hr/>
        <br/>
        <div class="con_module right_added">
            <form id = "added_tag" method="post" action="/book2/build_dynamic_tag" target="_blank">
                <ul> 
                    <caption>Add tag</caption>
                    <li>Tag to be added</li>
                    <li>"tagger.xml" file has two kinds of tag.</li>
                    <li>So You should be careful when you add a new tagger.</li>
                    <li>You must amend this code</li>
                                    
                    <input class="filter" name = "tagger" type = "text" value="input word"/>
                </ul>
                <input class="filter" type="submit" value = "Add Tag(no way)"/>    
            </form>      
        </div>      
             
        <div class="con_module">
            <form id = "sentence_form" method="post" action="/book2/build_dynamic_tag" target="_blank">
                <ul>
                    <caption>Dynamic Building a Tag</caption>
                    <li>Taggers to build with</li>
                    <select class="filter" name="tagger" size = "9" style="width:300px">
                        <xsl:for-each select="/tagger/body/tag">
                            <xsl:sort select="title"/>
                            <option><xsl:value-of select="name"/></option>
                        </xsl:for-each>
                    </select>   
                </ul>
                <input class="filter" type="submit" value = "Build Tag"/>
            </form>
        </div>
        <div class="clear"></div>
        <hr/>
        <br/>

        <div class="con_module right_added"> 
          <h3>Regex Tag Search</h3>
          <form id = "dynamic_tagging" method="post" action="/book2/regex_tag_search" target="_blank">
              <ul>
                  <li>num</li>
                  <input class="filter" name = "num" type = "number" value="1"/>
                  <li>mod</li>
                  <input class="filter" name = "num2" type = "number" value="0"/>
                  <li>len1</li>
                  <input class="filter" name = "length1" type = "number" value="1"/>
                  <li>len2</li>
                  <input class="filter" name = "length2" type = "number" value="10000"/>
              </ul>    
              <input class="filter" type="submit" value = "dynamic tagging"/>    
          </form> 
        </div>

        <div class="con_module">
            <h3>Dynamic Regex Tag</h3>
            <form id = "sentence_form" method="post" action="/book2/build_d_r_t" target="_blank">
                <input style="width:500px" name="tagger" type="text" value = "( | | | )"/>
                <input class="filter" type="submit" value = "Build Regex Tag"/>
            </form>
        </div>
        <div class="clear"></div>
        <hr/>
        <br/>
        <div class="con_module">
            <h3>Not completed</h3>
            <form id = "advanced_build" method="post" action="/book2/advanced_tag" target="_blank">
                <ul>
                    <caption>Advanced Dynamic Building a Tag</caption>
                    <li>Taggers to build with</li>
                    <select class="filter" name="tagger" size = "9" style="width:300px">
                        <xsl:for-each select="/tagger/body/tag">
                            <xsl:sort select="title"/>
                            <option><xsl:value-of select="name"/></option>
                        </xsl:for-each>
                    </select> : arg 1 <br/>
                    <input type="number" name="num" min="1" max="10"/> : arg 2 <br/>
                    Make File
                    <input type="radio" name="file" value="on"/> Make
                    <input type="radio" name="file" value="off"/> No Make : arg 3
                </ul>
                <input class="filter" type="submit" value = "Build Tag"/>
            </form>
        </div>        
        <div class="clear"></div>
        <hr/>
        <br/>
        <div class="con_module right_added"> 
          <form id = "dynamic_tagging" method="post" action="/book2/dynamic_tagging" target="_blank">
              <ul>
                  <caption>D Tagging - S- adding</caption>
                  <li>word</li>
                  <input class="filter" name = "tag" type = "text" value="input word"/>
                  <li>num</li>
                  <input class="filter" name = "num" type = "number" value="3"/>
                  <li>mod</li>
                  <input class="filter" name = "num2" type = "number" value="0"/>
                  <li>len1</li>
                  <input class="filter" name = "length1" type = "number" value="100"/>
                  <li>len2</li>
                  <input class="filter" name = "length2" type = "number" value="200"/>
                  <li>occur</li>
                  <input class="filter" name = "occurrence" type = "number" value="1"/>
              </ul>    
              <input class="filter" type="submit" value = "dynamic tagging"/>    
  
          </form> 
        </div>                 

        <div class="con_module">
            <form id = "dynamic_tagging" method="post" action="/book2/dynamic_tagging" target="_blank">
                <ul>
                    <caption>Dynamic Tagging - Search</caption>
                    <li>word</li>
                    <select class="filter" name="tag" size = "9" style="width:300px">
                        <xsl:for-each select="/tagger/body/tag">
                            <xsl:sort select="title"/>
                            <option><xsl:value-of select="name"/></option>
                        </xsl:for-each>
                    </select>                       
                                 
                    <li>num</li>
                    <input class="filter" name = "num" type = "number" value="1"/>
                    <li>mod</li>
                    <input class="filter" name = "num2" type = "number" value="0"/>
                    <li>len1</li>
                    <input class="filter" name = "length1" type = "number" value="100"/>
                    <li>len2</li>
                    <input class="filter" name = "length2" type = "number" value="500"/>
                    <li>occur</li>
                    <input class="filter" name = "occurrence" type = "number" value="1"/>
                </ul>    
                <input class="filter" type="submit" value = "dynamic tagging"/>    
            </form>    
        </div>
        <div class="clear"></div>
        <hr/>
        <br/>       
        <div class="con_module">
            <h3>Find the words in files in Source Directory for Copyright</h3>
            <form method="post" action="/book2/words_find" target="_blank">
                <input class="filter" name = "find" type = "text" value="input word"/><br/>
                <input class="filter" type="submit" value = "Find Words"/>
            </form>
        </div>
        <div class="con_module"/>
        
      </div>   
    </xsl:template>
</xsl:stylesheet>