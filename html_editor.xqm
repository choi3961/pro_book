module namespace html_editor='http://www.html_editor.com/webpage';
(:declare option db:writeback 'true';:)

 (:function first:)
declare
  %rest:path("/html_editor/{$num}")
  %rest:GET
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function html_editor:first($num as xs:int)
    {
       let $doc := doc("./xml/html_editor.xml")
       let $style := doc("./xsl/html_editor.xsl") 
       
       let $title := $doc/book/body/item[$num]/title     
       return xslt:transform($doc, $style, map {"doc":$doc, "num": $num, "title":$title })
    };

 (:function first:)
 declare
  %rest:path("/html_editor/source")
  %rest:GET
  function html_editor:source(){
    let $contents  := doc("./xml/html_editor.xml")
    return $contents
  };

 (:function modify:)
 declare
  %rest:path("/first/form2/modify/{$num}")
  %rest:POST
  %rest:form-param("mod","{$mod}", "(no message)")
  %updating
  function html_editor:modify($mod as xs:string,$num as xs:int){
    replace value of node doc("./xml/first.xml")/book/body/item[$num]/contents with $mod
  };

 (:function page_modify:)
 declare
  %rest:path("/first/form2/page_modify/{$num}/{$page_num}")
  %rest:POST
  %rest:form-param("page","{$page}", "(no message)")
  %updating
  function html_editor:page_modify($page as xs:string,$num as xs:int, $page_num as xs:int){
    replace value of node doc("./xml/first.xml")/book/body/item[$num]/contents/page[$page_num] with $page
  };