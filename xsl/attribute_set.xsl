<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns:fox="http://xmlgraphics.apache.org/fop/extensions">
    
    <xsl:attribute-set name="simple-page-master">
        <xsl:attribute name="page-width">187mm</xsl:attribute>
        <xsl:attribute name="page-height">263mm</xsl:attribute>
        <xsl:attribute name="margin">0mm 0mm 0mm 0mm</xsl:attribute>
    </xsl:attribute-set> 
    
    <xsl:attribute-set name="blank-body">
        <xsl:attribute name="margin">0 0 0 0</xsl:attribute>
    </xsl:attribute-set>    
    
    
    <xsl:attribute-set name="region-body">
        <xsl:attribute name="margin">29mm 27mm 20mm 27mm </xsl:attribute>
        
<!--  
        <xsl:attribute name="background-image">../static/images/fibo.png</xsl:attribute>
        <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
        <xsl:attribute name="background-position">center</xsl:attribute>
-->        
    </xsl:attribute-set>     
                   
    <xsl:attribute-set name="region-before">
        <xsl:attribute name="extent">24mm</xsl:attribute>
    </xsl:attribute-set>       
      
    <xsl:attribute-set name="region-after">
        <xsl:attribute name="extent">17mm</xsl:attribute>
    </xsl:attribute-set>           

    <xsl:attribute-set name="region-start">
        <xsl:attribute name="extent">17mm</xsl:attribute>
    </xsl:attribute-set>  

    <xsl:attribute-set name="region-end">
        <xsl:attribute name="extent">17mm</xsl:attribute>
    </xsl:attribute-set>  

    <xsl:attribute-set name="container">
        <xsl:attribute name="font-size">13px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
    </xsl:attribute-set>  

    <xsl:attribute-set name="blank-secret">
        <xsl:attribute name="background-color">cmyk(0.1, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="color">cmyk(0.1, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="line-height">100</xsl:attribute>
        <xsl:attribute name="font-size">13px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
    </xsl:attribute-set>      
    
    <xsl:attribute-set name="chap">
        <xsl:attribute name="font-size">27px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">50px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>          
    </xsl:attribute-set>      

    <xsl:attribute-set name="title-1">
        <xsl:attribute name="font-size">29px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">100px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute> 
        <xsl:attribute name="font-weight">bold</xsl:attribute>   
    </xsl:attribute-set> 
    <xsl:attribute-set name="title-2">
        <xsl:attribute name="font-size">27px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">90px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>         
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="page-break-before">always</xsl:attribute>  
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute> 
        <xsl:attribute name="fox:border-radius">50pt</xsl:attribute>
        <xsl:attribute name="space-after">30px</xsl:attribute>
               
    </xsl:attribute-set> 
    <xsl:attribute-set name="title-3">
        <xsl:attribute name="font-size">20px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">47px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="page-break-before">always</xsl:attribute>  
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute>  
        <xsl:attribute name="fox:border-radius">50pt</xsl:attribute>         
    </xsl:attribute-set> 
    <xsl:attribute-set name="title-4">
        <xsl:attribute name="margin">9 39 0 39</xsl:attribute>
        <xsl:attribute name="margin-bottom">17px</xsl:attribute>
        <xsl:attribute name="font-size">17px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute>  
        <xsl:attribute name="fox:border-radius">50pt</xsl:attribute>
    </xsl:attribute-set> 

    <xsl:attribute-set name="toc-title">
        <xsl:attribute name="font-size">27px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">60px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute> 
    </xsl:attribute-set>   

    <xsl:attribute-set name="title-15">
        <xsl:attribute name="margin">0 0 17 0</xsl:attribute>
        <xsl:attribute name="line-height">30px</xsl:attribute>
        <xsl:attribute name="font-size">17px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute>  
        <xsl:attribute name="fox:border-radius">50pt</xsl:attribute>
    </xsl:attribute-set> 
    
    <xsl:attribute-set name="title-mid">
        <xsl:attribute name="line-height">60px</xsl:attribute>
        <xsl:attribute name="font-size">23px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
    </xsl:attribute-set>     
          
    <xsl:attribute-set name="toc">
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Medium</xsl:attribute>
        <xsl:attribute name="line-height">19px</xsl:attribute>
        <xsl:attribute name="margin">0 0 0 10</xsl:attribute>
        
    </xsl:attribute-set>
    <xsl:attribute-set name="first-page">
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
        <xsl:attribute name="font-size">13px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">29px</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>    
    <xsl:attribute-set name="toc-sub">
        <xsl:attribute name="font-size">11px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="line-height">19px</xsl:attribute>
    </xsl:attribute-set>    
    <xsl:attribute-set name="toc-chapter">
        <xsl:attribute name="margin">0 0 0 0</xsl:attribute>
        <xsl:attribute name="font-size">17px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>        
        <xsl:attribute name="line-height">45px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute> 
        <xsl:attribute name="space-before">15px</xsl:attribute> 
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute>  
    </xsl:attribute-set>         
        
<!-- contents attribute for region body -->
    <xsl:attribute-set name="c-region-body">
        <xsl:attribute name="line-height">14px</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="border">solid yellow 1</xsl:attribute>
    </xsl:attribute-set>     
<!-- contents attribute for preface page -->
    <xsl:attribute-set name="preface">
        <xsl:attribute name="line-height">19px</xsl:attribute>
        <xsl:attribute name="font-size">13px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
    </xsl:attribute-set>
<!-- contents attribute for introduction page -->
    <xsl:attribute-set name="introduction">
        <xsl:attribute name="line-height">90px</xsl:attribute>
        <xsl:attribute name="font-size">20px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>        
    </xsl:attribute-set>
    
<!-- contents attribute for region before. This is for right page header -->
    <xsl:attribute-set name="c-region-before">
        <xsl:attribute name="line-height">14mm</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
    <!--    <xsl:attribute name="border-bottom">solid yellow 1</xsl:attribute>-->
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>  
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>  
    
<!-- special block for region-before area -->
    <xsl:attribute-set name="special-block-r">
        <xsl:attribute name="margin">33 20 0 0</xsl:attribute>
        <xsl:attribute name="line-height">9mm</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>  

<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>   
<!-- special block for region-before area -->
    <xsl:attribute-set name="special-block-l">
        <xsl:attribute name="margin">33 20 0 10</xsl:attribute>
        <xsl:attribute name="line-height">9mm</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>  
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>   
    
<!-- special block for region-before area -->
    <xsl:attribute-set name="special-block-r-2">
        <xsl:attribute name="margin">3 10 20 10</xsl:attribute>
        <xsl:attribute name="line-height">9mm</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>  

<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>   
<!-- special block for region-before area -->
    <xsl:attribute-set name="special-block-l-2">
        <xsl:attribute name="margin">3 10 20 10</xsl:attribute>
        <xsl:attribute name="line-height">9mm</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>  
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>       
    
    <xsl:attribute-set name="special-block-l-co">
        <xsl:attribute name="color">cmyk(0.3, 0, 0, 0)</xsl:attribute>  
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>       

<!-- right page block for region-after area -->
    <xsl:attribute-set name="page-block-r">
        <xsl:attribute name="margin">0 20 0 350</xsl:attribute>
        <xsl:attribute name="line-height">9mm</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>  
        <xsl:attribute name="fox:border-radius">10pt</xsl:attribute>
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>
    
<!-- left page block for region-after area -->
    <xsl:attribute-set name="page-block-l">
        <xsl:attribute name="margin">0 350 0 20</xsl:attribute>
        <xsl:attribute name="line-height">9mm</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>  
        <xsl:attribute name="fox:border-radius">10pt</xsl:attribute>
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>    
                      

<!-- contents attribute for region before. This is for right page header -->
    <xsl:attribute-set name="c-region-before-r">
        <xsl:attribute name="line-height">21mm</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="text-transform">uppercase</xsl:attribute> 
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>  
    

<!-- contents attribute for region before. This is for left page header -->
    <xsl:attribute-set name="c-region-before-l">
        <xsl:attribute name="line-height">21mm</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="text-transform">uppercase</xsl:attribute> 
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>    
    
<!-- contents attribute for region before. This is for right page header -->
    <xsl:attribute-set name="backmatter-before-r">
        <xsl:attribute name="margin">0 30 0 0</xsl:attribute>
        <xsl:attribute name="line-height">21mm</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>
    
<!-- contents attribute for region before. This is for right page header -->
    <xsl:attribute-set name="backmatter-before-l">
        <xsl:attribute name="margin">0 0 0 30</xsl:attribute>
        <xsl:attribute name="line-height">21mm</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>       

<!-- contents attribute for region before. This is for right page header -->
    <xsl:attribute-set name="backmatter-after-r">
        <xsl:attribute name="margin">0 30 0 0</xsl:attribute>
        <xsl:attribute name="line-height">21mm</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
         
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>
    
<!-- contents attribute for region before. This is for right page header -->
    <xsl:attribute-set name="backmatter-after-l">
        <xsl:attribute name="margin">0 0 0 30</xsl:attribute>
        <xsl:attribute name="line-height">21mm</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>                 
    

<!-- region before attribute of first page, Preface and Introduction -->
    <xsl:attribute-set name="first-before">
        <xsl:attribute name="line-height">21mm</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="text-altitude">1px</xsl:attribute>
        <xsl:attribute name="color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>
          
    
<!-- contents attribute for region before -->
    <xsl:attribute-set name="front-before">
        <xsl:attribute name="line-height">14mm</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="border-bottom">solid yellowgreen 1</xsl:attribute>
        <xsl:attribute name="background-color">yellowgreen</xsl:attribute>
        
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>         
    
<!-- contents attribute for region before -->
    <xsl:attribute-set name="top-line-r">
        <xsl:attribute name="line-height">14mm</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="border-bottom">solid yellow 1</xsl:attribute>
        
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>    
<!-- contents attribute for region before -->
    <xsl:attribute-set name="top-line-l">
        <xsl:attribute name="line-height">14mm</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="border-bottom">solid yellow 1</xsl:attribute>
        
<!--    <xsl:attribute name="background-image">pattern.png</xsl:attribute>  -->
    </xsl:attribute-set>   
    
<!-- contents attribute for region before -->
    <xsl:attribute-set name="f-c-t-start">
        <xsl:attribute name="margin">0px 0px 0px 0px</xsl:attribute>
        <xsl:attribute name="line-height">773px</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
    <!--    <xsl:attribute name="border-right">solid yellow 1</xsl:attribute>-->
        
        
    </xsl:attribute-set> 
    
<!-- contents attribute for region before -->
    <xsl:attribute-set name="f-c-t-end">
        <xsl:attribute name="margin">0px 0px 0px 0px</xsl:attribute>
        <xsl:attribute name="line-height">773px</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
    <!--    <xsl:attribute name="border-right">solid yellow 1</xsl:attribute>-->
        
        
    </xsl:attribute-set>                 

<!-- contents attribute  for region after. This is for right page-->      
    <xsl:attribute-set name="c-region-after-r">
        <xsl:attribute name="line-height">17mm</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="text-align-last">end</xsl:attribute>        
    </xsl:attribute-set>  
    
<!-- contents attribute  for region after. This is for left page-->      
    <xsl:attribute-set name="c-region-after-l">
        <xsl:attribute name="line-height">17mm</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>           
    </xsl:attribute-set>    
         

<!-- contents attribute  for region start-->      
    <xsl:attribute-set name="c-region-start">
        <xsl:attribute name="margin">0px 0px 0px 0px</xsl:attribute>
        <xsl:attribute name="line-height">773px</xsl:attribute>
        <xsl:attribute name="font-size">10px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
    </xsl:attribute-set>

<!-- contents attribute  for region end-->      
    <xsl:attribute-set name="c-region-end">
        <xsl:attribute name="margin">0px 0px 0px 0px</xsl:attribute>
        <xsl:attribute name="line-height">773px</xsl:attribute>
        <xsl:attribute name="font-size">30px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        
        <xsl:attribute name="color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.3, 0, 0, 0)</xsl:attribute>
    </xsl:attribute-set>    

    <xsl:attribute-set name="item">
    </xsl:attribute-set> 
    <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>

    <xsl:attribute-set name="head">
        <xsl:attribute name="margin">25 35 25 35</xsl:attribute>
        <xsl:attribute name="font-size">25px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">13px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute> 
        <xsl:attribute name="fox:border-radius">20pt</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute> 
    </xsl:attribute-set> 
    
    <xsl:attribute-set name="contents">
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>   
    </xsl:attribute-set> 
    
    <xsl:attribute-set name="con_header">
        <xsl:attribute name="space-before">20px</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>    
    </xsl:attribute-set> 

    <xsl:attribute-set name="con_header_trans">
        <xsl:attribute name="font-size">9px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>    
    </xsl:attribute-set> 
    
    <xsl:attribute-set name="metaphor">
        <xsl:attribute name="margin">100 0 0 0</xsl:attribute>
        <xsl:attribute name="font-size">29px</xsl:attribute>
        
        <xsl:attribute name="font-family">Times Roman</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="page-break-before">always</xsl:attribute>  
         
    </xsl:attribute-set>     
    
    <xsl:attribute-set name="page">
        <xsl:attribute name="margin">1 0 0 0</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="page-break-before">always</xsl:attribute>     
        <xsl:attribute name="text-align">justify</xsl:attribute>     
    </xsl:attribute-set>  

    <xsl:attribute-set name="trans">
        <xsl:attribute name="font-size">11px</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute> 
        <xsl:attribute name="font-family">이순신 Regular</xsl:attribute>  
    </xsl:attribute-set>
    
    <xsl:attribute-set name="trans-title">
        <xsl:attribute name="line-height">30px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute> 
<!--    <xsl:attribute name="text-transform">capitalize</xsl:attribute> -->
    </xsl:attribute-set> 

    <xsl:attribute-set name="t">
        <xsl:attribute name="font-size">9px</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute> 
        <xsl:attribute name="font-family">이순신 Regular</xsl:attribute>  
        <xsl:attribute name="start-indent">1em</xsl:attribute>
    </xsl:attribute-set> 
    <xsl:attribute-set name="explain">
        <xsl:attribute name="margin">0 0 0 10</xsl:attribute>
        <xsl:attribute name="font-size">9px</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute> 
        <xsl:attribute name="font-family">이순신 Regular</xsl:attribute>  
    </xsl:attribute-set>
    <xsl:attribute-set name="p">
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
   <!--       <xsl:attribute name="space-after">10px</xsl:attribute>-->
        
        <!-- 
        <xsl:attribute name="start-indent">10px</xsl:attribute> -->
    </xsl:attribute-set> 

    <xsl:attribute-set name="e_chap">
        <xsl:attribute name="bottom">30px</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="start-indent">3em</xsl:attribute>
        <xsl:attribute name="end-indent">3em</xsl:attribute>
        <xsl:attribute name="space-before">100px</xsl:attribute>
    </xsl:attribute-set>     

    <xsl:attribute-set name="e_chap2">
        <xsl:attribute name="bottom">30px</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="start-indent">3em</xsl:attribute>
        <xsl:attribute name="end-indent">3em</xsl:attribute>
        <xsl:attribute name="space-before">20px</xsl:attribute>
    </xsl:attribute-set>         

    <xsl:attribute-set name="temp">
        <xsl:attribute name="bottom">30px</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="space-after">10px</xsl:attribute>
   <!-- <xsl:attribute name="start-indent">1em</xsl:attribute> -->
    </xsl:attribute-set>         


    <xsl:attribute-set name="tips">
        <!-- <xsl:attribute name="absolute-position">absolute</xsl:attribute> -->
        <xsl:attribute name="margin">0 0 0 0</xsl:attribute>
        <xsl:attribute name="padding">3 2 3 2</xsl:attribute>
        <xsl:attribute name="font-size">9px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="border">solid cmyk(1, 0, 0, 0) 1px</xsl:attribute>
        <xsl:attribute name="space-before">10px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>   
    <xsl:attribute-set name="tip">
        <xsl:attribute name="line-height">14px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <!-- 
        <xsl:attribute name="start-indent">1em</xsl:attribute> -->
        <!--
        <xsl:attribute name="text-indent">0em</xsl:attribute>    -->    
    </xsl:attribute-set>               
    
    <!-- contents attribute  for English sentences-->   
    <xsl:attribute-set name="sen">
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>       
    </xsl:attribute-set>     
    
    <xsl:attribute-set name="p1">
        <xsl:attribute name="margin">0 0 19 0</xsl:attribute>
        <xsl:attribute name="space-after">10px</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute> 
        
        <xsl:attribute name="font-family">KoPubBatang Bold</xsl:attribute>
        <xsl:attribute name="font-size">15px</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">31px</xsl:attribute>
<!--    <xsl:attribute name="text-transform">capitalize</xsl:attribute> -->
        <xsl:attribute name="text-indent">7px</xsl:attribute>
        
        
        
    </xsl:attribute-set> 

    <xsl:attribute-set name="p2">
        <xsl:attribute name="margin">0 0 0 10</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="font-size">9px</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="line-height">12px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="space-before">1px</xsl:attribute>
        <xsl:attribute name="space-after">1px</xsl:attribute>
       
    </xsl:attribute-set> 
    <xsl:attribute-set name="p3">
        <xsl:attribute name="margin">0 0 0 0</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="space-after">1px</xsl:attribute>
        
      
    </xsl:attribute-set> 
    <xsl:attribute-set name="p4">
        <xsl:attribute name="font-size">9px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">13px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="space-after">1px</xsl:attribute>
        <xsl:attribute name="space-before">1px</xsl:attribute>
        
     
    </xsl:attribute-set> 
    
    
    <!-- for the sentences in the pages of verbid and clause, i.e. <p1t>,<p2t>,<p3t>,,, -->   
    <xsl:attribute-set name="p_odd">
        <xsl:attribute name="margin">0 0 0 0</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Bold</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="space-after">10px</xsl:attribute>
   <!-- <xsl:attribute name="start-indent">2em</xsl:attribute> -->
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>    
    
    <!-- for the sentences in the pages of verbid and clause, i.e. <p1t>,<p2t>,<p3t>,,, -->   
    <xsl:attribute-set name="p_even">
        <xsl:attribute name="margin">0 0 0 0</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Bold</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="space-after">10px</xsl:attribute>
   <!-- <xsl:attribute name="start-indent">2em</xsl:attribute> -->
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>    

    <xsl:attribute-set name="long">
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Medium</xsl:attribute>
        <xsl:attribute name="border">solid cmyk(1, 0, 0, 0) 1px</xsl:attribute>
        <xsl:attribute name="space-after">10px</xsl:attribute>
    </xsl:attribute-set>     


    <!-- for the sentences in the pages of verbid and clause, i.e. <p1t>,<p2t>,<p3t>,,, -->   
    <xsl:attribute-set name="pt">
        <xsl:attribute name="margin">0 0 0 19</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Bold</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-indent">-15px</xsl:attribute>
        <xsl:attribute name="space-after">10px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="bold">
        <xsl:attribute name="font-family">KoPub Batang Bold</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>     

    <xsl:attribute-set name="quote">
        <xsl:attribute name="font-size">11px</xsl:attribute>
        <xsl:attribute name="font-family">이순신 Regular</xsl:attribute>
    </xsl:attribute-set>   

    <xsl:attribute-set name="pic">
        <xsl:attribute name="start-indent">150px</xsl:attribute>
        <xsl:attribute name="space-before">35px</xsl:attribute>
        <xsl:attribute name="space-after">55px</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="pic2">
        <xsl:attribute name="margin-right">150</xsl:attribute>
        <xsl:attribute name="background-color">green</xsl:attribute>      
    </xsl:attribute-set>    
    
    <xsl:attribute-set name="wordle">
        <xsl:attribute name="start-indent">60px</xsl:attribute>
        <xsl:attribute name="space-before">50px</xsl:attribute>
       
    </xsl:attribute-set>    

    <xsl:attribute-set name="wordle2">
        <xsl:attribute name="start-indent">60px</xsl:attribute>
        <xsl:attribute name="space-before">20px</xsl:attribute>
        <xsl:attribute name="space-after">20px</xsl:attribute>
    </xsl:attribute-set>     

    <xsl:attribute-set name="table">
        <xsl:attribute name="border">solid 0.1mm black</xsl:attribute>
        <xsl:attribute name="border-collapse">collapse</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="space-after">10px</xsl:attribute>
    </xsl:attribute-set>  
     
    <xsl:attribute-set name="table_header">
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>  
      
    <!-- space between paragraph -->
    <xsl:attribute-set name="between_para">
        <xsl:attribute name="space-before">20px</xsl:attribute>
    </xsl:attribute-set> 

    <!-- indent in Adverbial Clause -->
    <xsl:attribute-set name="indent_1">
        <xsl:attribute name="margin-left">30px</xsl:attribute>
        <xsl:attribute name="font-size">12px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light</xsl:attribute>
        <xsl:attribute name="line-height">21px</xsl:attribute>
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="text-indent">-15px</xsl:attribute> 
    </xsl:attribute-set>   
      
    <!-- to make space in (Adverbial Clause) -->
    <xsl:attribute-set name="space">
        <xsl:attribute name="margin">10 0 0 0</xsl:attribute>
    </xsl:attribute-set>  
      
    <!-- to make space in (Adverbial Clause) -->
    <xsl:attribute-set name="space2">
        <xsl:attribute name="margin">0 0 0 0</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="line-height">0</xsl:attribute> 
    </xsl:attribute-set>
    
    <!-- for the mid title -->
    <xsl:attribute-set name="mid_t">
        <xsl:attribute name="margin">10 50 10 50</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.5, 0, 0, 0)</xsl:attribute>
        <xsl:attribute name="fox:border-radius">50pt</xsl:attribute>         
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>  
    </xsl:attribute-set>            
        
    <!-- for the mid title -->
    <xsl:attribute-set name="mid_t2">
        <xsl:attribute name="margin">10 50 10 50</xsl:attribute>
        <xsl:attribute name="fox:border-radius">50pt</xsl:attribute>         
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>  
    </xsl:attribute-set> 

    <!-- for the mid title -->
    <xsl:attribute-set name="space-1">
        <xsl:attribute name="space-before">10px</xsl:attribute>
    </xsl:attribute-set>   

    <!-- for the mid title -->
    <xsl:attribute-set name="space-2">
        <xsl:attribute name="space-before">20px</xsl:attribute>
    </xsl:attribute-set>    
    <!-- for the mid title -->
    <xsl:attribute-set name="space-3">
        <xsl:attribute name="space-before">30px</xsl:attribute>
    </xsl:attribute-set>   

    <!-- for the mid title -->
    <xsl:attribute-set name="space-4">
        <xsl:attribute name="space-before">40px</xsl:attribute>
    </xsl:attribute-set>    
    <!-- for the mid title -->
    <xsl:attribute-set name="space-5">
        <xsl:attribute name="space-before">50px</xsl:attribute>
    </xsl:attribute-set>   

    <!-- for the mid title -->
    <xsl:attribute-set name="space-6">
        <xsl:attribute name="space-before">60px</xsl:attribute>
    </xsl:attribute-set>              
    
    <!-- for the mid title -->
    <xsl:attribute-set name="space-copy">
        <xsl:attribute name="space-before">10px</xsl:attribute>
        <xsl:attribute name="space-after">20px</xsl:attribute> 
        <xsl:attribute name="font-family">NamumMyeongjo Bold</xsl:attribute>
        <xsl:attribute name="font-size">11px</xsl:attribute>
    </xsl:attribute-set>          
            
    <xsl:attribute-set name="answers_title">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="font-size">21px</xsl:attribute>
        <xsl:attribute name="line-height">42px</xsl:attribute>
        <xsl:attribute name="space-before">15px</xsl:attribute>
    </xsl:attribute-set>   

    <xsl:attribute-set name="back-1">
        <xsl:attribute name="margin">23 0 0 0</xsl:attribute>
        <xsl:attribute name="padding">50 30 30 30</xsl:attribute>
        <xsl:attribute name="background-color">cmyk(0.1, 0, 0, 0)</xsl:attribute> 
        <xsl:attribute name="fox:border-radius">50pt</xsl:attribute>
         
    </xsl:attribute-set>     
    <xsl:attribute-set name="company-name">
        <xsl:attribute name="space-before">270px</xsl:attribute>
        <xsl:attribute name="font-size">15px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">100px</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute> 
        <xsl:attribute name="font-weight">bold</xsl:attribute>   
    </xsl:attribute-set>    

    <xsl:attribute-set name="copy-company-name">
        <xsl:attribute name="font-size">11px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubBatang Light </xsl:attribute>
        
    </xsl:attribute-set>    
        
    <xsl:attribute-set name="author-name">
        <xsl:attribute name="margin">0 30 0 0</xsl:attribute>
        <xsl:attribute name="space-before">60px</xsl:attribute>
        <xsl:attribute name="font-size">15px</xsl:attribute>
        <xsl:attribute name="font-family">KoPubDotum Bold</xsl:attribute>
        <xsl:attribute name="line-height">10px</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute> 
        <xsl:attribute name="font-weight">bold</xsl:attribute>   
    </xsl:attribute-set>      
        
</xsl:stylesheet>


