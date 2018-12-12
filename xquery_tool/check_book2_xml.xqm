declare option db:writeback 'true';

let $book := doc("../xml/book_fiction.xml")


 return
     $book/book

 (:
 
 for $t at $num in $title

  return
<title>{$num}. {data($t)}</title>
 

 
 if($trans)
 then ()
 else $page
 
 /book/body/item[1]/contents/page[1]/tips
 
for $item in $book/book/body/item
for $page in $item/contents/page
let $trans := $page/trans

   
 :)
 