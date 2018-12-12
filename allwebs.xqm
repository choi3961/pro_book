module namespace allwebs='http://www.allwebs.com/webpage';
(:declare option db:writeback 'true';:)

 (:function book2:)
declare
  %rest:path("/allwebs/overview/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:allwebs($num as xs:int)
    {
       let $allwebs := doc("./xml/allwebs.xml")
       let $style := doc("./xsl/allwebs.xsl") 
       let $process := doc("./xml/work_process.xml")
             
       let $root  := "allwebs"
       let $title := "Over View"
     
       let $memo := $allwebs/allwebs/memo
       let $queue := $allwebs/allwebs/queue
       
       return xslt:transform($allwebs, $style, map {"num":$num, "title": $title, "root":$root, 
                             "memo":$memo, "queue":$queue,"process":$process})
    };


 (:function proof for <tips/> tag in book2 :)
 declare
  %rest:path("/allwebs/proof_1")
  %rest:GET

  function allwebs:proof_1(){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\proof_1.php'))
  };

 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/allwebs/xml_tostring")
  %rest:GET

  function allwebs:xml_to_string(){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\xml_tostring.php'))
  };


 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/allwebs/check_utf_8")
  %rest:POST
  %rest:form-param("file","{$file}","(no message)")  

  function allwebs:check_utf_8($file as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\UTF-8_iconv.php', $file))
  };

 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/allwebs/find_words")
  %rest:POST
  %rest:form-param("string","{$string}","(no message)")
  %rest:form-param("directory","{$directory}","(no message)")  
  function allwebs:find_words($string as xs:string, $directory as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\find_words.php',$string, $directory))
  };


 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/allwebs/modify")
  %rest:POST
  %rest:form-param("file","{$file}","(no message)")  

  function allwebs:modify($file as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\modify.php', $file))
  };
  
 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/allwebs/str_replace")
  %rest:POST
  %rest:form-param("str1","{$str1}","(no message)")  
  %rest:form-param("str2","{$str2}","(no message)")    

  function allwebs:str_replace($str1 as xs:string, $str2 as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\str_replace.php', $str1, $str2))
  };  


 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/allwebs/rearrange_paragraph")
  %rest:POST
  %rest:form-param("rearrange","{$rearrange}","(no message)")
  function allwebs:rearrange_paragraph($rearrange as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\rearrange_paragraph.php',$rearrange))
  };

 (:function remove_nbsp  copied function add :)
 declare
  %rest:path("/allwebs/remove_substring")
  %rest:POST
  %rest:form-param("substring","{$substring}","(no message)")
  %rest:form-param("file_name","{$file_name}","(no message)")
  function allwebs:remove_substring($substring as xs:string, $file_name as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\remove_substring.php' ,$substring, $file_name))
  };


 (:function signal system for book2:)
declare
  %rest:path("/allwebs/signals")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:signals()
    {
       let $allwebs := doc("./xml/signals.xml")
       let $style := doc("./xsl/signals.xsl") 
       let $title := "Book2 Signals and Frame"
       let $how := doc("./xml/book2_howtowrite.xml")/book/body/item[title="work process"]/howtowrite/text()
       
       return xslt:transform($allwebs, $style, map {"title":$title, "how":$how})
    };
    
 (:function work_process; Modify elements to design a page, Modify design elements of a page :)
 declare
  %rest:path("/allwebs/signal_system/{$sig}/{$this}")
  %rest:POST
  %rest:form-param("source","{$source}","(no message)")
  %updating
  function allwebs:signal_system($source as xs:string, $sig as xs:integer, $this as xs:integer){
    let $s := $source
    return       
    replace value of node doc("./xml/signals.xml")/signals/signal[$sig]/contents/point/elements/element[$this]/design_elements with $s
  };

 (:function work_process; Modify elements to design a page, Modify design elements of a page :)
 declare
  %rest:path("/allwebs/work_process/design/{$proc}/{$this}")
  %rest:POST
  %rest:form-param("source","{$source}","(no message)")
  %updating
  function allwebs:work_process($source as xs:string, $proc as xs:integer, $this as xs:integer){
    let $s := $source
    return       
    replace value of node doc("./xml/work_process.xml")/processes/process[$proc]/contents/point/elements/element[$this]/design_elements with $s
  };

 (:function add; add a source :)
 declare
  %rest:path("/allwebs/sourcesystem/add/{$this}")
  %rest:POST
  %rest:form-param("source","{$source}","(no message)")
  %updating
  function allwebs:add($source as xs:string, $this as xs:integer){
    let $s := <source>
              <title>{$source}</title>
              <uri></uri> 
            </source>
    return            
    insert node  $s into doc("./xml/sourcesystem.xml")/sourcesystem/sub_system[$this]/*
  };
  
 (:collect web contents and transform it into text file:)
 declare
  %rest:path("/allwebs/sourcesystem/web")
  %rest:POST
  %rest:form-param("web","{$web}","(no message)")
  function allwebs:web($web as xs:string){
    proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\web_contents.php' ,$web))
  };
  
 (:function modify:)
 declare
  %rest:path("/allwebs/howtowrite/work_process")
  %rest:POST
  %rest:form-param("item","{$item}","(no message)")
  %updating
  function allwebs:howtowrite($item as xs:string){
    replace value of node doc("./xml/book2_howtowrite.xml")/book/body/item[title="work process"]/howtowrite with $item
  };

 (:function work process:)
declare
  %rest:path("/allwebs/process")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:process()
    {
       let $allwebs := doc("./xml/work_process.xml")
       let $style := doc("./xsl/work_process.xsl") 
       let $title := "Work process"
       let $how := doc("./xml/book2_howtowrite.xml")/book/body/item[title="work process"]/howtowrite/text()
       return xslt:transform($allwebs, $style, map {"title":$title, "how":$how})
    };

 (:function book2:)
declare
  %rest:path("/allwebs/book2_map")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:book2_map()
    {
       let $book2 := doc("./xml/book2.xml")
       let $style := doc("./xsl/book2_map.xsl") 
       let $title := "Work process"
       return xslt:transform($book2, $style, map {"title":$title})      
    };

 (:function book2:)
declare
  %rest:path("/allwebs/book2_xml")
  %rest:GET
  function allwebs:book2_xml()
    {
       let $book2 := doc("./xml/book2.xml")
       return $book2
    };
    
 (:function book2:)
declare
  %rest:path("/allwebs/regular/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:regular($num as xs:int)
    {
       let $allwebs := doc("./xml/allwebs.xml")
       let $style := doc("./xsl/regular_webs.xsl")   
       let $root  := "allwebs"
       let $title := "Regular Web"
       let $memo := $allwebs/allwebs/memo
       let $queue := $allwebs/allwebs/queue
       return xslt:transform($allwebs, $style, map {"num": $num, "title": $title, "root":$root, "memo":$memo, "queue":$queue})
    };

 (:function book2:)
declare
  %rest:path("/allwebs/xml/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:xml($num as xs:int)
    {
       let $allwebs := doc("./xml/allwebs.xml")
       let $style := doc("./xsl/xml_webs.xsl") 
       let $root  := "allwebs"
       let $title := "XML Web"
       let $memo := $allwebs/allwebs/memo
       let $queue := $allwebs/allwebs/queue
       return xslt:transform($allwebs, $style, map {"num": $num, "title": $title, "root":$root, "memo":$memo, "queue":$queue})
    };

 (:function book2:)
declare
  %rest:path("/allwebs/file/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:file($num as xs:int)
    {
       let $allwebs := doc("./xml/allwebs.xml")
       let $style := doc("./xsl/file_webs.xsl") 
       let $root  := "allwebs"
       let $title := "File Web"
       let $memo := $allwebs/allwebs/memo
       let $queue := $allwebs/allwebs/queue
       return xslt:transform($allwebs, $style, map {"num": $num, "title": $title, "root":$root, "memo":$memo, "queue":$queue})        
    };

 (:function file_port:)
declare
  %rest:path("/allwebs/file/port/{$dir}/{$file}")
  %rest:GET
  function allwebs:file_port($dir as xs:string, $file as xs:string)
    {
       let $loc := "C:\Users\user\Desktop\goal\class_harvard\fundamental web\"
       return
          proc:execute('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe', concat($loc,$dir,"/",$file))
    };

 (:function file_port2:)
declare
  %rest:path("/allwebs/file/port2/{$dir}/{$file}")
  %rest:GET
  function allwebs:file_port2($dir as xs:string, $file as xs:string)
    {
       let $loc := "C:\Users\user\Desktop\goal\class_harvard\CSCIE-3 javascript\"
       return
          proc:execute('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe', concat($loc,$dir,"/",$file))
    };

 (:function file_port2:)
declare
  %rest:path("/allwebs/file/port3/{$dir}/{$file}")
  %rest:GET

  function allwebs:file_port3($dir as xs:string, $file as xs:string)
    {
       let $loc := "C:\Users\user\Desktop\goal\class_harvard\CSCIE-3 javascript\"
       return
          proc:execute("C:\Users\user\Desktop\Sublime Text Build 3083 x64\sublime_text.exe", concat($loc,$dir,"\js","/",$file))
    };

 (:function file_port2:)
declare
  %rest:path("/allwebs/code/in_once")
  %rest:GET
  function allwebs:code_in_once()
    {
       let $root := "C:\Users\user\Desktop\goal\class_harvard\CSCIE-3 javascript\"
       let $loc := "cscie3ProjectUnit1\js\"
       let $file := "project1.js"
       let $file2 := "project2.js"
       let $loc2 := "cscie3ProjectUnit2A\js\"
       let $file3 := "hw2ArrayImageProcessing.js"
       let $file4 := "hw2ArrayImageProcessingSetup.js"       
       let $file5 := "hw2ConvertTemp.js"
       let $file6 := "hw2PutAnX.js"       
       let $file7 := "hw2SplitString.js"
       let $file8 := "hw2TwelveEvenFib.js"       
       let $file9 := "wordcount.js"
       let $loc3 := "CSCIE3ProjectUnit2B\js\"
       let $file10 := "project2b.js"
       let $loc4 := "CSCIE3ProjectUnit3A\js\"
       let $file11 := "hw3a.js"       
       let $loc5 := "CSCIE3ProjectUnit3B\js\"
       let $file12 := "hw3b.js"        
       let $loc6 := "CSCIE3ProjectUnit4\js\"
       let $file13 := "transcript.js"       
       let $loc7 := "CSCIE3FinalProject\js\"
       let $file14 := "control.js"     
       
       let $a := concat($root,$loc,$file)
       let $b := concat($root,$loc,$file2)
       let $c := concat($root,$loc2,$file3)
       let $d := concat($root,$loc2,$file4)       
       let $e := concat($root,$loc2,$file5)
       let $f := concat($root,$loc2,$file6)       
       let $g := concat($root,$loc2,$file7)
       let $h := concat($root,$loc2,$file8)       
       let $i := concat($root,$loc2,$file9)
       let $j := concat($root,$loc3,$file10)     
       let $k := concat($root,$loc4,$file11)
       let $l := concat($root,$loc5,$file12)    
       let $m := concat($root,$loc6,$file13)
       let $n := concat($root,$loc7,$file14) 
       
       (:for $web in doc("./xml/allwebs.xml")/allwebs/body/code/web:)
       (:let $code := $web/contents/link/text():)
       return
          proc:execute("C:\Users\user\Desktop\Sublime Text Build 3083 x64\sublime_text.exe", ($a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n))
    };

 (:function book2:)
declare
  %rest:path("/allwebs/lab/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:lab($num as xs:int)
    {
       let $allwebs := doc("./xml/allwebs.xml")
       let $style := doc("./xsl/lab_webs.xsl") 
       let $title := "Laboratory"
     
       return xslt:transform($allwebs, $style, map {"num": $num, "title": $title})
    };

 (:function update  copied allwebs:lab() :)
declare
  %rest:path("/allwebs/update")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:update()
    {
       let $allwebs := doc("./xml/allwebs.xml")
       let $style := doc("./xsl/update.xsl") 
       let $title := "Laboratory"
     
       return xslt:transform($allwebs, $style)
    };    
    

 (:function book2:)
declare
  %rest:path("allwebs/overview/up_bookmarks")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function allwebs:up_bookmarks()
    {
      proc:execute('php.exe', ('C:\Program Files (x86)\BaseX\webapp\Making sentences\bookmarks.php'))
    };    

 (:function modify:)
 declare
  %rest:path("/allwebs/form2/memo")
  %rest:POST
  %rest:form-param("item","{$item}","(no message)")
  %updating
  function allwebs:memo($item as xs:string){
    replace value of node doc("./xml/allwebs.xml")/allwebs/memo with $item
  };    

 (:function modify:)
 declare
  %rest:path("/allwebs/form2/queue")
  %rest:POST
  %rest:form-param("item","{$item}","(no message)")
  %updating
  function allwebs:queue($item as xs:string){
    replace value of node doc("./xml/allwebs.xml")/allwebs/queue with $item
  };  
  
