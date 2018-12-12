module namespace fiction='http://www.b_fiction.com/webpage';

(:declare option db:writeback 'true';:)

 (:function book_fiction:)
declare
  %rest:path("/book_fiction/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function fiction:fiction($num as xs:int)
    {
 
(:let $howto := doc("./xml/fiction_howtowrite.xml")/book/body/item[$num]/howtowrite  :)

       let $title := doc("./xml/book_fiction.xml")/book/body/item[$num]/title
                     
       let $title := if($num=101) 
                     then "Front"
                     else if($num=102) 
                     then "Back"
                     else $title

       let $fiction := doc("./xml/book_fiction.xml")
       let $style := doc("./xsl/fiction.xsl")      
       
       return xslt:transform($fiction, $style, map {"num": $num, "title":$title })
    };
    




 (:function to Change the value of attribute with font-family. 
 declare
  %rest:path("/book_fiction/test")
  %rest:GET

  function fiction:test(){
    let $test := "hello but"
    return $test
    
  }; 

:)










    




 (:function to Change the value of attribute with font-family. :)
 declare
  %rest:path("/book_fiction/font_option/{$loc}")
  %rest:POST
  %rest:form-param("first","{$first}","(no message)")
  function fiction:font_option($loc as xs:string, $first as xs:string){
  
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\font_option.php', $loc, $first))
    
  }; 



    

 (:combine "book_fiction.xml" and "fiction_front.xml" and "fiction_back.xml":)
 declare
  %rest:path("/book_fiction/auth")
  %rest:POST
  %rest:form-param("first","{$first}","(no message)")
  %rest:form-param("second","{$second}","(no message)")   
  function fiction:auth($first as xs:string, $second as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\auth_mod.php', $first, $second))
  };  


 (:combine "book_fiction.xml" and "fiction_front.xml" and "fiction_back.xml":)
 declare
  %rest:path("/book_fiction/font_show")
  %rest:GET
  
  function fiction:font_show(){
    proc:execute('C:\Program Files\Java\jre-10\bin\java.exe', ('-classpath', 'C:\Program Files (x86)\BaseX\webapp\java_lib', 'ListJavaFonts'))
  };  

  
(:  function fiction:font_show(){
    proc:execute('E:\php-gtk2/php.exe', 'E:\php-gtk2\demos\stock-browser.php')
  };  
:)



 (:combine "book_fiction.xml" and "fiction_front.xml" and "fiction_back.xml":)
 declare
  %rest:path("/book_fiction/combine")
  %rest:GET
  function fiction:combine(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\combine.php')
  };  


 (:Make 'default_base.xml' to contain all tags and default setting, and then change 'default.xml' with data of default_base.xml:)
 declare
  %rest:path("/book_fiction/default_base")
  %rest:GET
  function fiction:default_base(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\default_base.php')
  };  

 (:Simply from 'default.xml' to 'default_reserve.xml':)
 declare
  %rest:path("/book_fiction/save_default")
  %rest:GET
  function fiction:save_default(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\save_default.php')
  };  


 (:function to insert <p> tag:)
 declare
  %rest:path("/book_fiction/p_tag")
  %rest:GET
  function fiction:p_tag(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\p_tag.php')
  };  

 (:function to insert many signal tags:)
 declare
  %rest:path("/book_fiction/sig_tags")
  %rest:GET
  function fiction:sig_tags(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\sig_tags.php')
  };  


 (:function to copy book_fiction.xml to book_fictionfinal.xml :)
 declare
  %rest:path("/book_fiction/trans/modify333")
  %rest:GET
  function fiction:modify333(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\modify333.php')
  }; 




 (:function page_modify_f ; This is for front part ; Copied function page_modify:)
 declare
  %rest:path("/book_fiction/form2/page_modify_f/{$num}/{$page_num}")
  %rest:POST
  %rest:form-param("page","{$page}", "(no message)")
  %updating
  function fiction:page_modify_f($page as xs:string,$num as xs:int, $page_num as xs:int){
    
    let $book := doc("./xml/fiction_front.xml")
    
    let $result := $page
    
    
    
    return
        (replace value of node $book/book/front/child::*[$page_num] with $page,
        
        file:write("E:\xampp\tomcat\webapps\pro_b/first.xml",$book    ))
      
  };
  
 (:function page_modify_b ; This is for back part ;  Copied function page_modify:)
 declare
  %rest:path("/book_fiction/form2/page_modify_b/{$num}/{$page_num}")
  %rest:POST
  %rest:form-param("page","{$page}", "(no message)")
  %updating
  function fiction:page_modify_b($page as xs:string,$num as xs:int, $page_num as xs:int){
    

    let $book3 := doc("./xml/fiction_back.xml")
    
    let $result := $page
    
    
    return

       (replace value of node $book3/book/back/child::*[$page_num] with $page,
       put($book3,"E:\xampp\tomcat\webapps\pro_b/xml/fiction_back.xml"),
       file:write("E:\xampp\tomcat\webapps\pro_b/first.xml",$book3)   )

  };  


 (:function page_modify:)
 declare
  %rest:path("/book_fiction/form2/page_modify/{$num}/{$page_num}")
  %rest:POST
  %rest:form-param("page","{$page}", "(no message)")
  %updating
  function fiction:page_modify($page as xs:string,$num as xs:int, $page_num as xs:int){
    

    let $book2 := doc("./xml/book_fiction.xml")

    
    let $result := $page
      
    return
       replace value of node $book2/book/body/item[$num]/contents/page[$page_num]/text() with $page
  };










 declare
  %rest:path("/book_fiction/default_fo")
  %rest:GET
  function fiction:defalut_fo(){
    
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\default_fo.php'))
  }; 
    
 declare
  %rest:path("/book_fiction/default_setting")
  %rest:GET
  function fiction:defalut_setting(){
    
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\default_setting.php'))
  }; 

 (:from display to "default.xml". The process is partly similar to the "span01" event handler. :)
 declare
  %rest:path("/book_fiction/to_default/{$loc}")
  %rest:POST
  %rest:form-param("first","{$first}","(no message)")
  %rest:form-param("second","{$second}","(no message)")  
  function fiction:to_default($loc as xs:string, $first as xs:string, $second as xs:string){
  
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\to_default.php', $loc, $first))
  }; 


 (:function to copy book_fiction.xml to book_fictionfinal.xml :)
 declare
  %rest:path("/book_fiction/edit/{$loc}")
  %rest:POST
  %rest:form-param("first","{$first}","(no message)")
  %rest:form-param("second","{$second}","(no message)")
  function fiction:edit($loc as xs:string, $first as xs:string, $second as xs:string){
  
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\replace_attribute.php', $loc, $first))
    
  }; 

(:return dinct tags to "fiction_tags.xml" file:)
 declare
  %rest:path("/book_fiction/fiction_interfere")
  %rest:GET
 
  function fiction:fiction_interfere(){
     proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\fiction_interfere.php'))
  };    

(:return dinct tags to "fiction_tags.xml" file:)
 declare
  %rest:path("/book_fiction/distinct_tags")
  %rest:GET
 
  function fiction:distinct_tags(){
     proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\distinct_tags.php'))
  };    


(:function to modify <con_header_trans/> tag:)
 declare
  %rest:path("/book_fiction/in_once4")
  %rest:POST
  %rest:form-param("file", "{$file}")
 
  function fiction:in_once4($file){

     proc:execute('php.exe', ('E:\xampp\tomcat\webapps\pro_b/Making sentences\in_once4.php', $file))  

(:

   let $name := $files



  let $content := $file

  let $name := $file


return <ul> <li>{$file}</li>
                <li>bbb</li></ul>




 %rest:form-param("files","{$files}")

  for $name    in map:keys($files)
  let $content := $files($name)

 let $path    := file:temp-dir() || $name
  return (
    file:write-binary($path, $content),
    <file name="{ $name }" size="{ file:size($path) }"/>
  )    
:)    

  };    

 (:function book_fiction:)
declare
  %rest:path("/book_fiction/aux_files")
  %rest:GET

  function fiction:final_files()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\aux_files.php'))
    }; 
    
 (:user interface for the fiction book design:)
declare
  %rest:path("/book_fiction/user_interface")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function fiction:user_interface()
    {
 
       let $fiction := doc("./xml/user_interface.xml")
       let $style := doc("./xsl/user_interface.xsl")      
       
       return xslt:transform($fiction, $style)
    };
 (:user interface for the fiction book design:)


 (:function book_fiction:)
declare
  %rest:path("/book_fiction/start")
  %rest:GET

  function fiction:start()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\book_start.php'))
    }; 
    
 (:function parser:)
declare
  %rest:path("/book_fiction/parser")
  %rest:GET

  function fiction:parser()
    {
      (:
        proc:execute("java.exe", ( "-cp", "C:\Users\Administrator\Desktop\second", "First") )
         :)
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\fiction_parser.php'))
    };     
    
    
(:function to modify <con_header_trans/> tag:)
 declare
  %rest:path("/book_fiction/modify_fiction")
  %rest:GET
 
  function fiction:modify_fiction(){
     proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\modify_fiction.php'))
  };    
    
 (:function to copy fiction.xml to fictionfinal.xml :)
 declare
  %rest:path("/book_fiction/fop")
  %rest:GET
  function fiction:fop(){
      proc:execute('fop.bat', ('-xml', 'fiction_final.xml', '-xsl', 'fiction_fo.xsl', '-pdf', 'fiction.pdf', '-c', 'cfg.xml'))                           
  };     
  
 
  
  (:
module namespace book_fiction='http://www.book_fiction.com/webpage';  
declare option db:writeback 'true'; 


 (:function book_fiction:)
declare
  %rest:path("/book_fiction/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function fiction:book_fiction($num as xs:int)
    {
 
(:let $howto := doc("./xml/book_fiction_howtowrite.xml")/book/body/item[$num]/howtowrite  :)

       let $file :=doc("./xml/book_fiction_howtowrite.xml")
       let $title := doc("./xml/book_fiction.xml")/book/body/item[$num]/title
       let $howto := if($num=101) 
                     then $file/book/body/item[51]/howtowrite
                     else if($num=102) 
                     then $file/book/body/item[52]/howtowrite
                     else $file/book/body/item[$num]/howtowrite
                     
       let $title := if($num=101) 
                     then "Front"
                     else if($num=102) 
                     then "Back"
                     else $title

       let $book_fiction := doc("./xml/book_fiction.xml")
       let $style := doc("./xsl/book_fiction.xsl")      
       
       return xslt:transform($book_fiction, $style, map {"num": $num, "how":$howto, "title":$title })
    };
    
    
 (:function book_fiction:bold attach tag <bold></bold> on English characters:)
 (:to make it look good:)
declare
  %rest:path("/book_fiction/bold_modify")
  %rest:GET 

  function book_fiction:bold_modify()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\bold_modify.php'))
    };    
    
    
 (:function book_fiction:quote_check; chekc the numbers of \" to ensure the number is even :)
declare
  %rest:path("/book_fiction/quote_check")
  %rest:GET 

  function book_fiction:quote_check()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\quote_check.php'))
    };        
    
 (:function add_tag:)
 declare
  %rest:path("/book_fiction/words_find")
  %rest:POST
  %rest:form-param("find","{$find}","(no message)")
  
  function book_fiction:words_find($find as xs:string){
       proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\find_words.php',$find))
  };
    
 (:function to copy book_fiction.xml to book_fictionfinal.xml :)
 declare
  %rest:path("/book_fiction/idioms")
  %rest:GET
  function book_fiction:idioms(){
    let $temp := proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\idioms.php')
    return $temp
  }; 

 (:function to copy book_fiction.xml to book_fictionfinal.xml :)
 declare
  %rest:path("/book_fiction/signals_modify")
  %rest:GET
  function book_fiction:signals_modify(){
    let $temp := proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\signals_modify.php')
    return $temp
  }; 


 (:function to copy book_fiction.xml to book_fictionfinal.xml :)
 declare
  %rest:path("/book_fiction/replace_str")
  %rest:POST
  %rest:form-param("in","{$in}","(no message)")
  %rest:form-param("out","{$out}","(no message)")
  function book_fiction:str_replace($in as xs:string, $out as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\replace_str.php',$in, $out) )
  }; 

  

 (:function book_fiction:)
declare
  %rest:path("/book_making/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function book_fiction:book_making($num as xs:int)
    {
       let $title := "How to make a book"
       let $howto := doc("./xml/book_fiction_howtowrite.xml")
       let $style := doc("./xsl/book_making.xsl")  
       let $memo := $howto/book/overall/memo
       return xslt:transform($howto, $style, map{"num": $num, "title":$title, "memo":$memo})
    }; 
    
 (:function modify:)
 declare
  %rest:path("/book_making/memo")
  %rest:POST
  %rest:form-param("item","{$item}","(no message)")
  %updating
  function book_fiction:memo2($item as xs:string){
    replace value of node doc("./xml/book_fiction_howtowrite.xml")/book/overall/memo with $item
  };         

 (:function book_fiction howto:)
declare
  %rest:path("/howto_write/modify/{$num}")
  %rest:POST
  %rest:form-param("way","{$item}","(no message)")
  %updating
  function book_fiction:howto($num as xs:int, $item as xs:string)
    {
      replace value of node doc("./xml/book_fiction_howtowrite.xml")/book/overall/way[$num] with $item
    };   

 (:function book_fiction howto2:)
 (:copied function book_fiction howto:)
declare
  %rest:path("/howto_write/modify2/{$num}")
  %rest:POST
  %rest:form-param("howtowrite","{$item}","(no message)")
  %updating
  function book_fiction:howto2($num as xs:int, $item as xs:string)
    {
      replace value of node doc("./xml/book_fiction_howtowrite.xml")/book/body/item[$num]/howtowrite with $item
    };       

 (:function add_tag:)
 declare
  %rest:path("/book_fiction/higher_order")
  %rest:POST
  %rest:form-param("tag","{$seq}","(no message)")
  %rest:form-param("fun","{$fun}","(no message)")
  function book_fiction:higher_order($seq as item()*, $fun as function(item()) as item()*){
    let $s := <tag>
                sample
              </tag>
    let $result :=  for-each($seq, math:pow(?, 2))            
    return            
   $result
  };

 (:function add_tag:)
 declare
  %rest:path("/book_fiction/add_tag")
  %rest:POST
  %rest:form-param("tag","{$tag}","(no message)")
  
  %updating
  function book_fiction:add_tag($tag as xs:string){
    let $s := <tag>
                <title>{$tag}</title>
                <name>{$tag}</name>
                <property>
                  <kind>one word</kind>
                </property>
              </tag>
    return            
    insert node  $s into doc("./xml/tagger_oneword.xml")/tagger/body
  };
  

 (:function sentences:)
declare
  %rest:path("/book_fiction/paragraphs")
  %rest:POST
  %rest:form-param("num","{$num}", "(no message)")
  %rest:form-param("num2","{$num2}", "(no message)")
  %rest:form-param("tagger","{$tag}", "(no message)")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function book_fiction:paragraphs($num as xs:int, $num2 as xs:int, $tag as xs:string)
    {
        for $data in doc("./xml/paragraphs.xml")/paragraphs/paragraph[tags/tag=$tag][position() mod $num =$num2]
        order by  xs:integer($data/tags/length)
        return 
        <p>{$data/text()}</p>
    };
 
(:function to modify <con_header_trans/> tag:)
 declare
  %rest:path("/book_fiction/tagger")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function book_fiction:tagger()
    {
       let $title := "hello Tagger"
       
       let $tagger := doc("./xml/tagger.xml")
       let $tagger_s := doc("./xsl/tagger.xsl")      
       return xslt:transform($tagger, $tagger_s, map {"title":$title })
    };

 (:function build_static_batch_tag:)
declare
  %rest:path("/book_fiction/build_static_batch_tag")
  %rest:POST
  function book_fiction:build_static_batch_tag()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\paragraph.php'))
    };    

 (:function book_fiction:build_dynamic_tag:)
 (:function to make a file called dynamic_tag.xml through dynamic_tag.php:)
declare
  %rest:path("/book_fiction/build_dynamic_tag")
  %rest:POST
  %rest:form-param("tagger","{$tagger}", "(no message)")  
  function book_fiction:build_dynamic_tag($tagger as xs:string)
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\dynamic_tag.php',$tagger))
    };    
    
 (:function book_fiction:build_dynamic_tag using regex:)
declare
  %rest:path("/book_fiction/build_d_r_t") (:build_dynamic_regex_tag:)
  %rest:POST
  %rest:form-param("tagger","{$tagger}", "(no message)")  
  function book_fiction:b_d_tag($tagger as xs:string)
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\dynamic_regex_tag.php',$tagger))
    };        
    
 (:function book_fiction:advanced_tag:)
 (:function to make a file called *.xml through advanced_tag.php:)
declare
  %rest:path("/book_fiction/advanced_tag")
  %rest:POST  
  %rest:form-param("tagger","{$tagger}", "(no message)") 
  %rest:form-param("num","{$n}", "(no message)")  
  %rest:form-param("file","{$f}", "(no message)")
(: 
  %rest:form-param("tag","{$tag}", "(no message)")
  %rest:form-param("length1","{$len1}", "(no message)")
  %rest:form-param("length2","{$len2}", "(no message)")
  %rest:form-param("occurrence","{$occur}", "(no message)")  
:)    

  function book_fiction:advanced_tag($tagger as xs:string, $n as xs:string, $f as xs:string)
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\advanced_tag.php',$tagger,$n,$f,"c"))
    };    

(:function to modify <con_header_trans/> tag:)
 declare
  %rest:path("/book_fiction/in_once")
  %rest:GET
 
  function book_fiction:in_once(){
     proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\in_once.php'))
  };



(:function to modify <con_header_trans/> tag:)
 declare
  %rest:path("/book_fiction/re_con_header_trans")
  %rest:GET
 
  function book_fiction:re_con_header_trans(){
     proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\re_con_header_trans.php'))
  };

(:function to translate the English sentences:)
 declare
  %rest:path("/book_fiction/con_header_trans/{$num}")
  %rest:POST
  %rest:form-param("con_header_trans","{$con_header_trans}", "(no message)")
  %updating
  function book_fiction:con_header_trans($con_header_trans as xs:string,$num as xs:int){
    replace value of node doc("./xml/book_fiction.xml")/book/body/item[$num]/contents/con_header_trans with $con_header_trans
  };

 (:function to tag <sen/> to the English sentences.:)
 (:to make it look good:)
declare
  %rest:path("/book_fiction/sen_tag")
  %rest:GET 
  function book_fiction:sen_tag()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\sen_tag.php'))
    };  

 (:function to number the English sentences:)
declare
  %rest:path("/book_fiction/sen_numbering")
  %rest:GET 
  %updating
  function book_fiction:sen_numbering()
    {
        let $book := doc("./xml/book_fiction_final.xml")
        for $contents at $pos in $book/book/body/item[2]/contents/con_header/p
        let $sen := $contents/sen
        let $num := if(exists($sen)) then sum(($pos,-4)) else (($pos,-1))
        return
        if(exists($sen)) 
            then insert node $num as first into $sen
            else ()
    };  

 (:function book_fiction:bold attach tag <bold></bold> on English characters:)
 (:to make it look good:)
declare
  %rest:path("/book_fiction/bold")
  %rest:GET 

  function book_fiction:bold()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\bold.php'))
    };    

 (:function book_fiction:bold attach tag <quote></quote> on English characters:)
 (:to make it look good:)
declare
  %rest:path("/book_fiction/quote")
  %rest:GET 

  function book_fiction:quote()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\quote.php'))
    };    
    
    

 (:function book_fiction:pic. attach tag <pic></pic> for the pictures:)
 (:to make it look good:)
declare
  %rest:path("/book_fiction/pic")
  %rest:GET 
  function book_fiction:pic()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\pic.php'))
    };    

 (:function book_fiction:pic. attach tag <wordle></worlde> for the wordle pictures:)
 (:to make it look good:)
declare
  %rest:path("/book_fiction/wordle")
  %rest:GET 
  function book_fiction:worlde()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\wordle.php'))
    };    

 (:function book_fiction:pic. attach tag <pic></pic> for the pictures:)
 (:to make it look good:)
declare
  %rest:path("/book_fiction/title2")
  %rest:GET 
  
  function book_fiction:title2()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\title2.php'))
    };   
    
 (:function book_fiction:pic. attach tag <chap></chap> for the pictures:)
 (:to make it look good:)
 (:deprecated:)
declare
  %rest:path("/book_fiction/chap_tag")
  %rest:GET 
  function book_fiction:chap_tag()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\chap_tag.php'))
    };       

 (:function howtomakeabook:)
 declare
  %rest:path("/sourcesystem")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd") 
  function book_fiction:sourcesystem(){
       let $title := "Source System"
       let $source := doc("./xml/sourcesystem.xml")
       let $style := doc("./xsl/sourcesystem.xsl")      
       return xslt:transform($source, $style, map{"title":$title})
  };   
    
 (:function dynamic_tagging:)
declare
  %rest:path("/book_fiction/dynamic_tagging")
  %rest:POST
  %rest:form-param("num","{$n}", "(no message)")
  %rest:form-param("num2","{$n2}", "(no message)")
  %rest:form-param("tag","{$tag}", "(no message)")
  %rest:form-param("length1","{$len1}", "(no message)")
  %rest:form-param("length2","{$len2}", "(no message)")
  %rest:form-param("occurrence","{$occur}", "(no message)")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function book_fiction:dynamic_tagging($n as xs:int, $n2 as xs:int, $tag as xs:string, $len1 as xs:int, $len2 as xs:int, $occur as xs:int)
    {
        let $url := concat("./xml/tagged files/",$tag,".xml")
        for $data in doc($url)/paragraphs/paragraph[tags/tag=$tag][position() mod $n =$n2]
        where $data/tags/length>$len1 and $data/tags/length<$len2 and $data/tags/occurrences>=$occur
        order by  xs:integer($data/tags/length)
        return 
        <p>{$data/text()}</p>
    };
    
(:copied function dynamic_tagging:)
 (:function regex_tag_search:)
declare
  %rest:path("/book_fiction/regex_tag_search")
  %rest:POST
  %rest:form-param("num","{$n}", "(no message)")
  %rest:form-param("num2","{$n2}", "(no message)")
  %rest:form-param("length1","{$len1}", "(no message)")
  %rest:form-param("length2","{$len2}", "(no message)")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function book_fiction:regex_tag_search($n as xs:int, $n2 as xs:int, $len1 as xs:int, $len2 as xs:int)
    {
        let $url := concat("./xml/tagged files/","regex",".xml")
        for $data in doc($url)/paragraphs/paragraph[position() mod $n =$n2]
        where $data/tags/length>$len1 and $data/tags/length<$len2
        order by  xs:integer($data/tags/length)
        
        return 
        <p>{$data/text()}</p>
    };

 (:function howtomakeabook:)
 declare
  %rest:path("/howtomakeabook")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd") 

  function book_fiction:howtomakeabook(){
       let $book_fiction := doc("./xml/howtomakeabook.xml")
       let $style := doc("./xsl/howtomakeabook.xsl")      
       return xslt:transform($book_fiction, $style)
  };   
  

 
 (:copied book_fiction:p_tag:) 
 (:function to insert <t> tag:)
 declare
  %rest:path("/book_fiction/t_tag")
  %rest:GET
  function book_fiction:t_tag(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\t_tag.php')
  };   

 (:copied book_fiction:t_tag:) 
 (:function to insert <tip> tag:)
 declare
  %rest:path("/book_fiction/tip_tag")
  %rest:GET
  function book_fiction:tip_tag(){
    proc:execute('php.exe', 'C:\Program Files (x86)\BaseX\webapp\Making sentences\tip_tag.php')
  };     
  

 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/book_fiction/utf")
  %rest:GET
  
  function book_fiction:utf(){
     proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\UTF-8_iconv.php', "C:\Program Files (x86)\BaseX\webapp\xml/book_fiction_final.xml"))
  };

  
 
 (:function to rename <p/> tag into, i,e, <p1/><p2/><p3/>:)
 (:It took a few days to produce this code:)
 declare
  %rest:path("/book_fiction/p_rename")
  %rest:GET
  %updating
  function book_fiction:p_rename(){
      (:rename p node:)
      let $book := doc("./xml/book_fiction_final.xml")
      let $item := $book/book/body/item
      
      for $node at $pos in $item
      for $page at $pos2 in $node/contents/page
      for $p at $pos3 in $page/p
        
        let $temp := if($pos3 < 5) then $pos3 
                      else if($pos3 mod 2=1) then "_odd" 
                      else "_even"
        
        let $temp2 :=  $pos3 (:This is for numbering the sentences in the page of verbid and clause:)

      return 
        (: Don't rename <p/> to <p1/>, <p2/>, ... if it is <p/> tag in page[1] and page[2] in chapter 1 or 2 or 5 :)
        if((($pos>1 and $pos<19)  or ($pos>39 and $pos<44)) and ($pos2=1 or $pos2=2)) then ()
        
        else if($pos>44 and $pos<46 and ($pos2=6)) then ()        
     
        (: tag <p1/>, <p2/>, <p3/>, etc,,, only if the style of an item is preposition or verb :)
        else if($node/style/preposition or $node/style/verb or $node/style/think_in_english)
        then
            rename node $p as concat("p",$temp)
            
        (:This is for numbering the sentences in the page of verbid and clause:)    
        else if(($node/style/verbid or $node/style/clause) and ($pos2>2) and ($pos2<6)  )
        then
            rename node $p as concat("p",$temp2,"t")        
        else ()      

  }; 
  
  
(:
        (: Don't rename <p/> to <p1/>, <p2/>, ... if it is <p/> tag in page[1] and page[2] in chapter 1 or 2 or 3 :)
        if($pos>1 and $pos<32 and ($pos2=1 or $pos2=2)) then ()
        
        else if($pos>44 and $pos<46 and ($pos2=6)) then ()        
     
        (: tag <p1/>, <p2/>, <p3/>, etc,,, only if the style of an item is preposition or verb :)
        else if($node/style/preposition or $node/style/verb or $node/style/think_in_english)
        then
            rename node $p as concat("p",$temp)
            
        (:This is for numbering the sentences in the page of verbid and clause:)    
        else if(($node/style/verbid or $node/style/clause) and ($pos2>2))
        then
            rename node $p as concat("p",$temp2,"t")        
        else ()
:)  
  
  
   

 (:function to number <t></t>:)
 (:It copied book_fiction:p_rename:)
 declare
  %rest:path("/book_fiction/t_rename")
  %rest:GET
  %updating
  function book_fiction:t_rename(){
      (:rename p node:)
      let $book := doc("./xml/book_fiction_final.xml")
      let $item := $book/book/body/item
      
      for $node at $pos in $item
      for $page at $pos2 in $node/contents/page
      for $t at $pos3 in $page/trans/t
      return 
    
        (:This is for rename <t></t> <trans></trans>:)    
        if(($node/style/verbid or $node/style/clause))
        then
            rename node $t as concat("t",$pos3)
        else ()
  };  
 
 (:function to replace ttlloc:)
 (:It copied book_fiction:p_rename:)
 (:This funciotn is deprecated:)
 declare
  %rest:path("/book_fiction/ttlloc_replace")
  %rest:GET
  %updating
  function book_fiction:ttlloc_replace(){
      (:rename p node:)
      let $book := doc("./xml/book_fiction_final.xml")
      let $item := $book/book/body/item
      
      for $node at $pos in $item
      for $page at $pos2 in $node/contents/page
      let $ttlloc := $page/child::text()[1]  (:Remember this expression to extract text node, took a long time:)
      let $sub := substring($ttlloc,7)
      return 
      (:This is for replace ttlloc:)  
        if(($node/style/verbid or $node/style/clause))
        then
            replace node $page/child::text()[1] with <title2>{$sub}</title2>
        else ()
  };  

(:function to direct tag from paragraph.txt not through xml file:)
 declare
  %rest:path("/book_fiction/direct_tag")
  %rest:POST
  %rest:form-param("tag","{$tag}", "(no message)")
  %rest:form-param("len1","{$len1}")
  %rest:form-param("len2","{$len2}")
  %rest:form-param("occurrence","{$occur}")
  function book_fiction:direct_tag($tag as xs:string, $len1 as xs:string,$len2 as xs:string, $occur as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\tag.php', $tag, $occur,$len1, $len2))
  };

(:function to collect source from websites:)
(:copied function book_fiction direc_tag:)
 declare
  %rest:path("/book_fiction/source_collecting")
  %rest:POST
  %rest:form-param("url","{$url}", "(no message)")
  %rest:form-param("category","{$category}", "(no message)")  

  function book_fiction:source_collecting($url as xs:string, $category as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\source_collecting.php', $url, $category))
  };  

 (:function pdf to open pdf file "book_fiction.pdf":)
 declare
  %rest:path("/book_fiction/pdf")
  %rest:GET
  function book_fiction:pdf(){
    proc:execute('AcroRd32.exe', 'C:\Program Files (x86)\BaseX\webapp\book_fiction.pdf')
  };  

 (:function modify:)
 declare
  %rest:path("/book_fiction/form2/howtowrite/{$num}")
  %rest:POST
  %rest:form-param("item","{$item}","(no message)")
  %updating
  function book_fiction:howtowrite($num as xs:int, $item as xs:string){
    replace value of node doc("./xml/book_fiction_howtowrite.xml")/book/body/item[$num]/howtowrite with $item
  };
  
 (:function modify:)
 declare
  %rest:path("/book_fiction/form2/modify/{$num}")
  %rest:POST
  %rest:form-param("mod","{$mod}", "(no message)")
  %updating
  function book_fiction:modify($mod as xs:string,$num as xs:int){
    replace value of node doc("./xml/book_fiction.xml")/book/body/item[$num]/contents/con_header with $mod
  };

 (:function page_modify:)
 declare
  %rest:path("/book_fiction/form2/page_modify/{$num}/{$page_num}")
  %rest:POST
  %rest:form-param("page","{$page}", "(no message)")
  %updating
  function book_fiction:page_modify($page as xs:string,$num as xs:int, $page_num as xs:int){
    
    let $book := doc("./xml/book_fiction.xml")
    
    return
      if($num=101) then
       replace value of node $book/book/front/child::*[$page_num] with $page
      else if($num=102) then
       replace value of node $book/book/back/child::*[$page_num] with $page
      else
       replace value of node doc("./xml/book_fiction.xml")/book/body/item[$num]/contents/page[$page_num]/text() with $page
  };
  
 (:function page_trans_modify:)
 declare
  %rest:path("/book_fiction/form2/page_trans_modify/{$num}/{$page_num}")
  %rest:POST
  %rest:form-param("page_trans","{$page_trans}", "(no message)")
  %updating
  function book_fiction:page_trans_modify($page_trans as xs:string,$num as xs:int, $page_num as xs:int){
    
    let $book := doc("./xml/book_fiction.xml")
    
    return
      if($num=101) then
       replace value of node $book/book/front/child::*[$page_num] with $page_trans
      else if($num=102) then
       replace value of node $book/book/back/child::*[$page_num] with $page_trans
      else
       replace value of node doc("./xml/book_fiction.xml")/book/body/item[$num]/contents/page[$page_num]/trans with $page_trans
  };  
  
 (:copied page_trans_modify:)  
 (:function page_tips_modify:)
 declare
  %rest:path("/book_fiction/form2/page_tips_modify/{$num}/{$page_num}")
  %rest:POST
  %rest:form-param("page_tips","{$page_tips}", "(no message)")
  %updating
  function book_fiction:page_tips_modify($page_tips as xs:string,$num as xs:int, $page_num as xs:int){
    let $book := doc("./xml/book_fiction.xml")
    return
      if($num=101) then
       replace value of node $book/book/front/child::*[$page_num] with $page_tips
      else if($num=102) then
       replace value of node $book/book/back/child::*[$page_num] with $page_tips
      else
       replace value of node $book/book/body/item[$num]/contents/page[$page_num]/tips with $page_tips
  };    
  
 (:function reserve:)
 declare
  %rest:path("/book_fiction/form2/reserve/{$num}")
  %rest:POST
  %rest:form-param("reserve","{$reserve}", "(no message)")
  %updating
  function book_fiction:reserve($reserve as xs:string, $num as xs:int){
    let $book := doc("./xml/book_fiction.xml")
    return
       replace value of node doc("./xml/book_fiction.xml")/book/body/item[$num]/contents/reserve with $reserve
  };  
  
 (:function book_fiction:build_dynamic_tag:)
 (:function to make a file called dynamic_tag.xml through dynamic_tag.php:)
declare
  %rest:path("/book_fiction/copy")
  %rest:GET
  function book_fiction:copy()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\book_fictioncopy.php'))
    };   
 (:function book_fiction:build_dynamic_tag:)
 (:function to make a file called dynamic_tag.xml through dynamic_tag.php:)
declare
  %rest:path("/book_fiction/reverse_copy")
  %rest:GET
  function book_fiction:reverse_copy()
    {
        proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\book_fiction_r_copy.php'))
    };       
  :)
    