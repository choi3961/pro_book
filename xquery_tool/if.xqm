declare option db:writeback 'true';

let $book := doc("../xml/book2.xml")
let $item := $book/book/body/item

for $node at $pos in $item

return

    if($pos > 45 and $pos < 47 )
    then 
        insert node <elementary/> as first into $node/style
    else
        ()
