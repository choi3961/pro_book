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

            
            <!-- for back part -->
            <fo:page-sequence master-reference="general-page">
                <fo:flow flow-name="xsl-region-body" > 
                    <fo:block xsl:use-attribute-sets="region-body02">
                        <xsl:apply-templates select="book/back"/>
                    </fo:block>   
                </fo:flow>
            </fo:page-sequence>                       
        </fo:root>