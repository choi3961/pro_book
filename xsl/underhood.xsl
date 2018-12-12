<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<!-- start of book2 -->
    <xsl:template match="book">
        <xsl:apply-templates select="front"/>
        <xsl:apply-templates select="body"/>
        <xsl:apply-templates select="back"/>
    </xsl:template>
    
<!-- for front colophon copyright symbol -->    
    <xsl:template match="colophon">
        <fo:block xsl:use-attribute-sets="back-1">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
<!-- start of front matter -->
    <xsl:template match="front">
        <fo:block break-before="page"/>
        <xsl:apply-templates select="." mode="preface"/>
        <fo:block break-before="page"/>
        <xsl:apply-templates select="." mode="introduction"/>
    </xsl:template>
    
<!-- Presents the tables of body. -->
    <xsl:template match="body">
        <fo:block break-before="page"/>
        <xsl:apply-templates select="/" mode="TOC"/>
        <!-- 
        <fo:block break-before="page"/>
        <xsl:apply-templates select="/" mode="main"/>
         -->
    </xsl:template>
<!-- start of back matter -->    
    <xsl:template match="back">
        <fo:block break-before="page"/>                     
        <xsl:apply-templates select="/" mode="answers"/>    
        <fo:block break-before="page"/>                     
        <xsl:apply-templates select="/" mode="back_1"/>
        <!-- 
        <fo:block break-before="page"/>
        <xsl:apply-templates select="/" mode="back_2"/>
        <fo:block break-before="page"/>
        <xsl:apply-templates select="/" mode="back_3"/>   
         -->
    </xsl:template>        

<!-- start of front matter -->
    <xsl:template match="title_page">
        <fo:block xsl:use-attribute-sets="title-1">
            영어가 길어지는 10가지 이유
        </fo:block>
        
        <fo:block xsl:use-attribute-sets="title-mid">
          Getting longer and longer
        </fo:block>        

        <fo:block xsl:use-attribute-sets="author-name">
            David Choi
        </fo:block>           
        <fo:block xsl:use-attribute-sets="company-name">
            유 니 버 스 출 판
        </fo:block>                
    </xsl:template>
  
    <xsl:template match="front" mode="preface">
        <fo:block  xsl:use-attribute-sets="head">머 리 말</fo:block>
        <xsl:apply-templates select="preface"/>   
    </xsl:template>
    <xsl:template match="front" mode="introduction">
        <fo:block xsl:use-attribute-sets="head">
            Introduction
        </fo:block>  
        <xsl:apply-templates select="introduction"/>     
    </xsl:template>

    <!-- Presents the tables of body. -->
    <xsl:template match="body" mode="TOC">
        <fo:block xsl:use-attribute-sets="toc-title" id="toc">
            The contents of the book
        </fo:block>
       
        <xsl:for-each select="item">
        <xsl:variable name="item" select="position()"/>
            <xsl:choose>
                <xsl:when test="style/chapter">
                    <fo:block  xsl:use-attribute-sets="toc-chapter">
                        <fo:basic-link internal-destination="{generate-id()}">
                            <xsl:value-of select="title"></xsl:value-of>
                        </fo:basic-link>                        
                    </fo:block>
                </xsl:when>
                
                <!-- when item position is greater than 23, to say from Gerund -->
                <!-- The sub-structures of Chapter 1, 2, 3 and Chapter 4, 5 are different. So Different evaluation order is needed -->
                <xsl:when test="$item &gt; 1 and $item &lt; 22 ">
                    <fo:block xsl:use-attribute-sets="first-page">	<!-- The first page of each item -->
                        <fo:basic-link internal-destination="{generate-id()}">
                            <xsl:value-of select="title"/>
                            <fo:leader leader-pattern="dots"/><fo:page-number-citation ref-id="{generate-id()}"/>
                        </fo:basic-link>
                    </fo:block>
                    
                    <xsl:for-each select="contents/page">
                        <xsl:variable name="page2_pos" select="position()"/>
                        <xsl:choose>
                            <xsl:when test="$page2_pos &lt; 7">
                                <fo:block  xsl:use-attribute-sets="toc">
                                    <fo:basic-link internal-destination="{generate-id()}">
                                        <xsl:value-of select="../../title"/>_<fo:inline xsl:use-attribute-sets="toc-sub"><xsl:value-of select="title15"/></fo:inline>
                                        <fo:leader leader-pattern="dots"/><fo:page-number-citation ref-id="{generate-id()}"/>
                                    </fo:basic-link>
                                </fo:block>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:block  xsl:use-attribute-sets="toc">
                                    <fo:basic-link internal-destination="{generate-id()}">
                                        <xsl:value-of select="../../title"/>_<fo:inline xsl:use-attribute-sets="toc-sub"><xsl:value-of select="p1"/></fo:inline>
                                        <fo:leader leader-pattern="dots"/><fo:page-number-citation ref-id="{generate-id()}"/>
                                    </fo:basic-link>
                                </fo:block>                                   
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>    
                <xsl:otherwise>
                    <fo:block xsl:use-attribute-sets="first-page">	<!-- The first page of each item -->
                        <fo:basic-link internal-destination="{generate-id()}">
                            <xsl:value-of select="title"/>
                            <fo:leader leader-pattern="dots"/><fo:page-number-citation ref-id="{generate-id()}"/>
                        </fo:basic-link>
                    </fo:block>                
                    <xsl:for-each select="contents/page">
                        <xsl:variable name="page2_pos" select="position()"/>
                        <xsl:choose>
                            <xsl:when test="$page2_pos &lt; 3">
                                <fo:block  xsl:use-attribute-sets="toc">
                                    <fo:basic-link internal-destination="{generate-id()}">
                                        <xsl:value-of select="../../title"/>_<fo:inline xsl:use-attribute-sets="toc-sub"><xsl:value-of select="title15"/></fo:inline>
                                        <fo:leader leader-pattern="dots"/><fo:page-number-citation ref-id="{generate-id()}"/>
                                    </fo:basic-link>
                                </fo:block>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:block  xsl:use-attribute-sets="toc">
                                    <fo:basic-link internal-destination="{generate-id()}">
                                        <xsl:value-of select="../../title"/>_<fo:inline xsl:use-attribute-sets="toc-sub"><xsl:value-of select="p1"/></fo:inline>
                                        <fo:leader leader-pattern="dots"/><fo:page-number-citation ref-id="{generate-id()}"/>
                                    </fo:basic-link>
                                </fo:block>                                   
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
        
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
<!-- end of front matter -->


 
<!-- Presents the contents of body matter. deprecated -->    
    <xsl:template match="body" mode="main">
        <xsl:apply-templates/>
    </xsl:template>
       
<!-- start of back matter -->    
    <xsl:template match="back" mode="answers">
        <fo:block xsl:use-attribute-sets="title-2">
         Translation Part
        </fo:block>
        <fo:block>
            <xsl:apply-templates select="answers"/>
        </fo:block>        
    </xsl:template>
    <xsl:template match="back" mode="back_1">
        <fo:block xsl:use-attribute-sets="back-1">
            <xsl:apply-templates select="epilogue"/>
        </fo:block>        
    </xsl:template>
    <xsl:template match="back" mode="back_2">
        <fo:block xsl:use-attribute-sets="title-2">
        This is the back matter 2 Conclusion
        </fo:block>
        <fo:block>
            <xsl:value-of select="conclusion"/>
        </fo:block>             
    </xsl:template>
    <xsl:template match="back" mode="back_3">
        <fo:block xsl:use-attribute-sets="title-2">
        This is the back matter 3
        </fo:block>
    </xsl:template>
 
    <xsl:template match="chap"  >
        <fo:block xsl:use-attribute-sets="chap">
            <xsl:apply-templates/>
        </fo:block>   
    </xsl:template>    

    <xsl:template match="item"  >
        <fo:block xsl:use-attribute-sets="item"  id="{generate-id()}">
            <xsl:apply-templates/>
        </fo:block>   
    </xsl:template>

    <xsl:template match="style">
    </xsl:template>

    <xsl:template match="title">
        <xsl:choose>
            <xsl:when test="../style/chapter">
                <fo:block xsl:use-attribute-sets="title-2">
                   <fo:marker marker-class-name="chapter">
                       <xsl:value-of select = "."/>
                   </fo:marker>                      
                   <xsl:apply-templates/>
                </fo:block>             
            </xsl:when>
            <xsl:otherwise>
                <fo:block xsl:use-attribute-sets="title-3">
                       <fo:marker marker-class-name="happy">
                           <xsl:value-of select = "."/>
                       </fo:marker>              
                    <xsl:apply-templates/>
                </fo:block>                 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="contents">
        <fo:block  xsl:use-attribute-sets="contents">
            <xsl:apply-templates/>
        </fo:block>        
    </xsl:template>

    <xsl:template match="table_header">
        <fo:block  xsl:use-attribute-sets="table_header">
            <xsl:value-of select="."/>
        </fo:block>        
    </xsl:template>
   
    <xsl:template match="con_header">
        <fo:block  xsl:use-attribute-sets="con_header">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template> 
    <xsl:template match="con_header_trans">

    </xsl:template>
    
    <xsl:template match="t">
        
    </xsl:template>

    <xsl:template match="metaphor">
        <fo:block  xsl:use-attribute-sets="metaphor">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>  
    
    <xsl:template match="page">
        <fo:block xsl:use-attribute-sets="page"  id="{generate-id()}">
            <xsl:apply-templates/>
        </fo:block>      

    </xsl:template> 

    <xsl:template match="title2">
        <fo:block xsl:use-attribute-sets="title-4">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>     

    <xsl:template match="title15">
        <fo:block xsl:use-attribute-sets="title-15">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>         

    <xsl:template match="trans">
        <fo:block xsl:use-attribute-sets="trans">
        <!-- Translation  -->
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>     
    <xsl:template match="explain">
    <!-- explain metaphor and idioms  -->
        <fo:block xsl:use-attribute-sets="explain">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>    
    <xsl:template match="reserve">
    
    </xsl:template>
    
    <xsl:template match="p">
        <fo:block xsl:use-attribute-sets="p">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   
    <xsl:template match="bold">
        <fo:inline xsl:use-attribute-sets="bold">
            <xsl:value-of select="."/>
        </fo:inline>     
    </xsl:template>
    
    <xsl:template match="e_chap">
        <fo:block xsl:use-attribute-sets="e_chap">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>    
        
    <xsl:template match="e_chap2">
        <fo:block xsl:use-attribute-sets="e_chap2">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>
    
    <xsl:template match="tips">
        <fo:block xsl:use-attribute-sets="tips">
            <xsl:apply-templates/>
        </fo:block>            
        
    </xsl:template>

    <xsl:template match="tip">
       
        <fo:block xsl:use-attribute-sets="tip">
            <xsl:apply-templates/>
        </fo:block>            
        
    </xsl:template>  
      
    <xsl:template match="level11">
        <fo:block xsl:use-attribute-sets="temp">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>
    <xsl:template match="level21">
        <fo:block xsl:use-attribute-sets="temp">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>
    <xsl:template match="level31">
        <fo:block xsl:use-attribute-sets="temp">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>
    <xsl:template match="level32">
        <fo:block xsl:use-attribute-sets="temp">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>
    <!-- 

    <xsl:template match="short">
        <fo:block-container xsl:use-attribute-sets="short">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>            
        </fo:block-container>     
    </xsl:template>
     -->
    <xsl:template match="sen">
        <fo:block xsl:use-attribute-sets="sen">
            <xsl:apply-templates/>
        </fo:block>         
    </xsl:template>

    <xsl:template match="p1">
        <fo:block xsl:use-attribute-sets="p1">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template> 

    <xsl:template match="p2">
        <fo:block xsl:use-attribute-sets="p2">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>              
    <xsl:template match="p3">
        <fo:block xsl:use-attribute-sets="p_odd">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>              
    <xsl:template match="p4">
        <fo:block xsl:use-attribute-sets="p_even">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>                                           
    <xsl:template match="p_odd">
        <fo:block xsl:use-attribute-sets="p_odd">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>
    <xsl:template match="p_even">
        <fo:block xsl:use-attribute-sets="p_even">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>
    <xsl:template match="long">
        <fo:block xsl:use-attribute-sets="long">
            <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>    

    <xsl:template match="p1t">
        <fo:block xsl:use-attribute-sets="pt">
            1) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p2t">
        <fo:block xsl:use-attribute-sets="pt">
            2) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p3t">
        <fo:block xsl:use-attribute-sets="pt">
            3) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p4t">
        <fo:block xsl:use-attribute-sets="pt">
            4) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p5t">
        <fo:block xsl:use-attribute-sets="pt">
            5) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p6t">
        <fo:block xsl:use-attribute-sets="pt">
            6) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p7t">
        <fo:block xsl:use-attribute-sets="pt">
            7) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p8t">
        <fo:block xsl:use-attribute-sets="pt">
            8) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p9t">
        <fo:block xsl:use-attribute-sets="pt">
            9) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p10t">
        <fo:block xsl:use-attribute-sets="pt">
            10) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p11t">
        <fo:block xsl:use-attribute-sets="pt">
            11) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p12t">
        <fo:block xsl:use-attribute-sets="pt">
            12) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p13t">
        <fo:block xsl:use-attribute-sets="pt">
            13) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p14t">
        <fo:block xsl:use-attribute-sets="pt">
            14) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="p15t">
        <fo:block xsl:use-attribute-sets="pt">
            15) <xsl:apply-templates/>
        </fo:block>     
    </xsl:template>   

    <xsl:template match="quote">
        <fo:inline xsl:use-attribute-sets="quote">
            '<xsl:apply-templates/>'
        </fo:inline>     
    </xsl:template>   
    
    <xsl:template match="between_para">
        <fo:block xsl:use-attribute-sets="between_para">
            between_para
        </fo:block> 
    </xsl:template>      

    <xsl:template match="indent_1">
        <fo:block xsl:use-attribute-sets="indent_1">
            <xsl:apply-templates/>
        </fo:block> 
    </xsl:template> 
     
    <!-- for the mid title -->
    <xsl:template match="mid_t">
        <fo:block xsl:use-attribute-sets="mid_t">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>    
    <!-- for the mid title -->
    <xsl:template match="mid_t2">
        <fo:block xsl:use-attribute-sets="mid_t2">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>    
    
    <!-- to make space in (Adverbial Clause)  -->
    <xsl:template match="space">
        <fo:block xsl:use-attribute-sets="space">
        </fo:block> 
    </xsl:template> 
    
    <!-- to make space in (Adverbial Clause)  -->
    <xsl:template match="space2">
        <fo:block xsl:use-attribute-sets="space2">
        </fo:block> 
    </xsl:template>        
    
    <!-- for the mid title -->
    <xsl:template match="space-1">
        <fo:block xsl:use-attribute-sets="space-1">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>      

    <!-- for the mid title -->
    <xsl:template match="space-2">
        <fo:block xsl:use-attribute-sets="space-2">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>  
    
    <!-- for the mid title -->
    <xsl:template match="space-3">
        <fo:block xsl:use-attribute-sets="space-3">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>      

    <!-- for the mid title -->
    <xsl:template match="space-4">
        <fo:block xsl:use-attribute-sets="space-4">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>    
    <!-- for the mid title -->
    <xsl:template match="space-5">
        <fo:block xsl:use-attribute-sets="space-5">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>      

    <!-- for the mid title -->
    <xsl:template match="space-6">
        <fo:block xsl:use-attribute-sets="space-6">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>      
    
    <!-- for the space of con_header sentences -->
    <xsl:template match="header_sen">
        <fo:block xsl:use-attribute-sets="space-5">
        <xsl:value-of select="."/>
        </fo:block> 
    </xsl:template>          
    
    <!-- for the copyright page's copy symbol -->
    <xsl:template match="space-copy">
        <fo:block xsl:use-attribute-sets="space-copy">
        <xsl:value-of select="'Copyright &#169; 2018 '"/><fo:inline xsl:use-attribute-sets="copy-company-name">유니버스 출판 All rights reserved.</fo:inline>
        </fo:block> 
    </xsl:template>                       
            
    <xsl:template match="answers">
        <xsl:for-each select="/book/body/item">
            <xsl:variable name="item_pos" select="position()"/>
            <xsl:choose>
                <xsl:when test="style/chapter">
                    <fo:block></fo:block>
                </xsl:when>
                <xsl:otherwise>
                    <fo:block xsl:use-attribute-sets="answers_title"><xsl:value-of select="title"/></fo:block>
                    
            <!-- Weird... Do nothing. This is for con_header_trans
                    <for-each select="contents/con_header_trans/p">
                        <xsl:variable name="pp" select="position()"/>
                        <fo:block><xsl:value-of select="$pp"></xsl:value-of></fo:block>
                    </for-each>   
             -->   
                          
             <!-- This works    --> 
                      <xsl:choose>
                            <xsl:when test ="$item_pos &gt; 1 and $item_pos &lt; 22">
                                  <!-- <fo:block  xsl:use-attribute-sets="trans-title"><xsl:value-of select = "title"></xsl:value-of></fo:block>   -->
                                  <xsl:for-each select ="contents/con_header_trans/p">
                                      <xsl:variable name="p" select="position()"/>
                                      <fo:block xsl:use-attribute-sets="trans">
                                      
                                      0-<xsl:value-of select ="$p"/><xsl:value-of select="') '"/><xsl:value-of select ="."/>
                                      
                                      </fo:block>
                                  </xsl:for-each>                  
                                  <!-- This works    -->
                                  <xsl:for-each select="contents/page">
                                      <xsl:variable name="page_pos" select="position()"/>
                                      <xsl:choose> 
                                          <xsl:when test="../../style/chapter">
                                              <fo:block></fo:block>
                                          </xsl:when>
                                          <xsl:when test="$page_pos = 1">
                                              <fo:block></fo:block>
                                          </xsl:when> 
                                          <xsl:when test="$page_pos = 3" >
                                              <fo:block></fo:block>
                                          </xsl:when>  
                                          
                                          <xsl:when test ="title15">
                                              <fo:block xsl:use-attribute-sets="trans-title"><xsl:value-of select="$page_pos"/><xsl:value-of select="'. '"/><xsl:value-of select="title15"/></fo:block>
                                              <xsl:for-each select="trans/t">
                                                  <xsl:variable name="t" select="position()"/>
                                                  <fo:block xsl:use-attribute-sets="trans">                    
                                                      <xsl:value-of select="$page_pos"/>-<xsl:value-of select="$t"/><xsl:value-of select="') '"/><xsl:value-of select="."/>
                                                  </fo:block>                       
                                              </xsl:for-each> 
                                          </xsl:when>
              
                                          <xsl:otherwise>
                                              <fo:block xsl:use-attribute-sets="trans-title"><xsl:value-of select="$page_pos"/><xsl:value-of select="'. '"/><xsl:value-of select="p1"/></fo:block>
                                              <xsl:for-each select="trans/t">
                                                  <xsl:variable name="t" select="position()"/>
                                                  <fo:block xsl:use-attribute-sets="trans">                    
                                                      <xsl:value-of select="$page_pos"/>-<xsl:value-of select="$t"/><xsl:value-of select="') '"/><xsl:value-of select="."/>
                                                  </fo:block>                       
                                              </xsl:for-each>                        
                                          </xsl:otherwise>   
                                      </xsl:choose>
                                  </xsl:for-each> 
                            </xsl:when>
                            <xsl:otherwise>  <!-- when item-page is 23 to 26    -->
                                 <!-- This works    -->
                                <xsl:for-each select="contents/page">
                                    <xsl:variable name="page_pos" select="position()"/>
                                    <xsl:choose> 
                                        <xsl:when test="../../style/chapter">
                                            <fo:block></fo:block>
                                        </xsl:when>
                                        <xsl:when test="$page_pos = 1">
                                            <fo:block></fo:block>
                                        </xsl:when> 
                                        <xsl:when test="$page_pos = 2" >
                                            <fo:block></fo:block>
                                        </xsl:when>  
                                        
                                        <xsl:when test ="title15">
                                            <fo:block xsl:use-attribute-sets="trans-title"><xsl:value-of select="$page_pos"/><xsl:value-of select="'. '"/><xsl:value-of select="title15"/></fo:block>
                                            <xsl:for-each select="trans/t">
                                                <xsl:variable name="t" select="position()"/>
                                                <fo:block xsl:use-attribute-sets="trans">                    
                                                    <xsl:value-of select="$page_pos"/>-<xsl:value-of select="$t"/><xsl:value-of select="') '"/><xsl:value-of select="."/>
                                                </fo:block>                       
                                            </xsl:for-each> 
                                        </xsl:when>
            
                                        <xsl:otherwise>
                                            <fo:block xsl:use-attribute-sets="trans-title"><xsl:value-of select="$page_pos"/><xsl:value-of select="'. '"/><xsl:value-of select="p1"/></fo:block>
                                            <xsl:for-each select="trans/t">
                                                <xsl:variable name="t" select="position()"/>
                                                <fo:block xsl:use-attribute-sets="trans">                    
                                                    <xsl:value-of select="$page_pos"/>-<xsl:value-of select="$t"/><xsl:value-of select="') '"/><xsl:value-of select="."/>
                                                </fo:block>                       
                                            </xsl:for-each>                        
                                        </xsl:otherwise>   
                                    </xsl:choose>
                                </xsl:for-each>                                
                            </xsl:otherwise>
                       </xsl:choose>
             
                  
                </xsl:otherwise>   
            </xsl:choose>
        </xsl:for-each>   
    </xsl:template>      
</xsl:stylesheet>


