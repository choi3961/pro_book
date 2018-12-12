<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes"/>
<xsl:include href="attribute_set.xsl"/>
<xsl:include href="underhood.xsl"/>
<xsl:include href="table.xsl"/>
<xsl:include href="picture.xsl"/>
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="KoPubBatang Medium">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="blank-page" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="blank-body"/>
                </fo:simple-page-master>    
            
                <!-- for 2 secret blank pages between chapters and front and back page -->
                <fo:simple-page-master master-name="blank-secret" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="blank-body"/>
                </fo:simple-page-master>                            
            
                <fo:simple-page-master master-name="first-page" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name = "first-before" xsl:use-attribute-sets= "region-before"/>
                </fo:simple-page-master>    

                <!-- for copyright page of second page -->
                <fo:simple-page-master master-name="second-page" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name = "second-before" xsl:use-attribute-sets= "region-before"/>
                </fo:simple-page-master>                    
                          
                <fo:simple-page-master master-name="front-1" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name = "front-before" xsl:use-attribute-sets= "region-before"/>
                </fo:simple-page-master> 
                   
                <fo:simple-page-master master-name="front-2" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>   
                    <fo:region-before region-name = "top-line" xsl:use-attribute-sets= "region-before"/><!--
                    <fo:region-after region-name="footer-odd" xsl:use-attribute-sets="region-after"/>
                    <fo:region-start xsl:use-attribute-sets="region-start"/>
                    <fo:region-end xsl:use-attribute-sets="region-end"/> -->
                </fo:simple-page-master>   
                 
                <fo:simple-page-master master-name="front-contents-table-r" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name = "head-contents-table-r" xsl:use-attribute-sets="region-before"/>  
                    <fo:region-start region-name="front-contents-table-start" xsl:use-attribute-sets="region-start"/> 
                    <fo:region-end region-name="front-contents-table-end" xsl:use-attribute-sets="region-end"/> 
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="front-contents-table-l" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name = "head-contents-table-l" xsl:use-attribute-sets="region-before"/>  
                    <fo:region-start region-name="front-contents-table-start" xsl:use-attribute-sets="region-start"/>
                    <fo:region-end region-name="front-contents-table-end" xsl:use-attribute-sets="region-end"/> 
                </fo:simple-page-master>   
                                
                <fo:simple-page-master master-name="body-chapter" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before xsl:use-attribute-sets="region-before"/> 
                </fo:simple-page-master>   
                                                                     
                <fo:simple-page-master master-name="right" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name="header-odd" xsl:use-attribute-sets="region-before"/>
                    <fo:region-after region-name="footer-odd" xsl:use-attribute-sets="region-after"/>
                    <fo:region-start xsl:use-attribute-sets="region-start"/>
                    <fo:region-end xsl:use-attribute-sets="region-end"/>
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="left"  xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name="header-even" xsl:use-attribute-sets="region-before"/>
                    <fo:region-after region-name="footer-even" xsl:use-attribute-sets="region-after"/>
                    <fo:region-start xsl:use-attribute-sets="region-start"/>
                    <fo:region-end xsl:use-attribute-sets="region-end"/>   
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="back-matter-r"  xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name="back-matter-before-r" xsl:use-attribute-sets="region-before"/>
                    <fo:region-after region-name="back-matter-after-r" xsl:use-attribute-sets="region-before"/> 
                </fo:simple-page-master>   
                 
                <fo:simple-page-master master-name="back-matter-l"  xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before region-name="back-matter-before-l" xsl:use-attribute-sets="region-before"/>
                    <fo:region-after region-name="back-matter-after-l" xsl:use-attribute-sets="region-before"/>          
                </fo:simple-page-master>                                 
                
                <fo:simple-page-master master-name="last-page" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>        
                </fo:simple-page-master>                                                    

                <!-- for first 2 pages; book title and colophon-->                  
                <fo:page-sequence-master master-name="alternating-title-and-colophon"> 
                    <fo:single-page-master-reference master-reference="first-page"/>
                    <fo:single-page-master-reference master-reference="first-page"/>
                </fo:page-sequence-master>                  
                                
                <!-- for front part after first 2 pages(title and colophon); Preface and Introduction part-->                  
                <fo:page-sequence-master master-name="alternating-front-first"> 
                    <fo:repeatable-page-master-alternatives maximum-repeats="no-limit">     
                        <fo:conditional-page-master-reference master-reference="blank-page" blank-or-not-blank="blank" />                
                        <fo:conditional-page-master-reference master-reference="right" odd-or-even="odd" />
                        <fo:conditional-page-master-reference master-reference="left" odd-or-even="even" /> 
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>  
                
                <!-- for front part for contents table part -->                  
                <fo:page-sequence-master master-name="alternating-front">   
                    <fo:repeatable-page-master-alternatives maximum-repeats="no-limit">
                        <fo:conditional-page-master-reference master-reference="blank-page" blank-or-not-blank="blank" />
                        <fo:conditional-page-master-reference master-reference="right" odd-or-even="odd" />
                        <fo:conditional-page-master-reference master-reference="left" odd-or-even="even" />         
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>          
                                       
                <!-- for body part -->                  
                <fo:page-sequence-master master-name="alternating">   
                    <fo:repeatable-page-master-reference  master-reference = "body-chapter" maximum-repeats="2"/>
                    <fo:repeatable-page-master-alternatives maximum-repeats="no-limit">
                        <fo:conditional-page-master-reference master-reference="blank-page" blank-or-not-blank="blank" />
                        <fo:conditional-page-master-reference master-reference="right" odd-or-even="odd" />
                        <fo:conditional-page-master-reference master-reference="left" odd-or-even="even" />
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>

                <!-- start of back matter -->                
                <fo:page-sequence-master master-name="alternating-back">
                    <fo:repeatable-page-master-alternatives maximum-repeats="no-limit">
                        <!-- <fo:conditional-page-master-reference master-reference="last-page" page-position = "last" /> -->
                        <fo:conditional-page-master-reference master-reference="blank-page" blank-or-not-blank="blank" />     
                        <fo:conditional-page-master-reference master-reference="back-matter-r" odd-or-even="odd" />
                        <fo:conditional-page-master-reference master-reference="back-matter-l" odd-or-even="even" />                                         
                    </fo:repeatable-page-master-alternatives>        
                </fo:page-sequence-master>   
                 <!-- end of back matter -->  
            </fo:layout-master-set>
                       
<!--    ===================================     Mapping      ======================================  -->
            <!-- for 2 secret blank pages between chapters and front and back page -->
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence> 
            <!-- for 2 secret blank pages between chapters and front and back page -->
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>                       

            <!-- front page mapping for the first page -->
            <fo:page-sequence master-reference="first-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container"> 
                        <fo:block>   
                            <xsl:apply-templates select="book/front/title_page"/>
                        </fo:block>    
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>
            
            <!-- front page mapping for the second page; colophon -->            
            <fo:page-sequence master-reference="first-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container"> 
                        <fo:block>
                            <xsl:apply-templates select="book/front/colophon"/>
                        </fo:block>        
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>            

            <!-- front page mapping for preface and introduction -->
            <fo:page-sequence master-reference="alternating-front-first" force-page-count="end-on-even" initial-page-number="1" format="i">    
                <fo:static-content flow-name="header-odd">
                  <fo:block xsl:use-attribute-sets="first-before">First</fo:block>
                </fo:static-content>
                <fo:static-content flow-name="header-even">
                  <fo:block xsl:use-attribute-sets="first-before">First</fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="second-before">		<!--  for copyright page of second page -->
                  <fo:block xsl:use-attribute-sets="first-before">First</fo:block>
                </fo:static-content>                  
                <fo:static-content flow-name="xsl-region-start">
                    <fo:block xsl:use-attribute-sets="c-region-start">
                        <xsl:value-of select="'s'"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-end">
                    <fo:block xsl:use-attribute-sets="c-region-end">
                        <fo:basic-link internal-destination="toc">
                            <xsl:value-of select="'s'"/>
                        </fo:basic-link>                    
                    </fo:block>
                </fo:static-content>                                             
                <fo:static-content flow-name="footer-odd">
                    <fo:block xsl:use-attribute-sets="c-region-after-r">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-r-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>
                <fo:static-content flow-name="footer-even">
                    <fo:block xsl:use-attribute-sets="c-region-after-l">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-l-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>                                   
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container">        
                        <xsl:apply-templates select="book/front"/>
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>
            
            <!-- contents table mapping -->
            <fo:page-sequence master-reference="alternating-front" force-page-count="end-on-even" format="i">   
      
                <fo:static-content flow-name="header-odd">
                  <fo:block xsl:use-attribute-sets="c-region-before-r">
                      <fo:block xsl:use-attribute-sets="special-block-r">Contents</fo:block>
                  </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="header-even">
                  <fo:block xsl:use-attribute-sets="c-region-before-l">
                      <fo:block xsl:use-attribute-sets="special-block-l">Contents</fo:block>
                  </fo:block>
                </fo:static-content>    

                <fo:static-content flow-name="xsl-region-start">
                    <fo:block xsl:use-attribute-sets="c-region-start">
                        <xsl:value-of select="'s'"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-end">
                    <fo:block xsl:use-attribute-sets="c-region-end">
                        <fo:basic-link internal-destination="toc">
                            <xsl:value-of select="'s'"/>
                        </fo:basic-link>                    
                    </fo:block>
                </fo:static-content>                                     
               
                <fo:static-content flow-name="footer-odd">
                    <fo:block xsl:use-attribute-sets="c-region-after-r">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-r-2"><fo:page-number/></fo:block> 
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="footer-even">               <!-- Weird.....another block doesn't work -->
                  <fo:block xsl:use-attribute-sets="c-region-after-l">
                      <fo:block xsl:use-attribute-sets="special-block-l-2"><fo:page-number/></fo:block> 
                  </fo:block>
                </fo:static-content>                                                             
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container">        
                        <xsl:apply-templates select="book/body"/>
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>             
            
            <!--    =======  body page mapping  ==========    -->
            <!-- Chapter 1 mapping  -->
            <!-- for 2 secret blank pages between chapters and front and back page -->
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>  
                        
            <fo:page-sequence master-reference="alternating" initial-page-number="1" force-page-count="end-on-even"> 
                <fo:static-content flow-name="xsl-region-start">
                    <fo:block xsl:use-attribute-sets="c-region-start">
                        <xsl:value-of select="'s'"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-end">
                    <fo:block xsl:use-attribute-sets="c-region-end">
                        <fo:basic-link internal-destination="toc">
                            <xsl:value-of select="'s'"/>
                        </fo:basic-link>                    
                    </fo:block>
                </fo:static-content>                
                <fo:static-content flow-name="header-odd">
                    <fo:block xsl:use-attribute-sets="c-region-before-r">  
                        <fo:block xsl:use-attribute-sets="special-block-r"> <!-- for region before title -->
                       : <fo:retrieve-marker retrieve-class-name="happy" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/>  
                        </fo:block> 
                    </fo:block>
                </fo:static-content>  
                <fo:static-content flow-name="header-even">
                    <fo:block xsl:use-attribute-sets="c-region-before-l"> 
                        <fo:block xsl:use-attribute-sets="special-block-l">   
                          <fo:inline xsl:use-attribute-sets="special-block-l-co">:</fo:inline> 
                          <fo:retrieve-marker retrieve-class-name="chapter" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/> 
                        </fo:block> 
                    </fo:block>
                </fo:static-content>                 
                <fo:static-content flow-name="footer-odd">
                    <fo:block xsl:use-attribute-sets="c-region-after-r">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-r-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>
                <fo:static-content flow-name="footer-even">
                    <fo:block xsl:use-attribute-sets="c-region-after-l">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-l-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>            
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container">        
                        <xsl:apply-templates select="book/body/item[position() &lt; 10]"/>
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>                        
            



            <!-- Chapter 2 mapping  -->
            <!-- for 2 secret blank pages between chapters and front and back page -->
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>  
                        
            <fo:page-sequence master-reference="alternating" force-page-count="end-on-even"> 
                <fo:static-content flow-name="xsl-region-start">
                    <fo:block xsl:use-attribute-sets="c-region-start">
                        <xsl:value-of select="'s'"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-end">
                    <fo:block xsl:use-attribute-sets="c-region-end">
                        <fo:basic-link internal-destination="toc">
                            <xsl:value-of select="'s'"/>
                        </fo:basic-link>                    
                    </fo:block>
                </fo:static-content>                
                <fo:static-content flow-name="header-odd">
                    <fo:block xsl:use-attribute-sets="c-region-before-r">  
                        <fo:block xsl:use-attribute-sets="special-block-r"> <!-- for region before title -->
                       : <fo:retrieve-marker retrieve-class-name="happy" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/>  
                        </fo:block> 
                    </fo:block>
                </fo:static-content>  
                <fo:static-content flow-name="header-even">
                    <fo:block xsl:use-attribute-sets="c-region-before-l"> 
                        <fo:block xsl:use-attribute-sets="special-block-l">   
                          <fo:inline xsl:use-attribute-sets="special-block-l-co">:</fo:inline> 
                          <fo:retrieve-marker retrieve-class-name="chapter" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/> 
                        </fo:block> 
                    </fo:block>
                </fo:static-content>                 
                <fo:static-content flow-name="footer-odd">
                    <fo:block xsl:use-attribute-sets="c-region-after-r">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-r-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>
                <fo:static-content flow-name="footer-even">
                    <fo:block xsl:use-attribute-sets="c-region-after-l">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-l-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>            
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container">        
                        <xsl:apply-templates select="book/body/item[position() &gt; 9 and position() &lt; 22]"/>
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>                        
            




            <!-- Chapter 3 mapping  -->
            <!-- for 2 secret blank pages between chapters and front and back page -->
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>  
                        
            <fo:page-sequence master-reference="alternating" force-page-count="end-on-even"> 
                <fo:static-content flow-name="xsl-region-start">
                    <fo:block xsl:use-attribute-sets="c-region-start">
                        <xsl:value-of select="'s'"/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-end">
                    <fo:block xsl:use-attribute-sets="c-region-end">
                        <fo:basic-link internal-destination="toc">
                            <xsl:value-of select="'s'"/>
                        </fo:basic-link>                    
                    </fo:block>
                </fo:static-content>                
                <fo:static-content flow-name="header-odd">
                    <fo:block xsl:use-attribute-sets="c-region-before-r">  
                        <fo:block xsl:use-attribute-sets="special-block-r"> <!-- for region before title -->
                       : <fo:retrieve-marker retrieve-class-name="happy" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/>  
                        </fo:block> 
                    </fo:block>
                </fo:static-content>  
                <fo:static-content flow-name="header-even">
                    <fo:block xsl:use-attribute-sets="c-region-before-l"> 
                        <fo:block xsl:use-attribute-sets="special-block-l">   
                          <fo:inline xsl:use-attribute-sets="special-block-l-co">:</fo:inline> 
                          <fo:retrieve-marker retrieve-class-name="chapter" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/> 
                        </fo:block> 
                    </fo:block>
                </fo:static-content>                 
                <fo:static-content flow-name="footer-odd">
                    <fo:block xsl:use-attribute-sets="c-region-after-r">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-r-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>
                <fo:static-content flow-name="footer-even">
                    <fo:block xsl:use-attribute-sets="c-region-after-l">  <!-- another block works -->
                      <fo:block xsl:use-attribute-sets="special-block-l-2"><fo:page-number/></fo:block> 
                    </fo:block>                
                  
                </fo:static-content>            
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container">        
                        <xsl:apply-templates select="book/body/item[position() &gt; 21 and position() &lt; 27]"/>
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>                        
            
            <!-- back matter mapping  -->
            <fo:page-sequence master-reference="alternating-back" > 
                <fo:static-content flow-name="back-matter-before-r">
                    <fo:block xsl:use-attribute-sets="c-region-before-r">
                        <fo:block xsl:use-attribute-sets="backmatter-before-r">Translation</fo:block>
                    </fo:block>
                </fo:static-content>      
                <fo:static-content flow-name="back-matter-before-l">
                    <fo:block xsl:use-attribute-sets="c-region-before-l">
                        <fo:block xsl:use-attribute-sets="backmatter-before-l">Translation</fo:block>
                    </fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="back-matter-after-r">
                  <fo:block xsl:use-attribute-sets="backmatter-after-r"><fo:page-number/></fo:block>
                </fo:static-content>      
                <fo:static-content flow-name="back-matter-after-l">
                  <fo:block xsl:use-attribute-sets="backmatter-after-l"><fo:page-number/></fo:block>
                </fo:static-content> 
                                                            
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block-container xsl:use-attribute-sets="container">        
                        <xsl:apply-templates select="book/back/answers"/>
                    </fo:block-container>  
                </fo:flow>
            </fo:page-sequence>     
            <!-- for 2 secret blank pages between chapters and front and back page -->
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>  
            <!-- for 2 secret blank pages between chapters and front and back page -->
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="blank-secret">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="blank-secret">Hello </fo:block>   
                </fo:flow>
            </fo:page-sequence>            
     
        </fo:root>
    </xsl:template>       
</xsl:stylesheet >