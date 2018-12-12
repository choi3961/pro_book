declare option db:writeback 'true';

(:insert node <tips></tips> into doc("book2.xml")/book/body/item/contents/page:)

let $file := doc("../xml/book2.xml")
let $item := $file/book/body/item[position()=6]
let $item2 := $file/book/body/item[position()=20]
 return
    insert node $item after $item2
(:

replace value of node $title with "That 명사절 (Noun Clause)"

     

   if($page/trans) then ()
   
   else (  insert node <trans></trans> before $target
   )

let $text := $file/book/body/item[position()=29]/contents/page[position()=4]/trans/text()


let $file := doc("../xml/book2.xml")
for $item in $file/book/body/item[position()=37 to 47]
for $target in $item/contents/page[position()= 3 to 6]
let $tar := $target/tips

return
     insert node "hello tips" into $tar
:)

(:
insert node "first and second" as first into $page

let $item := $book/book/body/item[position()=28]
let $text := $item/contents/page[position()=4]/text()

for $item in $book/book/body/item[position()=36 to 46]
let $text2 := $item/contents/page[position()=4]

replace value of node $text2 with $text
insert node <trans/> as last into $text2


delete node $text2   

for $node at $pos in $item
let $targetpage := $node/contents/page[1]
let $replace := <page>ttlloc 기본 의미 </page>
       
return
if($pos>18 and $pos<27)
then
delete node $targetpage
else ()        
 :)    

(:      
return
if($pos>11 and $pos<27)
then
insert node  <page>ttlloc 의미의 확장</page> before $item[$pos]/contents/metaphor
else ()
:) 

(:
for $item in $book/book/body/item
  for $page in $item/contents/page

return
insert node  <trans/> into $page
:)