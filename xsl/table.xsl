<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:template match="table">
        <fo:block>
            <fo:table xsl:use-attribute-sets="table">
              <fo:table-body> 
                <fo:table-row xsl:use-attribute-sets="table">
                  <fo:table-cell xsl:use-attribute-sets="table" column-number="1">
                    <fo:block></fo:block>
                  </fo:table-cell>                
                  <fo:table-cell xsl:use-attribute-sets="table" column-number="2">
                    <fo:block>주격</fo:block>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="table" column-number="3">
                    <fo:block>소유격</fo:block>
                  </fo:table-cell>     
                  <fo:table-cell xsl:use-attribute-sets="table" column-number="4">
                    <fo:block>목적격</fo:block>
                  </fo:table-cell>             
                </fo:table-row> 
                             
                <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="table" column-number="1">
                    <fo:block>사람</fo:block>
                  </fo:table-cell>                   
                  <fo:table-cell column-number="2">
                    <fo:block>who</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3">
                    <fo:block>whose</fo:block>
                  </fo:table-cell>     
                  <fo:table-cell column-number="4">
                    <fo:block>who,whom</fo:block>
                  </fo:table-cell>  
                </fo:table-row>
                
                <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="table"  column-number="1">
                    <fo:block>사물</fo:block>
                  </fo:table-cell>                            
                  <fo:table-cell column-number="2">
                    <fo:block>which</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3">
                    <fo:block>of which</fo:block>
                  </fo:table-cell>     
                  <fo:table-cell column-number="4">
                    <fo:block>which</fo:block>
                  </fo:table-cell>  
                </fo:table-row> 
                   
                <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="table"  column-number="1">
                    <fo:block>사람,사물</fo:block>
                  </fo:table-cell>          
                  <fo:table-cell column-number="2">
                    <fo:block>that</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3">
                    <fo:block>x</fo:block>
                  </fo:table-cell>     
                  <fo:table-cell column-number="4">
                    <fo:block>that</fo:block>
                  </fo:table-cell>  
                </fo:table-row>   
                  
                <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="table"  column-number="1">
                    <fo:block>the thing that</fo:block>
                  </fo:table-cell>                      
                  <fo:table-cell column-number="2">
                    <fo:block>what</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3">
                    <fo:block>x</fo:block>
                  </fo:table-cell>     
                  <fo:table-cell column-number="4">
                    <fo:block>what</fo:block>
                  </fo:table-cell>  
                </fo:table-row>                                                                
              </fo:table-body>
            </fo:table>            
        </fo:block> 
    </xsl:template>  

    <xsl:template match="table2">
        <fo:block>
            <fo:table xsl:use-attribute-sets="table">
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell column-number="1">
                    <fo:block>시간</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="2">
                    <fo:block>when</fo:block>
                  </fo:table-cell> 
                  <fo:table-cell column-number="3">
                    <fo:block>= at(on, in) which</fo:block>
                  </fo:table-cell>                   
                </fo:table-row>   
                <fo:table-row>
                  <fo:table-cell column-number="1">
                    <fo:block>장소</fo:block>
                  </fo:table-cell>                   
                  <fo:table-cell column-number="2">
                    <fo:block>where</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3">
                    <fo:block>= at(on, in) which</fo:block>
                  </fo:table-cell>                     
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell column-number="1">
                    <fo:block>방법</fo:block>
                  </fo:table-cell>                            
                  <fo:table-cell column-number="2">
                    <fo:block>how</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3">
                    <fo:block>= in which</fo:block>
                  </fo:table-cell>                    
                </fo:table-row> 
                <fo:table-row>
                  <fo:table-cell column-number="1">
                    <fo:block>이유</fo:block>
                  </fo:table-cell>          
                  <fo:table-cell column-number="2">
                    <fo:block>why</fo:block>
                  </fo:table-cell>
                  <fo:table-cell column-number="3">
                    <fo:block>= for which</fo:block>
                  </fo:table-cell>                     
                </fo:table-row>                                                                  
              </fo:table-body>
            </fo:table>            
        </fo:block> 
    </xsl:template>        
</xsl:stylesheet>


