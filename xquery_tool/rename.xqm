declare option db:writeback "true";

(:rename p node:)
let $book := doc("../xml/dumy_text.xml")
let $item := $book/signals
for $node in $item
 
return 
  rename node $node as "paragraphs"


(:rename p node

for $node at $pos in $item
for $node2 at $pos2 in $node/page
for $node3 at $pos3 in $node2/helloha
 
return 
  rename node $node3 as concat("hello",$pos3)
:)
