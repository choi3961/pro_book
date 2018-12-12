<?php
// makes a book file of xml for fiction genre from a txt file.
function to_xml_book(){

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
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp/static/neo/second33.txt", "r");

	while (!feof($file1)) {

		$str = fgets($file1);

		// if "sigschapter" is not first thing, register the previous "Item object" to "Book object".
		// if "sigschapter" is included in the string, make an "Item object" with the style of chapter.
		if (!(strpos($str, "sigschapter")===false)) {
				
			$key_name = "item".$item_num;

			if ($item_num>0) {		//if met with another "item",

				// register the previous "item" to "book->body" with new key name.
				$book->body[$key_name]= $item;
			}

			$str = str_replace("sigschapter", "", $str);
			$item = new Item("chapter", "$str", " ");

			$page_num = 0;  // when new item begins you should put $page_num = 0
		}

		// if "sigssection" is included in the string, do something.
		elseif (!(strpos($str, "sigssection")===false)) {

			$key_name = "item".$item_num;

			if ($item_num>0) {		//if met with another "item",
			
				// register the previous "item" to "book->body" with new key name.	
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
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book_fiction.xml", $result);
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

        return self::generateValidXmlFromArray($arr, $node_block);
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


// Attach paragraph tag
function font_option($val01, $val02){

	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/xsl/fiction_attribute.xsl", "r");

	$temp = "";
	$flag_tag = false;
	// read fiction_attribute.xsl string by string
	while (!feof($file1)) {

		$str = fgets($file1);
		//if the tag is related to the input tag call the function
		if(!(strpos($str, "<xsl:attribute-set")===false)){
			if (!(strpos($str, "'".$val01."'")===false)) {
				$flag_tag = true;	
			}
			else{
				$flag_tag = false;				
			}
			$temp .=$str;
		}

		else{
			if($flag_tag){		// if in the context
				if (!(strpos($str, "</xsl:attribute-set")===false)) {

					// insert new attribute tags here.
					$temp .= re_option($val02);

					$temp .= $str;
					$flag_tag = false;
				}

				elseif (!(strpos($str, "font-family")===false)) {
					$temp .= "";
				}

				else{
					$temp .= $str;
				}
			}

			else{
				$temp .= $str;
			}
		}
	}

	fclose($file1);	
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/static/xsl/fiction_attribute.xsl", $temp);	
	//echo $val01.$val02;
}

// Parse the string from the client for attributes in "fiction_attribute.xsl"
function re_option($arg01){

	$result = "<xsl:attribute name='font-family'>".$arg01."</xsl:attribute>".PHP_EOL;

	return $result;
};















function auth_mod($arg01, $arg02){
// step 1 : load the xml file of uuid

$file = "C:\Program Files (x86)\BaseX\webapp\xml/auth.xml";
$root = simplexml_load_file($file);


// step 2 : extract all the uuid string.

$uuid = $root->uuid;
$str = "";

foreach ($uuid as $key => $value) {
	foreach ($value as $key => $data) {

		$str .= (string)$data;

	}
}

// step 3 : check if there is the same uuid from the client.
// step 4 : send to the client "true or false" if the same uuid exist. 

if (!(strpos($str, $arg01)===false)) {
	//echo "true";
	echo $str;	
}

// step 5


// step 6

}

// wrap the <p> tags with <gut> tag using dom parser.
function gut_wrap(){
	$dom = new DOMDocument();
	$dom->load("C:\Program Files (x86)\BaseX\webapp\xml/book_fiction.xml");
	$pages = $dom->getElementsByTagName('page');

	//print_r($pages);

	$num = 0;
	$num02 = 0;

	foreach ($pages as $key => $value) {
		//$items = $dom->getElementsByTagName('page');
		$gut = $dom->createElement("gut");

		echo $num."= ";
		$num++;

		//echo $pages->length;

		$p = $value->getElementsByTagName('p');

		//print_r($p);
		//echo $p->length." ";
		/////////////////////

		foreach ($p as $value02) {
			//echo $value02->nodeName."== ";
			//echo "hello";
			if ($value02->nodeName=='p') {
				$p = $dom->createElement("aa");
				$imported = $dom->importNode($value02);

				$gut->appendChild($imported);

				//$value->removeChild($value02);

				echo $num02." ";
				
			}
			$num02++;
		}
		/*********
*****************/
		$num02 = 0;

		$value->insertBefore($gut, $value->childNodes[2]);
		//$value->appendChild($gut);
		//echo $gut->nodeName;
	}



	$dom->save("C:\Program Files (x86)\BaseX\webapp\xml/book_fiction.xml");



	//$simple = simplexml_load_file("C:\Program Files (x86)\BaseX\webapp\xml/book_fiction.xml");	

	// wrap p tags
	//$s = dom_import_simplexml($simple);


	// replace "<p> tags" with "<gut> tag"
}

//Show the font list to the display for user interface
function font_show(){

	$imagick = new Imagick();
	$fonts = $imagick->queryfonts();

	foreach ($fonts as $fontName) {
	echo iconv('EUC-KR', 'UTF-8', $fontName).'<br/>';
	}

}

// from "book_fiction.xml", "fiction_front.xml" "fiction_back.xml" to "book_fiction.xml"
// combine 3 files with publishing company's default (front part and back part).
function combine(){
	// There could be some problem about character set. &#xD; &#13; But resolved.
	// when you use ("1.0", 'UTF-8'), "&#13;" appears, when not use, you get "&#xD;"
	$dom = new DOMDocument();
	// for good format
	$dom->formatOutput = true;
	$dom->preserveWhiteSpace = false;

	$simple02 = simplexml_load_file("C:\Program Files (x86)\BaseX\webapp\xml/book_fiction.xml");
	$simple01 = simplexml_load_file("C:\Program Files (x86)\BaseX\webapp\xml/fiction_front.xml");
	$simple03 = simplexml_load_file("C:\Program Files (x86)\BaseX\webapp\xml/fiction_back.xml");

	// combine front part including root node
	$s = dom_import_simplexml($simple01);
	$temp = $dom->importNode($s, true);
	$dom->appendChild($temp);

	// combine body part without root node(<book>)
	$body = $simple02->body;
	$s = dom_import_simplexml($body);
	$temp = $dom->importNode($s, true);
	$book = $dom->lastChild;
	$book->appendChild($temp);

	// combine back part without root node(<book>)
	$back = $simple03->back;
	$s = dom_import_simplexml($back);
	$temp = $dom->importNode($s, true);
	$book = $dom->lastChild;
	$book->appendChild($temp);

	$dom->save("C:\Program Files (x86)\BaseX\webapp\xml/second.xml");

	// Reload the combined file 
	// There could be some problem about character set. But resolved.	
	$dom = new DOMDocument();
	// for good format
	$dom->formatOutput = true;
	$dom->preserveWhiteSpace = false;
	$dom->load("C:\Program Files (x86)\BaseX\webapp\xml/second.xml");

	// Save using DomDocument.
	$dom->save("C:\Program Files (x86)\BaseX\webapp\xml/book_fiction.xml");
}

//Make 'default_base.xml' to contain all tags and default setting, 
//and then change 'default.xml' with data of default_base.xml
function default_base(){
	/////////////////////// Step 1
	// from 'fiction_tag.xml' to 'default_base.xml' to contain all tags(without any default value).
	// open file
	$file2 = fopen("C:\Program Files (x86)\BaseX\webapp\static\default_set/default_base.xml", 'w');

	fputs($file2, "<defaults>".PHP_EOL);

	$obj = simplexml_load_file("C:\Program Files (x86)\BaseX\webapp\static/xml/fiction_tag.xml");

	foreach ($obj->tag as $key => $value) {
		$fruit = sub_default_base($value);
		fputs($file2, $fruit);
	}
	fputs($file2, "</defaults>");

	// close file
	fclose($file2);

	/////////////////////// Step 2
	// from 'default.xml' to 'default_base.xml' for all default settings.
	// load file
	$obj = simplexml_load_file("C:\Program Files (x86)\BaseX\webapp\static\default_set/default.xml");
	$obj02 = simplexml_load_file("C:\Program Files (x86)\BaseX\webapp\static\default_set/default_base.xml");

/******************
*******************/
		foreach ($obj->default as $key => $value) {
			foreach ($obj02->default as $key02 => $value02) {

				$a = (string)$value->context;
				$b = (string)$value02->context;
				$c = (string)$value->attribute->name;

				if ($a == $b) {
					foreach ($value->attribute as $key03 => $value03) {
						$attribute = $value02->addChild('attribute');
						$attribute->addChild('name', (string)($value03->name));
						$attribute->addChild('value', (string)($value03->value));
					}
				}
			}
		}

	// save as xml
	$obj02->asXml('C:\Program Files (x86)\BaseX\webapp\static\default_set/default_base.xml');

	/////////////////////////////////////
	$dom = new DOMDocument('1.0');
	// for good format
	$dom->formatOutput = true;
	$dom->preserveWhiteSpace = false;

	// this function work for good format.
	$dom->load("C:\Program Files (x86)\BaseX\webapp\static\default_set/default_base.xml");

	/******************* This part doesn't work for good format.
	//$dom_sxe = dom_import_simplexml($obj02);
	//$dom_sxe = $dom->importNode($dom_sxe, true);
	//$dom_sxe = $dom->appendChild($dom_sxe);
	************************/
	$xml = $dom->save("C:\Program Files (x86)\BaseX\webapp\static\default_set/default_base.xml");
	/////////////////////////////////////

	/////////////////////// Step 3 last step
	// from 'default_base.xml' to 'default.xml' in reverse.
	$temp = file_get_contents("C:\Program Files (x86)\BaseX\webapp\static\default_set/default_base.xml");
	file_put_contents("C:\Program Files (x86)\BaseX\webapp\static\default_set/default.xml", $temp);
}

function sub_default_base($arg){
	$str = "	<default>".PHP_EOL;
	$str .= "		<context>".$arg. "</context>".PHP_EOL;
	$str .= "	</default>".PHP_EOL;

	return $str;
}

// Save default : from default.xml to default_reserve.xml
function save_default(){
	// read default.xml
	$data = file_get_contents("C:\Program Files (x86)\BaseX\webapp\static\default_set/default.xml");

	// write to default_reserve.xml
	file_put_contents("C:\Program Files (x86)\BaseX\webapp\static\default_set/default_reserve.xml", $data);
	//echo "hello default";
}

//insert <p> tag into "fiction_final.xml" using hello.xml".
//avoid signal tags which are tagged previously.
//There is odd case that because of an alphabet, for example "t" in "the transformation" 
//and "l" in "for a long time", <p> tag doesn't work.
function p_tag(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/fiction_final.xml", "r");
	// make a new file
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$sig_self = false ;
	$sig_neg = false ;

	$reg = "/[A-za-z]/" ;
	$reg2 = '/[ㄱ-ㅎㅏ-ㅣ]/';
	$reg22 = "/&#x/";
	$ending = "/&#xD;/";

	$arr = array("/<.*>/");

	// under this tags, no <p> tag.
	$arr35 = array("<title>","<chap>","<style>");
	$arr36 = array("</title>","</chap>","</style>");

	while (!feof($file1)) {
		$temp = fgets($file1);


		// for signal tags.
		foreach ($arr as $key => $value) {
			if (preg_match($value, $temp)) {
				$sig_self = true ; 
			}	
		}
		foreach ($arr35 as $key => $value) {
			if (!(strpos($temp, $value) === false)) {
				$sig_neg = true ;
			}			
		}	
		foreach ($arr36 as $key => $value) {
			if (!(strpos($temp, $value) === false)) {
				$sig_neg = false ;
			}			
		}							

		// Filters if it tags <p> or not accroding to the signals and sentences.
		if ($sig_self or $sig_neg) {
			if (!(strpos($temp, "soon as the boche") === false)) {
				echo "Here+++++++++++";
			}
			 
		}

		// Filters out two kinds of forms :&#xD;, English sentences &#xD;
		// out of three forms : English sentences, English sentences &#xD;, and &#xD;
		elseif (preg_match($ending, $temp)) {
			if (strpos($temp, "&#xD;")) {
				$temp = "<p>".PHP_EOL.$temp."</p>".PHP_EOL;
			}
			else{
		
			}
		}
		// In case of only English sentences or blank line(zero string)
		else{
			// In case of only English sentences without "&#xD;".
			if (preg_match($reg, $temp)) {
				$temp = "<p>".PHP_EOL.$temp."</p>".PHP_EOL;
			}
			// In case of only Korean sentences without "&#xD;".
			elseif (preg_match($reg2, $temp)) {
				$temp = "<p>".PHP_EOL.$temp."</p>".PHP_EOL;
			}
			// In case of zero string.
			else{

			}
		}

		fputs($file2, $temp);

		$sig_self = false ;
	}	

	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/fiction_final.xml", $file);
}

// from "fiction_final.xml" to "fiction_final.xml"
// insert tag from user-inserted siganl.
function sig_tags(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/fiction_final.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$pic = "sigspic";
	$wordle ="sigswordle";
	$sigs = "sigs";
	$h_t = "H_T";			// for <half_tag/> to appear bold in the sentences.

	while (!feof($file1)) {
		$temp = fgets($file1);

		// evaluates <pic1/>, <pic2/>, <pic3/> ... ,using static value.
		if (  !(strpos($temp, $pic)=== false) ) {
			$temp = sub_pic($temp, $pic,0);
		}
		// evaluates <wordle1/>,<wordle2/>,<wordle3/>, ... ,using static value.
		elseif (  !(strpos($temp, $wordle)=== false) ) {
			$temp = sub_wordle($temp, $wordle, 0);
		}

		// evaluates <wordle1/>,<wordle2/>,<wordle3/>, ... ,using static value.
		elseif (  !(strpos($temp, $h_t)=== false) ) {
			$temp = sub_half_tag($temp, $h_t);
		}		

		// check all the sigs in array.
		else{

			if (  !(strpos($temp, $sigs) === false)  ) {
				$sigs_sen = trim($temp);

				$sigs_title = "";
				$count = 0 ;

				while (  !((strlen($sigs_sen))==($count))  ) {

					$s = substr($sigs_sen, $count, 1);
					if($s==" " || $s=="&"){
						break;
					}					
					$sigs_title .= $s;
					$count++;
				}
				//echo $sigs_title;
				$temp = signal_tag3($sigs_title, $sigs_sen);
			}
			else{
			}				
		}
		fputs($file2, $temp);
	}		
	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/fiction_final.xml", $file);
}


//////////////////////////////////////////
// Attach item tag
function attach_item_tag($str, $item, $style){

	$title = "";

	if ($item == 0) {
	}

	else{
		$title = PHP_EOL."</page>".PHP_EOL;
		$title .= PHP_EOL."</contents>".PHP_EOL;
		$title .= PHP_EOL."</item>".PHP_EOL;
	}

	$title .= PHP_EOL."<item>".PHP_EOL;
	$title .= "<style>".$style."</style>".PHP_EOL;
	$title .= "<title>".trim($str)."</title>".PHP_EOL;
	$title .= PHP_EOL."<contents>".PHP_EOL;

	return $title;
}



// Attach page tag
function attach_page_tag($str, $page){
	$title = "";
	if ($page == 0) {
	}

	else{
		$title = PHP_EOL."</page>".PHP_EOL;
	}	

	$title .= PHP_EOL."<page>".PHP_EOL;
	$title .= "<title>".trim($str)."</title>".PHP_EOL;
	return $title;
}

// Attach paragraph tag
function attach_paragraph($str){
	$contents = PHP_EOL.trim($str).PHP_EOL;
	return $contents;
}

// from display to "default.xml". The process is partly similar to the function "replace_attribute".
function to_default($arg01, $arg02){
	$first = str_replace('%20', ' ', $arg02);
	$first = str_replace('%23', '#', $first);

	//file_put_contents("C:\Users\Administrator\Desktop/neo/second55.txt", $arg02);

	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/default_set/default.xml", "r");

	$temp = "";
	$flag_tag = false;
	// read default.xml string by string
	while (!feof($file1)) {

		$str = fgets($file1);
		//if the context is met,
		if(!(strpos($str, "<context>".$arg01."</context>")===false)){
			$flag_tag = true;

			$temp .= $str;
		}

		elseif (!(strpos($str, "</default>")===false)) {
			if ($flag_tag) {
				$temp .= att_parse($first);

				$temp .= $str;			
			}
			else{
				$temp .= $str;
			}

			$flag_tag = false;
		}

		else{
			if ($flag_tag) {
				continue;
			}
			else{
				$temp .= $str;
			}
		}
	}

	// file close
	fclose($file1);	

	file_put_contents("C:/Program Files (x86)/BaseX/webapp/static/default_set/default.xml", $temp);
}

function att_parse($arg01){
	$odd_num = 0;		// check the signal "&" is the first or second to confirm 'name' and 'value' is paired.
	$temp = "";
	$name = "";
	$fruit01 = "";		// the data for the name of attribute.
	$fruit02 = "";		// the data for the value of attribute.
	$result = "";
	$str = $arg01;
	for ($i=0; $i <strlen($str) ; $i++) { 
		$char = substr($str, $i, 1);
		if ($char =="=") {
			$name = $temp;
			$temp .= $char;
			$temp = "";
		}
		elseif ($char =="&") {
			// if the name is first, go to fruit01, and if the name is second, go to fruit02.
			if ($name == 'first') {
				$fruit01 = $temp;				# code...
			}

			elseif($name == 'second'){

				$fruit02 = $temp;
			}
			else{
			}

			$name = "";
			$temp = "";
			$odd_num++;

			if ($odd_num % 2 == 0) {
				$result .= "				<attribute>".PHP_EOL;
				$result .= "					<name>".$fruit01."</name>".PHP_EOL;
				$result .= "					<value>".$fruit02."</value>".PHP_EOL;
				$result .= "				</attribute>".PHP_EOL;
			}			
		}
		else{
			$temp .= $char;		
		}	
	}

	$result .= "				<attribute>".PHP_EOL;
	$result .= "					<name>".$fruit01."</name>".PHP_EOL;
	$result .= "					<value>".$temp."</value>".PHP_EOL;
	$result .= "				</attribute>".PHP_EOL;

	return $result;	

}

/*************
1. Remove &#xD;
2. This application is for modifying book2.xml apperance of tags. for exmaple : <tags> appearance.
***********/

function modify333(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book_fiction.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");


/////////////////////////////////////////
	$arr55 = get_tags_from_fiction_xml();
/////////////////////////////////////////
	//print_r($arr55);

	$arr2 = ["<page>","</page>", "<chapter>","</chapter>","<trans/>","<trans>","</trans>",
	"<title>","</title>","<con_header>","</con_header>","<con_header_trans>",
	"</con_header_trans>","<con_header_trans/>","<tips>","</tips>","<preface>","</preface>"];	

//1. Remove &#xD;
	while (!feof($file1)) {
		$temp = fgets($file1);
		$temp = str_replace("&#xD;", "", $temp);

		foreach ($arr2 as $key => $value) {
			if (preg_match($value, $temp)) {
				$temp = str_replace($value, PHP_EOL.$value.PHP_EOL, $temp);
				//echo $value;
			}
		}
		fputs($file2, $temp);
	}

	fclose($file1);
	fclose($file2);	

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/fiction_final.xml", $file);	
}


// Sets <fo:page-sequence> in "fiction_fo.xsl" file according to the "fiction_final.xml".
// page-sequence from static/page_sequence/body_of_p_s.xml to 'fiction_fo.xsl'.
function default_fo(){
	$arr = [];
	$xml = simplexml_load_file("../webapp/xml/fiction_final.xml");

	$cur = $xml->xpath("body/item[style='chapter']");

	$num = count($xml->body->item);

	for ($i=0; $i < $num ; $i++) { 
		if ($xml->body->item[$i]->style == 'chapter') {
			array_push($arr, $i);
		}
		//echo $xml->body->item[$i]->style;
	}

	array_push($arr, $num);

	//print_r($arr);

	for ($i=0; $i < count($arr)-1; $i++) { 
		echo $arr[$i];
		echo $arr[$i+1];
		dis_page_sequence($arr[$i], $arr[$i+1]+1);
	}
}

// display body_part of page sequence.
function dis_page_sequence($num, $next){
	//$p_s = file_get_contents("../webapp/static/page_sequence/body_of_p_s.xml");	// data file

	// file open for fiction_fo.xsl
	$fo = fopen("../webapp/xsl/fiction_fo.xsl", "r");	// file for the data to be inserted in
	$file = fopen("../webapp/xsl/hello.xsl", "w");		// temp file.

	while (!feof($fo)) {
		$temp = fgets($fo);

		if (!(strpos($temp, "for back part")===false)) {

			//file open
			$n_f = fopen("../webapp/static/page_sequence/body_of_p_s.xml", "r");

			// file insert string by string
			while (!feof($n_f)) {
				$temp3 = fgets($n_f);
				if (!(strpos($temp3, "<xsl:apply-templates select=")===false)) {
					// parse the string with item location for each chapter.
					$temp3 = str_parse($num, $next);
				}
				fputs($file, $temp3);
			}

			// file close
			fclose($n_f);

			//fputs($file, $p_s);
			fputs($file, PHP_EOL.PHP_EOL);

			fputs($file, $temp);
			//echo "continue";
			continue;
		}
		fputs($file, $temp);
	}

	// file close
	fclose($fo);
	fclose($file);

	$temp = file_get_contents("../webapp/xsl/hello.xsl");
	file_put_contents("../webapp/xsl/fiction_fo.xsl", $temp);
}

// parse the string with item location for each chapter.
function str_parse($num, $next){
	return "<xsl:apply-templates select='book/body/item[position() &gt; ".$num." and position() &lt; ".$next." ]'/>".PHP_EOL;
}

// Sets the attributes of page master.
// From webapp\default_set/default.xml file to webapp\static\xsl/fiction_attribute.xsl file
// open an xml file with default sets
function default_setting(){		

	// collect data from the xml file.(default.xml)
	$xmlstring = file_get_contents("C:\Program Files (x86)\BaseX\webapp\static/default_set/default.xml");

	$xml = simplexml_load_string($xmlstring);	

	$str = "";
	$str2 = "";
	$arr = [];
	$arr2 = array();
	$arr3 = array();

	foreach($xml->children() as $key => $value){
		if ($value->attribute) {
			foreach ($value->attribute as $key => $attr) {
				$temp = (string)$attr->name;
				$temp2 = (string)$attr->value;
				$str2 .= "first=";
				$str2 .= $temp;
				$str2 .= "&second=";			
				$str2 .= $temp2;
				$str2 .= "&";
			}
		}			
		else{
			continue;
		}

		$str2 = substr($str2, 0, -1);
		$str = (string)$value->context;
		$arr[$str] = $str2;	
		$str2 ="";
	}	

	// call replace_attribute()
	foreach ($arr as $key => $value) {
		replace_attribute($key, $value);
	}
}

// replaces fiction_attribute.xsl file
// There are three kinds of strings from the file(fiction_attribute.xsl).
// :attribute-set included and to be replaced string..
// :attribute-set included but not to be replaced string
// :attribute included string.
// When attribute included string is met, check the flag tag if the string should be replaced or not.
function replace_attribute($arg01, $arg02){

	$first = str_replace('%20', ' ', $arg02);
	$first = str_replace('%23', '#', $first);

	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/xsl/fiction_attribute.xsl", "r");

	$temp = "";
	$flag_tag = false;
	// read fiction_attribute.xsl string by string
	while (!feof($file1)) {

		$str = fgets($file1);
		//if the tag is related to the input tag call the function
		if(!(strpos($str, "<xsl:attribute-set")===false)){
			if (!(strpos($str, "'".$arg01."'")===false)) {
				$temp .= $str;
				$flag_tag = true;	
			}
			else{
				$temp .= $str;
				$flag_tag = false;				
			}
		}

		else{
			if($flag_tag){
				if (!(strpos($str, "</xsl:attribute-set")===false)) {

					// insert new attribute tags here.
					$temp .= re_attr($first);

					$temp .= $str;
					$flag_tag = false;
				}
				else{
					$temp .= "";
				}
			}

			else{
				$temp .= $str;
			}
		}
	}

	fclose($file1);	
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/static/xsl/fiction_attribute.xsl", $temp);
}

// Parse the string from the client for attributes in "fiction_attribute.xsl"
function re_attr($arg01){
	$odd_num = 0;		// check the signal "&" is the first or second to confirm 'name' and 'value' is paired.
	$temp = "";
	$name = "";
	$fruit01 = "";		// the data for the name of attribute.
	$fruit02 = "";		// the data for the value of attribute.
	$result = "";
	$str = $arg01;
	for ($i=0; $i <strlen($str) ; $i++) { 
		$char = substr($str, $i, 1);
		if ($char =="=") {
			$name = $temp;
			$temp .= $char;
			$temp = "";
		}
		elseif ($char =="&") {
			// if the name is first, go to fruit01, and if the name is second, go to fruit02.
			if ($name == 'first') {
				$fruit01 = $temp;				# code...
			}

			elseif($name == 'second'){

				$fruit02 = $temp;
			}
			else{
			}

			$name = "";
			$temp = "";
			$odd_num++;

			if ($odd_num % 2 == 0) {
				$result .= "<xsl:attribute name='".$fruit01."'>".$fruit02."</xsl:attribute>".PHP_EOL;
			}			
		}
		else{
			$temp .= $char;		
		}	
	}

	$result .= "<xsl:attribute name='".$fruit01."'>".$temp."</xsl:attribute>".PHP_EOL;

	return $result;
};

// creates "C:\Program Files (x86)\BaseX\webapp\static\js/fiction_interfere.js
function fiction_interfere(){

	// files open
	//$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/xml/fiction_tag.xml", "r");
	$file2 = fopen("C:\Program Files (x86)\BaseX\webapp\static/js/fiction_interfere.js", "w");

	$xmlstring = file_get_contents("C:\Program Files (x86)\BaseX\webapp\static/xml/fiction_tag.xml");

	$xml = simplexml_load_string($xmlstring);	

	//print_r($xml);
	$str = file_get_contents("C:\Program Files (x86)\BaseX\webapp\static\js/fiction_js_h.js");

	fputs($file2, $str);

	foreach($xml->children() as $child){
	  	$str = "	$(\"#".$child."\").click(function(){".PHP_EOL;
	  	$str .= "		var temp = \"<form><input type ='text' name ='first'/>\";".PHP_EOL;
	    $str .= "		$(temp).insertAfter(\"#".$child."\");".PHP_EOL ;
		$str .= "	});".PHP_EOL; 
		
	  	fputs($file2, $str);		
	}	

	$str = "});".PHP_EOL; 	

	fputs($file2, $str);
	fclose($file2);			
}

//return dinct tags to "fiction_tags.xml" file
function distinct_tags(){
	$str02 = "";
	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/xml/fiction_tag.xml", "r");
	$file2 = fopen("C:\Program Files (x86)\BaseX\webapp\xml/hello.xml", "w");

	$array = [];
	while (!feof($file1)) {

		$str = trim(fgets($file1));
		array_push($array, $str);
	}

	$new = array_unique($array);

	foreach ($new as $key => $value) {
		$str02 .= $value.PHP_EOL;

		fputs($file2, $value);
	}

	//file close. 
	fclose($file1);
	fclose($file2);		

	file_put_contents("C:/Program Files (x86)/BaseX/webapp/static/xml/fiction_tag.xml", $str02);
}

function aux_files(){
	// creates "underhood.xsl";
	c_underhood();
	
	// creates "attribute.xsl";
	c_attribute();
}

// creates "fiction_fo.xsl";
function c_fiction_fo(){
	// files open
	$file2 = fopen("C:\Program Files (x86)\BaseX\webapp\xsl/fiction_fo.xsl", "w");	


/************************/
	// xsl header
	$header = file_get_contents("C:\Program Files (x86)\BaseX\webapp\xsl/fiction_h.xsl", "r");
	$header .= PHP_EOL;
	$header .= file_get_contents("C:\Program Files (x86)\BaseX\webapp\xsl/fiction_h2.xsl", "r");
	$header .= PHP_EOL.PHP_EOL;
	fputs($file2, $header);	


	$str = "<xsl:template match = '/'>".PHP_EOL;

	$str .= file_get_contents("C:\Program Files (x86)\BaseX\webapp\xsl/fiction_h3.xsl", "r");

	$str .="</xsl:template>".PHP_EOL.PHP_EOL;

	fputs($file2, $str);

	fputs($file2, "</xsl:stylesheet>");			

	//file close. 
	fclose($file2);		
}

// creates "fiction_underhood.xsl" from fiction_tag.xml and fiction_h.xsl;
function c_underhood(){

	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/xml/fiction_tag.xml", "r");
	$file2 = fopen("C:\Program Files (x86)\BaseX\webapp\xsl/fiction_underhood.xsl", "w");	

	$header = file_get_contents("C:\Program Files (x86)\BaseX\webapp\xsl/fiction_h.xsl", "r");

	$header .= PHP_EOL;	

	fputs($file2, $header);

	while (!feof($file1)) {

		$str = fgets($file1);

		if ((strpos($str, "<tag>")===false)) {		// This part is a little weird , 
			continue;								// last line(name = '') problem solved but weird.
		}			

		if (!(strpos($str, "<book>")===false)) {
 
			$header = file_get_contents("C:\Program Files (x86)\BaseX\webapp\xsl/match/match_book.xsl", "r");
			fputs($file2, $header.PHP_EOL.PHP_EOL);
			continue;
		}		
		if (!(strpos($str, "</book>")===false)) {
			continue;
		}

		// "title part" is special
		if (!(strpos($str, "<tag>title</tag>")===false)) {
			$str = title_underhood($str);
			fputs($file2, $str);
		}	

		// "TOC part" is different
		elseif (!(strpos($str, "<tag>style</tag>")===false)) {
			$str = strip_tags($str);

			$str = trim($str);

			$str2 = $str;

			$str = "<xsl:template match = '".$str."'>".PHP_EOL;

			$str .= "	<fo:block>".PHP_EOL;

			$str .= "	</fo:block>".PHP_EOL;

			$str .= "</xsl:template>".PHP_EOL.PHP_EOL;

			fputs($file2, $str);	
		}	

		// "TOC part" is different
		elseif (!(strpos($str, "<tag>TOC</tag>")===false)) {
			toc_underhood($str, $file2);
		}						

		// picture part inserting
		elseif (!(strpos($str, "<tag>pic")===false)) {
			$str = picture_insert($str);
			fputs($file2, $str);
		}						

		else{
			$str = strip_tags($str);

			$str = trim($str);

			$str2 = $str;

			$str = "<xsl:template match = '".$str."'>".PHP_EOL;

			// check if the tag is "item"
			if (!(strpos($str2, "item")===false)) {
				$str .= "	<fo:block xsl:use-attribute-sets= '".$str2."' id='{generate-id()}'>".PHP_EOL;
			}

			elseif (!(strpos($str2, "page")===false)) {
				$str .= "	<fo:block xsl:use-attribute-sets= '".$str2."' id='{generate-id()}'>".PHP_EOL;
			}			

			else{
				$str .= "	<fo:block xsl:use-attribute-sets= '".$str2."'>".PHP_EOL;
			}

			$str .= "		<xsl:apply-templates/>".PHP_EOL;

			$str .= "	</fo:block>".PHP_EOL;

			$str .= "</xsl:template>".PHP_EOL.PHP_EOL;

			fputs($file2, $str);			
		}
	}	

	fputs($file2, "</xsl:stylesheet>");

	//file close. 
	fclose($file1);
	fclose($file2);		
}

function picture_insert($str){
	$str = strip_tags($str);
	$str = trim($str);	
	$str_ori = $str;
	$str = "<xsl:template match = '".$str."'>".PHP_EOL;
	$str .= "    <fo:block xsl:use-attribute-sets= '".$str_ori."' id='{generate-id()}'>".PHP_EOL;
	$str .= "        <fo:external-graphic src=\"url('../static/svg/".$str_ori.".bmp')\" content-height=\"9cm\" content-width=\"9cm\"/>".PHP_EOL;
	$str .= "    </fo:block>".PHP_EOL;	
    $str .= "</xsl:template>".PHP_EOL;
	return $str;		
}

function title_underhood($str){
	$str = strip_tags($str);
	$str = trim($str);
	$str2 = $str;
	$str = "<xsl:template match = '".$str."'>".PHP_EOL;
	$str .= "	<xsl:choose>".PHP_EOL;
	$str .= "		<xsl:when test=\"../style[text()='chapter']\">".PHP_EOL;
	$str .= "			<fo:block xsl:use-attribute-sets='title'>".PHP_EOL;
	$str .= "				<fo:marker marker-class-name='chapter'>".PHP_EOL;
    $str .= "					<xsl:value-of select = '.'/>".PHP_EOL;      
    $str .= "				</fo:marker>".PHP_EOL;   
    $str .= "				<xsl:apply-templates/>".PHP_EOL;
    $str .= "			</fo:block>".PHP_EOL;
    $str .= "		</xsl:when>".PHP_EOL;
	$str .=	"		<xsl:otherwise>".PHP_EOL;
    $str .= "			<fo:block xsl:use-attribute-sets='title'>".PHP_EOL;
    $str .= "				<fo:marker marker-class-name='happy'>".PHP_EOL;
    $str .= "					<xsl:value-of select = '.'/>".PHP_EOL;
    $str .= "				</fo:marker>".PHP_EOL;
    $str .= "				<xsl:apply-templates/>".PHP_EOL;
    $str .= "			</fo:block>".PHP_EOL;
    $str .= "		</xsl:otherwise>".PHP_EOL;
    $str .= "	</xsl:choose>".PHP_EOL;
    $str .= "</xsl:template>".PHP_EOL;
	return $str;	
}

// special function for "TOC"
function toc_underhood($str, $file2){
	$str = strip_tags($str);

	$str = trim($str);

	$str2 = $str;

	$str = "<xsl:template match = '".$str."'>".PHP_EOL;


	$str .= "	<fo:block xsl:use-attribute-sets= 'toc-ttl'>".PHP_EOL;

	$str .= "The contents of the book".PHP_EOL;

	$str .= "		<xsl:apply-templates/>".PHP_EOL;

	$str .= "	</fo:block>".PHP_EOL;

    $str .= "	<xsl:for-each select='/book/body/item'>".PHP_EOL;    
     
    $str .= "	<xsl:variable name='item' select='position()'/>".PHP_EOL;   

    $str .= "		<fo:block  xsl:use-attribute-sets='toc-itm'>".PHP_EOL;

    $str .= "			<fo:basic-link internal-destination='{generate-id()}'>".PHP_EOL;

    $str .= "				<xsl:value-of select='title'/>".PHP_EOL;

	$str .=	"					<fo:leader leader-pattern='dots'/><fo:page-number-citation ref-id='{generate-id()}'/>".PHP_EOL;

    $str .= "			</fo:basic-link>".PHP_EOL;

    $str .= "		</fo:block>".PHP_EOL;

    $str .= "		<xsl:for-each select='contents/page'>".PHP_EOL;

    $str .= "		<xsl:variable name='page' select='position()'/>".PHP_EOL;

    $str .= "			<fo:block  xsl:use-attribute-sets='toc-pge'>".PHP_EOL;

    $str .= "				<fo:basic-link internal-destination='{generate-id()}'>".PHP_EOL;

    $str .= "					<xsl:value-of select='title'></xsl:value-of>".PHP_EOL;

	$str .=	"						<fo:leader leader-pattern='dots'/><fo:page-number-citation ref-id='{generate-id()}'/>".PHP_EOL;    

    $str .= "				</fo:basic-link>".PHP_EOL;

    $str .= "			</fo:block>".PHP_EOL;

    $str .= "		</xsl:for-each>".PHP_EOL;


    $str .= "	</xsl:for-each>".PHP_EOL;  



	$str .= "</xsl:template>".PHP_EOL.PHP_EOL;

	fputs($file2, $str);	
}

// creates "fiction_attribute.xsl" from "fiction_tag.xml";
function c_attribute(){
	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/xml/fiction_tag.xml", "r");
	$file2 = fopen("C:\Program Files (x86)\BaseX\webapp\static/xsl/fiction_attribute.xsl", "w");	

	// xsl header
	$header = file_get_contents("C:\Program Files (x86)\BaseX\webapp\xsl/fiction_h.xsl", "r");
	$header .= PHP_EOL.PHP_EOL;	

	// above part is hard coding for "<attribute>" tag

	fputs($file2, $header);	

	while (!feof($file1)) {

		$str = fgets($file1);

		if ((strpos($str, "<tag>")===false)) {
			continue;
		}	

		if (!(strpos($str, "<book>")===false)) {
			$str = "book";
		}		
		if (!(strpos($str, "</book>")===false)) {
			continue;
		}

		$str = strip_tags($str);

		$str = trim($str);

		$str = "<xsl:attribute-set name= '".$str."'>".PHP_EOL;

		$str .="</xsl:attribute-set>".PHP_EOL.PHP_EOL; 


		fputs($file2, $str);

	}	

/////////////////// special tags; chapter-ref, section-ref
		$str = "<xsl:attribute-set name= 'chapter-ref'>".PHP_EOL;

		$str .="</xsl:attribute-set>".PHP_EOL.PHP_EOL; 

		$str .= "<xsl:attribute-set name= 'section-ref'>".PHP_EOL;

		$str .="</xsl:attribute-set>".PHP_EOL.PHP_EOL; 	
		fputs($file2, $str);			
//////////////////////////	

	fputs($file2, "</xsl:stylesheet>");			

	//file close. 
	fclose($file1);
	fclose($file2);		
}


function front_attach($file){
	$str = "<front>".PHP_EOL.PHP_EOL;
	$str .= "<title></title>".PHP_EOL;
	$str .= "<preface></preface>".PHP_EOL;
	$str .= "<colophone></colophone>".PHP_EOL;
	$str .= "<halfttl></halfttl>".PHP_EOL;
	$str .= "<TOC></TOC>".PHP_EOL;
	$str .= "</front>".PHP_EOL.PHP_EOL;	

	fputs($file, $str);
}

function back_attach($file){
	$str = "<back>".PHP_EOL.PHP_EOL;
	$str .= "<epilogue></epilogue>".PHP_EOL;
	$str .= "<afterword></afterword>".PHP_EOL;
	$str .= "<index></index>".PHP_EOL.PHP_EOL;
	$str .= "</back>".PHP_EOL.PHP_EOL;		

	fputs($file, $str);	
}

function body_tag_front($file){
	$str = "<body>".PHP_EOL.PHP_EOL;
	fputs($file, $str);	
}

function body_tag_back($file){
	$str = "</body>".PHP_EOL.PHP_EOL;
	fputs($file, $str);	
}

/***************
Above part is start part which starts xml file from txt file.
******************./

/***************
Below part is fiction_final part.
******************./

/*************
Simply make "fiction_final.xml" from "book_fiction.xml"
***********/
function modify_fiction(){

	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/book_fiction.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/fiction_final.xml", $file);	
}

///////////////////////////////////////////////
// Get all the tags including ending tag ; </tag> from "book_fiction.xml" for modify333()
function get_tags_from_fiction_xml(){
	$file = fopen("C:\Program Files (x86)\BaseX\webapp\static/xml/temp.xml", "w");
	// Use simplexmlelement object from the file.
	//parse the file and get the xml object
	$xmlstring = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/book_fiction.xml");

	$xml = simplexml_load_string($xmlstring);

	// Get all the tags using "displayNode()"
	displayNode02($xml, 0, $file);

	fclose($file);

	// into array from string
	$str = file_get_contents("C:\Program Files (x86)\BaseX\webapp\static/xml/temp.xml");

	$arr = explode(",", $str);

	//distinct tags
	$new = array_unique($arr);
	$temp = array_pop($new);	// remove last array element

	return $new;
}

function displayNode02($node, $offset, $file) {
	$arr = [];
	$str = "";
    if (is_object($node)) {
        $node = get_object_vars($node);
        foreach ($node as $key => $value) {

            $str .= display02($key);
            fputs($file, $str);
            //echo $str.PHP_EOL;
            
            displayNode02($value, $offset + 1, $file);
        }
    } elseif (is_array($node)) {
        foreach ($node as $key => $value) {
            if (is_object($value))
                displayNode02($value, $offset + 1, $file);
            else{}
            	//$str .= display02($key);
            	//$arr = array_push($arr, $key);	
            	//echo $str.PHP_EOL;		<tag>0</tag> <tag>1</tag> <tag>2</tag>
            	
        }
    }
}

// parse "fiction_final.xml" file to "fiction_tag.xml"
function fiction_parser(){
	//parse the file and get the xml object
	$xmlstring = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/fiction_final.xml");

	$xml = simplexml_load_string($xmlstring);	

	//pass the object to another function to get the string from it to be into a file. 
	//and get the file of tags as a string for user modifying.
	$file = fopen("C:\Program Files (x86)\BaseX\webapp\static/xml/fiction_tag.xml", "w");

	fputs($file, "<book>".PHP_EOL);

	fputs($file, "<tag>simple-page-master</tag>".PHP_EOL);

	page_master_tag($file);		// fputs("<tag>...</tag>") in this function	

	displayNode($xml, 0, $file);

	// special for "TOC" part of the book
	fputs($file, "<tag>toc-ttl</tag>".PHP_EOL);
	fputs($file, "<tag>toc-itm</tag>".PHP_EOL);
	fputs($file, "<tag>toc-pge</tag>".PHP_EOL);		

	$tags = file_get_contents("C:\Program Files (x86)\BaseX\webapp\static\default_set/tag_add.xml");
	fputs($file, $tags.PHP_EOL);

	fputs($file, "</book>");

	fclose($file);
}

function displayNode($node, $offset, $file) {
	$str = "";
    if (is_object($node)) {
        $node = get_object_vars($node);
        foreach ($node as $key => $value) {

            $str = display($key);
            //echo $str.PHP_EOL;
            fputs($file, $str);
            displayNode($value, $offset + 1, $file);
        }
    } elseif (is_array($node)) {
        foreach ($node as $key => $value) {
            if (is_object($value))
                displayNode($value, $offset + 1, $file);
            else
            	$str = display($key);
            	//echo $str.PHP_EOL;		<tag>0</tag> <tag>1</tag> <tag>2</tag>
            	//fputs($file, $str);
        }
    }
}

// Create the default tag(page master-related tags)
function page_master_tag($file){
	
	// signal tag for simple-page-master
	$flag = false;
	$flag_text01 = "<fo:simple-page-master";
	$flag_text02 = "</fo:simple-page-master>";

	$temp = "";

	$needle = "xsl:use-attribute-sets";

	// file open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp/xsl/fiction_fo.xsl", "r");

	while (!feof($file1)) {	

		$temp = fgets($file1);

		if(!(strpos($temp, $flag_text01)=== false)){
			$flag = true;
			continue;	// Do not do anything if the text is <fo:simple-page-master> itself.
						// And get next text ; fo:region-body, fo:region-before, etc.
		}

		if(!(strpos($temp, $flag_text02)=== false)){
			$flag = false;
			continue;	// Do not do anything if the text is <fo:simple-page-master> itself.
						// And get next text ; fo:region-body, fo:region-before, etc.
		}

		// process string by string
		if (!(strpos($temp, $needle)=== false)) {
			// input string
			if ($flag) {
				//echo $temp;
				$fruit = extract_tag($temp);		// Extract default "page master tag" for user interface.
				//$fruit02 = substr($fruit, 0, -1);
				fputs($file, "<tag>".$fruit."</tag>".PHP_EOL);
				fputs($file, "<tag>".$fruit."02"."</tag>".PHP_EOL);

			}
			else{

			}
		}

		else{

		}
	}

	// file close
	fclose($file1);
}

// Extract default "page master tag" for user interface.
function extract_tag($str){
	$start = strpos($str, "xsl:use-attribute-sets")+24;
	$end= (strpos($str, "/>")-(strpos($str, "xsl:use-attribute-sets")+25));

	$fruit = substr($str, $start,$end);

	return $fruit;
}

function display($key){
	$str = "<tag>".$key."</tag>".PHP_EOL;
	return $str;
}

function display02($key){
	$str = "<" .$key. ">,";
	$str .= "</" .$key. ">,";
	return $str;
}

/*************
This application tags for many kinds of signals in book2.
***********/

// This applicaiton tags for book 2 page signal.
function signal_tag3($sig_name,$contents){

	$length32 = strlen($sig_name);

	$temp33 = substr($sig_name,4);
	$temp34 = substr($contents, $length32+1);

	$temp35 = PHP_EOL."<".$temp33.">".PHP_EOL.$temp34.PHP_EOL."</".$temp33.">".PHP_EOL;
	return $temp35;					
}

// This function outputs tagged string(<pic1/>,<pic2>,<pic3>) from input string.
// Returns tagged string after receiving a string if it has $reg expression.
// This works in the <con_header> tag.
function sub_pic($string, $pic,$pic_num){
	$result="";		// Output string to return.
	$temp="";		// Storage for <pic> tagged.
	$count=0;		// the location of character being processed.

	while (  !((strlen($string))==($count))  ) {
		$s = substr($string,$count,1);
		$temp .= $s;

		// Attaches <pic></pic> tag.
		if(  !(strpos($temp, $pic)===false)  ){
			$result .= each_pic($temp);
			$temp = "";
			$pic_num++;
		}

		else{
			if($count==strlen($string)-1){
				$result .= $temp;
				$temp = "";
			}
		}
		$count++;
	}
	return $result;
}

// Attaches <pic></pic> tag after $temp
function each_pic($temp){
	static $num = 1;

	$result = str_replace("sigspic", "", $temp);
	$result .= "<pic".$num."/>";
	$num ++;
	return $result;
}

// This function outputs tagged string(<wordle1/>,<wordle2>,<wordle3>) from input string.
// Returns tagged string after receiving a string if it has $reg expression.
function sub_wordle($string, $wordle, $pic_num){
	$result="";		// Output string to return.
	$temp="";		// Storage for <pic> tagged.
	$count=0;		// the location of character being processed.

	while (  !((strlen($string))==($count))  ) {
		$s = substr($string,$count,1);
		$temp .= $s;

		// Attaches <wordle></wordle> tag.
		if(  !(strpos($temp, $wordle)===false)  ){
			$result .= each_wordle($temp);
			$temp = "";
			$pic_num++;
		}

		else{
			if($count==strlen($string)-1){
				$result .= $temp;
				$temp = "";
			}
		}
		$count++;
	}
	return $result;
}

// This function outputs tagged string from input string to show the part of each sentence bold.
// Returns tagged string after receiving a string if it has $reg expression.
// This function simplifies the process other than sub_pic() function or sub_worlde() function.
function sub_half_tag($string, $half_tag){

	// Find the first "H_T"
	$first = strpos($string, $half_tag);

	// Find the second "H_T"
	$last = strrpos($string, $half_tag);
	$length = $last-$first;

	// Cut the part of the sentence.
	$start_part = substr($string,0, $first);

	$part = substr($string,$first, $length+3);

	$end_part = substr($string, $first+$length+3);

	// Tag the part of the sentence
	$removed = str_replace("H_T", "", $part);
	$part = "<part_bold>"."&#160;".$removed."&#160;"."</part_bold>";

	// Combine the sentence with cut part.
	$result = $start_part.$part.$end_part;

	echo $result;

	// Return the sentence to the calling function.
	return $result;
}

// Attaches <wordle></wordle> tag after $temp
function each_wordle($temp){
	static $num = 1;

	$result = str_replace("sigswordle", "", $temp);

	$result .= "<wordle".$num."/>";
	$num ++;
	return $result;
}


/**************************
function to_xml_book(){

	$title_length = 20;		// the length of string to be tagged as title from "first3.txt".

	// files open
	$file1 = fopen("C:\Program Files (x86)\BaseX\webapp\static/neo/first_ori.txt", "r");
	$file2 = fopen("C:\Program Files (x86)\BaseX\webapp\xml/book_fiction.xml", "w");	

	// Start making a book file by attching <book> tag.
	fputs($file2, "<book>".PHP_EOL.PHP_EOL);	

	// Attach front part of a book.
	front_attach($file2);

	// Start making a body part of the book by attaching <body> tag.
	body_tag_front($file2);

	// input string from the txt file
	// Attach <item> object at the string into the new xml file.	
	$item_num = 0;
	$page_num = 0;
	$paragraph_num = 0;

	$value = "/[0-9]{1,3}:[0-9]{1,3}/";		// regular expression preg_match() for 45:73

	while (!feof($file1)) {
		$str = fgets($file1);

		// if "sigschapter" is included in the string, do something.
		if (!(strpos($str, "sigschapter")===false)) {
			$str = str_replace("sigschapter", "", $str);
			$str = attach_item_tag($str, $item_num, "chapter");

			fputs($file2, $str.PHP_EOL);
			$page_num = 0;  // when new item begins you should put $page_num = 0			
		}

		// if "sigssection" is included in the string, do something.
		elseif (!(strpos($str, "sigssection")===false)) {
			$str = str_replace("sigssection", "", $str);
			$str = attach_item_tag($str, $item_num, "section");

			fputs($file2, $str.PHP_EOL);
			$page_num = 0;  // when new item begins you should put $page_num = 0			
		}

		// if the string is short and not title(with non_title mark), process like normal string.
		elseif (!(strpos($str, "sigsnon_title")===false)) {
			$str = str_replace("sigsnon_title", "", $str);
			$str = attach_paragraph($str);		// trim the paragraph
			fputs($file2, $str.PHP_EOL);
			$paragraph_num ++;
			// the sign that the paragraph is met, which means </page> tag can be attached
			$page_num ++;					
		}	

		// if the string is number( like 34:57), don't take it title. It should be paragraph
		elseif (preg_match($value, $str)) {
			$str = attach_paragraph($str);		// trim the paragraph
			fputs($file2, $str.PHP_EOL);
			$paragraph_num ++;
			// the sign that the paragraph is met, which means </page> tag can be attached
			$page_num ++;					
		}	

		// page part
		elseif((strlen($str)<$title_length) && (strlen($str)>3)){
			$str = attach_page_tag($str, $page_num);
			fputs($file2, $str.PHP_EOL);			
		}

		// if the string is only paragraph.
		elseif(strlen($str)>=$title_length){
			$str = attach_paragraph($str);		// trim the paragraph
			fputs($file2, $str.PHP_EOL);

			$paragraph_num ++;

			// the sign that the paragraph is met, which means </page> tag can be attached
			$page_num ++;	
		}

		// line feed, carage return.
		else{

		}
		$item_num ++;	
	}

	fputs($file2, "</page></contents></item>".PHP_EOL);

	//Finish making the body part of the book by attaching </body> tag.
	body_tag_back($file2);

	//Attach back part of the book.
	back_attach($file2);

	//make a </book> tag into the xml file
	//Finish making the book by attaching </book> tag
	fputs($file2, "</book>");

	//file close. 
	fclose($file1);
	fclose($file2);	

	// wrap the <p> tags with <gut> tag using dom parser.
	//gut_wrap();
}
***************************/