declare option db:writeback 'true';

(:remove text node from doc("book2.xml")/book/body/item/contents:)
(:rename p node:)

let $book := doc("../xml/book2.xml")
let $item := $book/book/body/item[position()=2]/contents/metaphor
 return
     delete node $item

(:




let $book := doc("../xml/book2_final.xml")
let $item := $book/book/body/item

for $node at $pos in $item[33]
for $page at $pos2 in $node/contents/page
let $ttlloc := $page/child::text()[1] :: Remember this expression to extract text node, took a long time
let $sub := substring($ttlloc,7)
return
   
trace($page/child::text()[1],"Hello : ")


        replace node $page/child::text()[1] with <title2>{$sub}</title2>
        
        
        
 
:)    
    
(:delete node $lastpage:)