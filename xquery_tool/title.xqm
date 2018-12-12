declare option db:writeback 'true';


(:this function replace text() node in <page/> node with title added:)
(:It extracts the text node from page node and it turns the text node into string using string() function :)
(:It concats title string and the string from text() node:)

let $book := doc("../xml/book2.xml")

(:It extracts the text node in the <page/> node :)
let $page := $book/book/body/item[44]/contents/page[2]/text()

(: And it turns the text node into string using string() function :)
let $str := string($page)

(:It concats title string and the string from text() node:)
let $str2 := concat("ttlloc 영어가 길어지는 이유","&#xD;",$str)

(:It replaces the text() node in <page/> node with the new concatenated string:)
return
    replace value of node $page with $str2