<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns:fox="http://xmlgraphics.apache.org/fop/extensions">

<xsl:output method="xml" version="1.0" indent="yes"/>
<xsl:include href="../static/xsl/fiction_attribute.xsl"/>
<xsl:include href="fiction_underhood.xsl"/>

<xsl:template match = '/'>
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="KoPubBatang Medium">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="general-page" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body"/>
                    <fo:region-before xsl:use-attribute-sets="region-before"/>
                    <fo:region-after xsl:use-attribute-sets="region-after"/>
                    <fo:region-start xsl:use-attribute-sets="region-start"/>
                    <fo:region-end xsl:use-attribute-sets="region-end"/>                    
                </fo:simple-page-master>    
                
                <fo:simple-page-master master-name="right-page" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="right-page-body"/>
                    <fo:region-before region-name = "right-page-before" xsl:use-attribute-sets="right-page-before"/>
                    <fo:region-after region-name = "right-page-after" xsl:use-attribute-sets="right-page-after"/>
                    <fo:region-start region-name = "right-page-start" xsl:use-attribute-sets="right-page-start"/>
                    <fo:region-end region-name = "right-page-end" xsl:use-attribute-sets="right-page-end"/>                             
                </fo:simple-page-master>
                
                <fo:simple-page-master master-name="left-page" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="left-page-body"/>
                    <fo:region-before region-name = "left-page-before" xsl:use-attribute-sets="left-page-before"/>
                    <fo:region-after region-name = "left-page-after" xsl:use-attribute-sets="left-page-after"/>
                    <fo:region-start region-name = "left-page-start" xsl:use-attribute-sets="left-page-start"/>
                    <fo:region-end region-name = "left-page-end" xsl:use-attribute-sets="left-page-end"/>                             
                </fo:simple-page-master>                                         

                <!-- for body master part -->                  
                <fo:page-sequence-master master-name="alternating">   
                    <fo:repeatable-page-master-alternatives maximum-repeats="no-limit">
                        <fo:conditional-page-master-reference master-reference="right-page" odd-or-even="odd" />
                        <fo:conditional-page-master-reference master-reference="left-page" odd-or-even="even" />
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>                                
            </fo:layout-master-set>
                       
<!--    ===================================     Mapping      ======================================  -->
            <!-- for front part -->
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
                        <xsl:apply-templates select="book/front"/>
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>

            <!-- for body part -->

            
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
                    
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>          
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">

                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>                         
            <fo:page-sequence master-reference="alternating">
                <fo:static-content flow-name="right-page-before">
                    <fo:block xsl:use-attribute-sets="right-page-before02">
                    : <fo:retrieve-marker retrieve-class-name="happy" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/>
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="right-page-after">
                    <fo:block xsl:use-attribute-sets="right-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="right-page-start">
                    <fo:block xsl:use-attribute-sets="right-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="right-page-end">
                    <fo:block xsl:use-attribute-sets="right-page-end02"></fo:block>
                </fo:static-content> 
                
                <fo:static-content flow-name="left-page-before">
                    <fo:block xsl:use-attribute-sets="left-page-before02">
                       : <fo:retrieve-marker retrieve-class-name="chapter" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/> 
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="left-page-after">
                    <fo:block xsl:use-attribute-sets="left-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="left-page-start">
                    <fo:block xsl:use-attribute-sets="left-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="left-page-end">
                    <fo:block xsl:use-attribute-sets="left-page-end02"></fo:block>
                </fo:static-content> 

              
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
<xsl:apply-templates select='book/body/item[position() &gt; 0 and position() &lt; 3 ]'/>
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
                    
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>          
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">

                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>                         
            <fo:page-sequence master-reference="alternating">
                <fo:static-content flow-name="right-page-before">
                    <fo:block xsl:use-attribute-sets="right-page-before02">
                    : <fo:retrieve-marker retrieve-class-name="happy" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/>
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="right-page-after">
                    <fo:block xsl:use-attribute-sets="right-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="right-page-start">
                    <fo:block xsl:use-attribute-sets="right-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="right-page-end">
                    <fo:block xsl:use-attribute-sets="right-page-end02"></fo:block>
                </fo:static-content> 
                
                <fo:static-content flow-name="left-page-before">
                    <fo:block xsl:use-attribute-sets="left-page-before02">
                       : <fo:retrieve-marker retrieve-class-name="chapter" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/> 
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="left-page-after">
                    <fo:block xsl:use-attribute-sets="left-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="left-page-start">
                    <fo:block xsl:use-attribute-sets="left-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="left-page-end">
                    <fo:block xsl:use-attribute-sets="left-page-end02"></fo:block>
                </fo:static-content> 

              
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
<xsl:apply-templates select='book/body/item[position() &gt; 2 and position() &lt; 10 ]'/>
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
                    
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>          
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">

                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>                         
            <fo:page-sequence master-reference="alternating">
                <fo:static-content flow-name="right-page-before">
                    <fo:block xsl:use-attribute-sets="right-page-before02">
                    : <fo:retrieve-marker retrieve-class-name="happy" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/>
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="right-page-after">
                    <fo:block xsl:use-attribute-sets="right-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="right-page-start">
                    <fo:block xsl:use-attribute-sets="right-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="right-page-end">
                    <fo:block xsl:use-attribute-sets="right-page-end02"></fo:block>
                </fo:static-content> 
                
                <fo:static-content flow-name="left-page-before">
                    <fo:block xsl:use-attribute-sets="left-page-before02">
                       : <fo:retrieve-marker retrieve-class-name="chapter" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/> 
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="left-page-after">
                    <fo:block xsl:use-attribute-sets="left-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="left-page-start">
                    <fo:block xsl:use-attribute-sets="left-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="left-page-end">
                    <fo:block xsl:use-attribute-sets="left-page-end02"></fo:block>
                </fo:static-content> 

              
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
<xsl:apply-templates select='book/body/item[position() &gt; 9 and position() &lt; 20 ]'/>
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
                    
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>          
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">

                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>                         
            <fo:page-sequence master-reference="alternating">
                <fo:static-content flow-name="right-page-before">
                    <fo:block xsl:use-attribute-sets="right-page-before02">
                    : <fo:retrieve-marker retrieve-class-name="happy" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/>
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="right-page-after">
                    <fo:block xsl:use-attribute-sets="right-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="right-page-start">
                    <fo:block xsl:use-attribute-sets="right-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="right-page-end">
                    <fo:block xsl:use-attribute-sets="right-page-end02"></fo:block>
                </fo:static-content> 
                
                <fo:static-content flow-name="left-page-before">
                    <fo:block xsl:use-attribute-sets="left-page-before02">
                       : <fo:retrieve-marker retrieve-class-name="chapter" retrieve-position="first-starting-within-page" retrieve-boundary="page-sequence"/> 
                    </fo:block>
                </fo:static-content>            
                <fo:static-content flow-name="left-page-after">
                    <fo:block xsl:use-attribute-sets="left-page-after02"><fo:page-number/></fo:block>
                </fo:static-content>
                <fo:static-content flow-name="left-page-start">
                    <fo:block xsl:use-attribute-sets="left-page-start02"></fo:block>
                </fo:static-content> 
                <fo:static-content flow-name="left-page-end">
                    <fo:block xsl:use-attribute-sets="left-page-end02"></fo:block>
                </fo:static-content> 

              
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
<xsl:apply-templates select='book/body/item[position() &gt; 19 and position() &lt; 25 ]'/>
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>

            <!-- for back part -->
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
                        <xsl:apply-templates select="book/back"/>
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>                       
        </fo:root></xsl:template>

</xsl:stylesheet>