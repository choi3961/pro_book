declare option db:writeback 'true';

(:insert each page into reserve node:)

let $book := doc("../xml/book2.xml")

for $item in $book/book/body/item
  for $page in $item[position()=28]/contents/page
  let $text := $page/text()

return

(: insert node $page into $book/book/body/item[4]/contents/reserve   // This is for insert:)

delete node $text   (: // This is for delete :)


