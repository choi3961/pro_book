declare option db:writeback 'true';

let $book := doc("../xml/book2.xml")



let $chapter := $book/book/body/item[position()=1]/title

   return replace value of node $chapter with "Chapter I Preposition and Verbid"   
 

(:



replace value of node $item with "부사절 (Adverbial Clause)"

for $node at $pos in $item
for $page at $pos2 in $node/contents/page

  let $page_tips := $page/tips
  
  let $normal := normalize-space($page_tips)
  
  let $normal2 := replace($normal,'[^A-Za-z\s]', '')

    return 
        if($pos>34 and $pos<46 and $pos2>3 and $pos2<7) then  replace value of node $page_tips  with $normal2
        else()   


 replace value of node $page_tips  with $normal

  let $normal := normalize-space($page_tips)
  
  let $normal2 := replace($normal,'.' ,'')

        if($pos>1 and $pos<11 and $pos2>2 and $pos2<7) then replace value of node $page_tips  with $normal2
        else()
 
 
 replace value of node $page_tips  with $normal
 
 

replace value of node $target with "To 부정사 1"


let $file := doc("../xml/book2.xml")
let $text := $file/book/body/item[2]/contents/page[3]/text()
for $target in $file/book/body/item[position()=12 to 17]/contents/page[position()=3 to 6]/text()
let $replace := "none"
let $with := "none"
return
     replace value of node $target with $text
:)


(:
let $file := doc("../xml/work_process.xml")
let $target := $file/processes/process[position()=20]/contents/point/elements/element[7]/text()
let $replace := replace($target,"not completed \?\?\?","completed ***")
return
     replace value of node $target with $replace
:)  

  
(: replace node $text with  replace($text,'[^A-Za-z\s.]',''):)
(:rename <before_start></before_start> tag into <con_header></con_header> tag:)
(: And put it into <contents></contents> tag "in book_tans.xml" file:)