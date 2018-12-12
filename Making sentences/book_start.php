<?php
//Start a book by making a xml file from a txt file.

require_once("extensions02.php");

//to_xml_book();

first();

function first(){

	$title_length = 20;		// the length of string to be tagged as title from "first3.txt".
	$item_num = 0;
	$page_num = 0;
	$paragraph_num = 0;	
	$value = "/[0-9]{1,3}:[0-9]{1,3}/";		// regular expression preg_match() for 45:73	

	$book = new Book();

	$item = new Item("","","");

	$page = new Page("");

	$xml = new XMLSerializer();

	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp/static/neo/first_ori.txt", "r");

	while (!feof($file1)) {

		$str = fgets($file1);

		// if "sigschapter" is not first thing, register the previous "Item object" to "Book object".
		// if "sigschapter" is included in the string, make an "Item object" with the style of chapter.
		if (!(strpos($str, "sigschapter")===false)) {

			if ($item_num>0) {		//if met with another "item",
				// register the previous "item" to "book->body" with new key name.
				$key_name = "item".$item_num;
				$book->body[$key_name]= $item;
			}

			$str = str_replace("sigschapter", "", $str);
			$item = new Item("chapter", "$str", " ");

			$page_num = 0;  // when new item begins you should put $page_num = 0
		}

		// if "sigssection" is included in the string, do something.
		elseif (!(strpos($str, "sigssection")===false)) {
			if ($item_num>0) {		//if met with another "item",
				// register the previous "item" to "book->body" with new key name.
				$key_name = "item".$item_num;
				$book->body[$key_name]= $item;
			}

			$str = str_replace("sigssection", "", $str);
			$item = new Item("section", "$str", " ");

			$page_num = 0;  // when new item begins you should put $page_num = 0			
		}	

		// page part
		elseif((strlen($str)<$title_length) && (strlen($str)>3)){
			// if met with another "Page", register the previous page to the "Book" object
			if ($page_num>0) {

				$key_name = "page".$item_num;
				$item->contents[$key_name] = $page;
			}

			$page = new Page($str);		

			$page_num++;
		}

		// if the string is only paragraph.
		elseif(strlen($str)>=$title_length){
			$key_name = "p".$item_num;
			$page->p[$key_name] = $str;

			$page_num ++;	
		}		

		// line feed, carage return.
		else{
		}			

		$item_num ++;		
	}

	//file close. 
	fclose($file1);
	$result = $xml->generateValidXmlFromObj($book, "book", "page");
	echo $result;
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book_fiction_prac.xml", $result);
}

function item_add($book){

	$book->body->add_item(new Item("aa", "bb", "cc"));
}

class Book{
	public function __construct(){
		$this->front = new Front();
		$this->body  = array();
		$this->back = new Back();
	}		
}

class Front{
	public function __construct(){
		$this->title = "title";
		$this->preface = "preface";
		$this->colophone = "colophone";
	}			

}

class Item{
	public function __construct($val01, $val02, $val03){
		$this->style = $val01;
		$this->title = $val02;
		$this->contents = array();	
	}		
}

// right below of class Item
class Page{
	public function __construct($val01){
		$this->title = $val01;
	}			
}

class Back{
	public function __construct(){
		$this->epilogue = " aa";
		$this->afterword= " ";
		$this->index = " ";
	}		
}

class XMLSerializer {
    // functions adopted from http://www.sean-barton.co.uk/2009/03/turning-an-array-or-object-into-xml-using-php/
    public static function generateValidXmlFromObj($obj, $node_block='nodes') {

        $arr = get_object_vars($obj);

        return self::generateValidXmlFromArray($arr, $node_block, $node_name);
    }

    public static function generateValidXmlFromArray($array, $node_block='nodes') {

        $xml = '<?xml version="1.0" encoding="UTF-8" ?>';

        $xml .= PHP_EOL;

        $xml .= '<' . $node_block . '>'.PHP_EOL;

        $xml .= self::generateXmlFromArray($array);

        $xml .= '</' . $node_block . '>';

        return $xml;
    }

    private static function generateXmlFromArray($array) {

        $xml = '';
        if (is_array($array) || is_object($array)) {

            foreach ($array as $key=>$value) {
				// if "sigssection" is included in the string, do something.
				if (!(strpos($key, "item")===false)) {
					$key = "item";		
				}

				// if "sigssection" is included in the string, do something.
				elseif (!(strpos($key, "page")===false)) {
					$key = "page";		
				}

				// if "sigssection" is included in the string, do something.
				elseif (!(strpos($key, "p")===false)) {
					$key = "p";		
				}
				else{
					
				}
                //if (is_numeric($key)) {
                //   $key = $node_name;
                //}

				// if it contains "<p>" tag, remove the "<p>" tag for "fiction_final.xml".
				if ($key === "p") {

	                $xml .=self::generateXmlFromArray($value);
	                
	                $xml .=PHP_EOL;
				}
				else{

	                $xml .= "  ".'<' . $key . '>'.PHP_EOL. self::generateXmlFromArray($value) ."  ". '</' . $key . '>';
	                
	                $xml .=PHP_EOL;
				}

            }


        } else {

            //$xml = htmlspecialchars($array, ENT_QUOTES);
            $xml = $array.PHP_EOL;

        }
        return $xml;
    }
}