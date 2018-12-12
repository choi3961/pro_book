<?php
/*************
This application collect web contents and turn it into text file.
***********/
function web_contents($argv1){
	$file = file_get_contents($argv1);
	$text = strip_tags($file);
	$text2 = str_replace(array("\r\n", "\r", "\n"), "\r\n", $text);
	$time = time();

	if($text)
		echo $time;

	file_put_contents("C:/Program Files (x86)/BaseX/webapp/Making sentences/temp/web".$time.".txt", $text2);
}



/*************
This application proofs tips tag in book2.xml.
***********/
function proof_1(){
	//echo "hello proof hhhhhhhhh";
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$count = 0;

	$item_count = 0;

	$page_count = 0;

	while (!feof($file1)) {
		$temp = fgets($file1);

		if ((!(strpos($temp, "<item>") === false))) {
			$item_count++;
		}

		if ((!(strpos($temp, "<page>") === false))) {
			$page_count++;
		}


		$value = "/[A-Za-z]:\s[ㄱ-ㅎㅏ-ㅣ]/";

		if(preg_match($value, $temp)){
			echo "exist == ";
			//echo $item_count ;
			//echo " and ";
			//echo $page_count;

			$temp = iconv("UTF-8", "UTF-8//IGNORE", $temp);	
			//echo $temp;		
		}			
	}

	fclose($file1);
	fclose($file2);

	// Part Two 
	//$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	//file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);	
}

/*************
This application collect web contents and turn it into text file.
***********/
function xml_tostring(){
	//echo "hello xml_tostring???";
	$xml = new SimpleXMLElement('<a>1 <b>2 </b>3</a>');
	echo $xml;	

	$string = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");

	$changed = strip_tags($string);

	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/temp33.txt", $changed);
}


/*************
 Modify "<bold>." to attach to the previous sentence.
***********/
function bold_modify(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$count = 0;

	while (!feof($file1)) {
		$temp = fgets($file1);
		$temp1 = $temp;
		$temp2 = $temp;


		$temp = str_replace(PHP_EOL, "", $temp);
		fputs($file2, $temp);

/*******		

		// evaluates <pic1/>, <pic2/>, <pic3/> ... ,using static value.
		if (  !(strpos($temp, "</bold>.")=== false) ) {
			//echo "hahaah=======";
			//$count++;

			str_replace(PHP_EOL, "", $temp1);
		}	

		else{
			fputs($file2, $temp1);
		}	

		
******/
		

	}

	//echo $count;

	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);
}







/*************
This application makes tagged files from paragrah.txt file and all tags.
It is composed of two parts. 
First part is to get all the tags from "tagger.xml" in xml folder.
Second part is ta call "to_xml_a()" function using for-each.
***********/
function quote_check(){
	//echo "hello quote checkkk";
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");
	$file3 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/quote_check.txt", "w");

	$reserve = false;		// check if the \" is in <reserve/> tag.

	while (!feof($file1)) {
		$temp = fgets($file1);

		$value = "/[A-Za-z][ㄱ-ㅎㅏ-ㅣ]/";

		if (preg_match($value, $temp, $matches)) {
			
			fputs($file3, $matches[0]);
			//print_r($matches);
			//break;
			echo "found";
		}



/***********
		if (!(strpos($temp, "<reserve>") === false)){
			$reserve = true;

		}

		if (!(strpos($temp, "</reserve>") === false)){
			$reserve = false;

		}		

		if ((substr_count($temp,"\"") % 2)  && ($reserve === false) && !((!(strpos($temp, "</reserve>") === false)))   ) {
			echo $temp;
			fputs($file3, $temp);
		}
**********/


		
	}		
	fclose($file1);
	fclose($file2);	

}


/*************
Attach ":" in the <tips> tag
***********/
function attach(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$tips = "<tips>";
	$tips_e ="</tips>";
	$apo = ":";


	while (!feof($file1)) {
		$temp = fgets($file1);


		// Input ":" between English word and Korean word if it doesn't contain ":" in the <tips/> tag
		if (  !(strpos($temp, $tips)=== false) && !(strpos($temp, $tips_e)=== false) && (strpos($temp, $apo)=== false)) {
			//echo "It exists";

			$length = strpos($temp, $tips_e) - strpos($temp, $tips) - 6;

			// Five parts in each string ; "before <tips>", "<tips>", contents, "</tips>", "after </tips>""
			$temp2 = "";

			$temp2 .= substr($temp, 0, strpos($temp, $tips));  // "before <tips>"

			$temp2 .= $tips;   // "<tips>"

			// contents part ; real string
			for ($i=0; $i < $length ; $i++) { 


				$temp2 .= substr($temp, $i, 1);
			}

			$temp2 .= $tips_e ;   // "</tips>"

			$temp2 .= substr($temp, strpos($temp, $tips_e)+7, strlen($temp)-strpos($temp, $tips_e));// "after </tips>"

			if ($temp===$temp2) {
				echo "same!!!";
			}

			$temp = $temp2;

			
		}

 		// Do nothing if it contains ":" between English word and Korean word nor if it is not in <tips> tag.
		else{

		}
		fputs($file2, $temp);
	}		
	fclose($file1);
	fclose($file2);
}



/*************
Replace a string in book2.xml from arguments in the user interface form.
***********/
function remove_substring($in, $file_name){
	
	$path = $file_name."/";
	static $f_num = 1;

	//echo $file_name."===========";
	//echo $f_num;

	if(is_dir($file_name)){		
		$files = scandir($file_name);
		$num = count($files);
		$f_num--;	// if directory, you should decrease the number.
		// Should distinguish "." diredtory and ".." directory from normal directory.
		// So it starts from $i=2, not from $i=0.
		for($i=2;$i<$num;$i++){
			$f_num ++;
			remove_substring($in, $path.$files[$i]);  //recursion
		}
	}
	else{
		remove_substring_each($file_name);	// "$file_name" should be in accordance with function argument.
	}
	/*************
	**************/
}

/*************
Replace a string in book2.xml from arguments in the user interface form.
***********/
function remove_substring_each($file){
	$file_temp = "C:\Users\Administrator\Desktop/temp333/temp333.txt";
	$file1 = fopen($file, "r");
	$file2 = fopen($file_temp, "w");	

	$temp = "";	
	$temp2 = "";

	while (!feof($file1)) {

		$temp = fgets($file1);


		$temp = str_replace("&nbsp;", "", $temp);
		

		fputs($file2, $temp);
		$temp = "";
	}

	fclose($file1);
	fclose($file2);	

	/*************
	**************/
}


/*************
Modify the paragraphs containg '~' in book2.xml file. 
Add space character after '~' if the cahracter after '~' is not space character
***********/
function modify($file){
	//echo $file;
	$temp2='';
	$file_temp = "C:\Users\Administrator\Desktop/temp1.xml";
	$file2 = fopen($file_temp, "w");	

	$file1 = fopen($file, "r");
  
	while (!feof($file1)) {
		$string = '';
		$temp = fgets($file1);
		for ($i=0; $i < strlen($temp) ; $i++) { 
			$temp2 = $temp[$i];

			// Check if a character is '~'
			if ($temp2==='~') {
				// check next character. if next character is space character
				if ($temp[$i+1]===" ") {
					$string .= $temp2;
				}
				// if next character is not space character, add space character
				else{
					$string .= $temp2;
					$string .= " ";
				}


				//echo '~';
			}
			else{
				$string .= $temp2;
			}			
		}

		//Modified string
		fputs($file2, $string);

		$string = '';
	
	}
	
	fclose($file1);
	fclose($file2);	
}


/*************
Change the files into UTF-8 encoding interating the files.
***********/
function utf_change($file_name){

	$path = $file_name."/";

	if(is_dir($file_name)){		
		$files = scandir($file_name);
		$num = count($files);
		// Should distinguish "." diredtory and ".." directory from normal directory.
		// So it starts from $i=2, not from $i=0.
		for($i=2;$i<$num;$i++){
			utf_change($path.$files[$i]);  //recursion
		}
	}
	else{
		utf_change_each($file_name);	// "$file_name" should be in accordance with function argument.
	}
}


/*************
Change each file into UTF-8 encoding.
***********/
function utf_change_each($file){

	//echo $file.PHP_EOL;
/*************
Change file into UTF-8 sequence.
***********/
	//$file11 = "C:\Program Files (x86)\BaseX\webapp\Making sentences/paragraph.txt";
	$file22 = "C:\Program Files (x86)\BaseX\webapp/temp_para.txt";

	$file1 = fopen($file, "r");
	$file2 = fopen($file22, "w");	


	while (!feof($file1)) {
		$temp = fgets($file1);

		$temp = iconv("UTF-8", "UTF-8//IGNORE", $temp);
		fputs($file2, $temp);
	}
	
	fclose($file1);
	fclose($file2);	

// Second part
// get file contents
$contents = file_get_contents($file22);

// put the contents to the book2_final.xml
file_put_contents($file, $contents);
}



/*************
Rearrange paragraphs removing line feed character from files which are in classic folder in source folder.
***********/
function rearrange_paragraph($file_name){
	$path = $file_name."/";
	static $f_num = 1;

	echo $file_name."===========";
	echo $f_num;

	if(is_dir($file_name)){		
		$files = scandir($file_name);
		$num = count($files);
		$f_num--;	// if directory, you should decrease the number.
		// Should distinguish "." diredtory and ".." directory from normal directory.
		// So it starts from $i=2, not from $i=0.
		for($i=2;$i<$num;$i++){
			$f_num ++;
			rearrange_paragraph($path.$files[$i]);  //recursion
		}
	}
	else{
		rearrange_paragraph_each($file_name, $f_num);	// "$file_name" should be in accordance with function argument.
	}
}

/*************
Rearrange paragraphs removing line feed character from files which are in classic folder in source folder.
***********/
function rearrange_paragraph_each($file, $f_num){
	
	$file2 = "C:\Users\Administrator\Desktop/temp333/guten".$f_num.".txt";
	$file1 = fopen($file, "r");
	$file2 = fopen($file2, "w");	


	while (!feof($file1)) {
		$temp = fgets($file1);

		if(!strpos($temp, ".".PHP_EOL)){
			$temp = str_replace(PHP_EOL, "", $temp);
		}
		fputs($file2, $temp);
	}
	
	fclose($file1);
	fclose($file2);	
/********
	**********/
}

/*************
This application finds the words in files in C:\Program Files (x86)\BaseX\webapp\Making sentences\source.
Iterates the folder for copyright check .
***********/
function find_words($argv1, $file_name){
	//echo $argv1.$file_name;

	$path = $file_name."/";

	if(is_dir($file_name)){		
		$files = scandir($file_name);
		$num = count($files);
		// Should distinguish "." diredtory and ".." directory from normal directory.
		// So it starts from $i=2, not from $i=0.
		for($i=2;$i<$num;$i++){
			//print_r($path.$files[$i]."\n");
			//echo "hello".$file_name."\n";
			find_words($argv1, $path.$files[$i]);  //recursion
		}
	}
	else{
		//echo " regular file";
		find_words_each($argv1, $file_name);	// "$file_name" should be in accordance with function argument.
	}

		/*******
	*******/
}

/*************
This application finds the words in files in C:\Program Files (x86)\BaseX\webapp\Making sentences\source.
Iterates the folder for copyright check .
***********/
function find_words_each($argv1, $file){
	// file open each file
	$opened = fopen($file, "r");

	while (!feof($opened)) {
		$string = fgets($opened);
		if (strpos($string, $argv1) !== false) {
		    echo $file;
		}	
		else{
			//echo "false";
		}	
	}	
	//echo $file;

	// file close each file
	fclose($opened);
}

/*************
This application is to collect source from websites.
Before collecting, it check up the URL if it is already collected.
Big logic : check if the URL is marked in "pickup_list.txt" file.

  if not, it registers the URL in "pickup_list.txt" and collect the contents.
derived from web_contents.
***********/
function source_collecting($url, $category){
	// FIRST PART   
	// If the URL is marked in "pickup_list", the program exit.
	// check the URL in "pickup_list.txt"
	// Mark up chceck : Before collecting the source, you should check up the url if it is already collected.	
	$mark_up = ""; 								// for each URL marked in "pickup_list.txt".
	$mark_ups = file_get_contents("C:\Program Files (x86)\BaseX\webapp\Making sentences\pickup_list\pickup_list.txt");
	$count = 0; 								// for file length.
	$delimiter = ""; 							// for checking if the character is ","
	while ($count != strlen($mark_ups)) {
		$delimiter = substr($mark_ups, $count, 1);
		if ($delimiter == ",") {
			if ($url == $mark_up) {
				echo "The URL already exist..";
				echo "The program stopped normally";

				exit(0);
			}
			$mark_up = "";						
		}
		else{
			$mark_up .= $delimiter;
		}
		$count++;
	}	
	echo $category;

	// SECOND PART
	//if not the URL marked, it registers the URL in "pickup_list.txt" and collect the contents.
	$source = file_get_contents($url);
	
	if($source){
		//mark up the URL into the "pickup_list.txt" file adding it.
		$pick_up = fopen("C:\Program Files (x86)\BaseX\webapp\Making sentences\pickup_list\pickup_list.txt", "a");
		fputs($pick_up, $url.",");
		fclose($pick_up);
		echo "A new URL marked into pickup_list.txt : ".$url." ; ";

		// Collect the contents in a new file.
		$time = time();
		file_put_contents("C:/Program Files (x86)/BaseX/webapp/Making sentences/source/guten/$category/web".$time.".txt", $source);
		echo $url." : is collected";
	}


/*****************************
// XSL INTERFACE : It doesn't work because of "php.ini" file.
// error on line 3 at column 94: xmlParseCharRef: invalid xmlChar value 21
// Refference == https://www.oxygenxml.com/archives/xsl-list/200412/msg00835.html

// XSLTProcessor not found (php.ini uncommenting)
// Refference == http://stackoverflow.com/questions/7930726/fatal-error-class-xsltprocessor-not-found


// Load XML file
$xml = new DOMDocument;
$xml->load('C:/Program Files (x86)/BaseX/webapp/xsl_interface/memo.xml');

// Load XSL file
$xsl = new DOMDocument;
$xsl->load('C:/Program Files (x86)/BaseX/webapp/xsl_interface/memo.xsl');

// Configure the transformer
$proc = new XSLTProcessor;

// Attach the xsl rules
$proc->importStyleSheet($xsl);

// Set parameter for xsl transform
$proc->setParameter('', 'modified', "Source collecting");

// The result
echo $proc->transformToXML($xml);
*******************************/
}

/*************
Collect idioms from a website.
***********/
function idioms(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/ad_idioms.txt", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/first.txt", "w");

	while (!feof($file1)) {
		$temp = fgets($file1);

		if (strpos($temp, ".")) {
			fputs($file2, $temp);
		}

		elseif ($temp == PHP_EOL) {
			fputs($file2, $temp);
		}

		else{
			$temp = str_replace(PHP_EOL, ".".PHP_EOL, $temp);
			fputs($file2, $temp);
		}
	}

	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/first.txt");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/ad_idioms.txt", $file);	
}

/*************
Modify the signals adding ending signal to the signal
***********/
function signals_modify($in, $out){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");	


	while (!feof($file1)) {
		$temp = fgets($file1);

		$temp = str_replace($in, $out, $temp);

		fputs($file2, $temp);
	}

	fclose($file1);
	fclose($file2);	

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", $file);
}

/*************
Replace a string in book2.xml from arguments in the user interface form.
***********/
function replace_str($in, $out){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");	

	echo $in ;
	echo $out;
	/****
	while (!feof($file1)) {
		$temp = fgets($file1);

		$temp = str_replace($in, $out, $temp);

		fputs($file2, $temp);
	}
*****/
	fclose($file1);
	fclose($file2);	

	// Part Two 
	//$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	//file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", $file);
}

/*************
1. Remove &#xD;
2. This application is for modifying book2.xml apperance of tags. for exmaple : <tags> appearance.
***********/
function modify333(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$arr2 = ["<page>","</page>", "<chapter>","</chapter>","<trans/>","<trans>","</trans>",
	"<title>","</title>","<con_header>","</con_header>","<con_header_trans>",
	"</con_header_trans>","<con_header_trans/>","<tips>","</tips>"];	

//1. Remove &#xD;
	while (!feof($file1)) {
		$temp = fgets($file1);
		$temp = str_replace("&#xD;", "", $temp);

		foreach ($arr2 as $key => $value) {
			if (preg_match($value, $temp)) {
				$temp = str_replace($value, PHP_EOL.$value.PHP_EOL, $temp);
			}
		}

		fputs($file2, $temp);
	}


	fclose($file1);
	fclose($file2);	

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);	
}


/*************
This application tags for many kinds of signals in book2.
***********/
function sig_tags(){
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
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
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);		
}

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

	//$result .= $temp;

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

	//$result .= $temp;

	$result .= "<wordle".$num."/>";
	$num ++;
	return $result;
}


/*************
This application tags <title2> 
It copied title2()
deprecated
***********/
function chap_tag(){
	$file1 = fopen( "C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	$file2 = fopen( "C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");
	while (!feof($file1)) {
		$str = fgets($file1);
		
		if (strpos($str, "chaploc")) {
			$str = tag_chap($str);
			//echo "hello chap?????????";
		}
		else 
		{}
		fputs($file2, $str);

	}
	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);
}

/*************
This application tags  <title2> 
It copied tag_title()
***********/
function tag_chap($str){
	$t="chaploc";
	$str_temp = substr($str, 0, strpos($str,"<p>"));  //before "<p>", delete <p>
	$str_temp .= "<chap>";
	$str_temp .= substr($str,strpos($str, $t)+8, (strpos($str, "</p>")-(strpos($str, $t)+8)));
	$str_temp .= "</chap>";
	$str_temp .= PHP_EOL;
	return $str_temp;
}

/*************
This application remove "&nbsp" from all xml files in "xml/tagged files" folder
***********/
function remove_nbsp(){
	$arr = [];
	// first part : make an array of all the tags from "tagger.xml" file in xml folder.
	$file1 = fopen( "C:/Program Files (x86)/BaseX/webapp/xml/tagger.xml", "r");
	while (!feof($file1)) {
		$str = fgets($file1);
		if (strpos($str, "<name>")) {
			$str = strip_tags($str);
			$str = trim($str);
			array_push($arr, $str);
		}
	}
	print_r($arr);
	fclose($file1);

	// second part : And use "str_replace()"" to remove "&nbsp;""
	foreach ($arr as $key => $value) {
		$str = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/tagged files/".$value.".xml");
		$str = str_replace("&nbsp;", "", $str);
		file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/tagged files/".$value.".xml", $str);
	}
}

/*************
This application makes tagged files from paragrah.txt file and all tags.
It is composed of two parts. 
First part is to get all the tags from "tagger.xml" in xml folder.
Second part is ta call "to_xml_a()" function using for-each.
***********/
function all_tag(){
	$arr = [];
	// first part : make an array of all the tags from "tagger.xml" file in xml folder.
	$file1 = fopen( "C:/Program Files (x86)/BaseX/webapp/xml/tagger.xml", "r");
	while (!feof($file1)) {
		$str = fgets($file1);
		if (strpos($str, "<name>")) {
			$str = strip_tags($str);
			$str = trim($str);
			array_push($arr, $str);
		}
	}
	print_r($arr);
	fclose($file1);

	// second part : And call "to_xml_a"
	foreach ($arr as $key => $value) {
    	to_xml_a($value);
	}
}

// This application is for modifying <con_header_trans/> in book2_final.xml.
// This has two parts. In first part, it stores the data of file 'book2_final.xml' into temperary file 'hello.xml'.
// In second part conversely, it restores the data of file 'hello.xml' into the file 'book2_final.xml'.
function re_con_header_trans(){
	$flag_c_h=false; 	//flag for <con_header_trans> tag. This function only works in <con_header_trans> tag.

	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	// Open temperary file.
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	while (!feof($file1)) {
		$temp = fgets($file1);

		// In the <con_header_trans> tag, it turns the flag to true to call sub function().
		if(strpos($temp, "<con_header_trans>")&&!strpos($temp, "</con_header_trans>")){
			$temp2 = sub_re_con($temp);
			fputs($file2,$temp2);
			$flag_c_h = true;
		}

		// In the <con_header_trans> tag, it turns the flag to true to call sub function().
		elseif(strpos($temp, "</con_header_trans>")&&!strpos($temp, "<con_header_trans>")){
			$temp2 = sub_re_con($temp);
			fputs($file2,$temp2);
			$flag_c_h = false;
		}

		// In the <con_header> tag, it turns the flag to true to attach "number" to English characteer.
		elseif(strpos($temp, "</con_header_trans>")&&strpos($temp, "<con_header_trans>")){
			$temp2 = sub_re_con($temp);
			fputs($file2,$temp2);
			$flag_c_h = false;
		}

		//The strings could be in <con_header_trans/> tag or not.
		else{
			// Inside <con_header_trans/>
			if($flag_c_h==true){
				$temp2 = sub_re_con($temp);
				fputs($file2,$temp2);
			}
			// Outside <con_header_trans/>
			else{
				fputs($file2,$temp);
			}
		}
	}

	fclose($file1);
	fclose($file2);

	// PART TWO : 
	// Transport the data in temp file "hello.xml" to "book2_final.xml" transparentally
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "w");

	while (!feof($file1)) {
		$temp = fgets($file1);
		fputs($file2,$temp);
	}

	fclose($file1);
	fclose($file2);	
}

// This is called from re_con_header_trans().
function sub_re_con($temp){
	$count = 0;
	$flag_c_h_t = false;
	$ready = false;		// variable for <trans> to be inserted.
	$outside_tag = "";	// variable for normal data outside the '< >' to be passed with <trans><title> attached.
	$inside_tag = "" ; // variable for temperary data of in '< >' to be passed to $string.
	$tag_o = "<trans>";	// open tag 
	$tag_c="</trans>";	// close tag
	$string ="";		// string to store temperary data to be sent to $string2.
	$string2 =""; 		// variable to be returned.
	while (  !((strlen($temp))==($count))  ) {
		$s = substr($string,$count,1);

		if($s=='<'){
			$string .= $outside_tag;
			$outside_tag = "";
			$inside_tag = $s;
			$ready = false;

			$flag_c_h_t = true;		//signal to show it is inside the '<con_header_trans>'.			
		}

		elseif ($s=='>') {
			// Resumes that it is in '<p>' tag.
			if($inside_tag=="")
				{
					$ready=true;	// You have to be ready for <trans> tag after <p/> tag removed.
				}			
			else{
				$inside_tag .= $s;
				$string .= $inside_tag;
				$inside_tag ="";
				$ready = true;		// ready for <trans> to be inserted.
			}
			
			$flag_c_h_t=false;	//signal to show it is outside the '<con_header_trans>'.
		}
		// You should discern if it is in '< >' or not, to remove "<p>" or "</p>" tag.
		elseif ($s=='p') {
			// if it is in '< >', you should remove "<p>" or "</p>".
			if ($flag_c_h_t==true) {
				//$inside_tag .= $s;
				$inside_tag = "";
			}
			// if it is outside '< >', you pass the data transparently.
			else{
				$outside_tag .= $s;
			}	
		}

		// You should discern if it is in '< >' or not. If it is in '< >' 
		elseif ($s=='/') {
		
			if ($flag_c_h_t==true) {
				$inside_tag .= $s;
			}
			else{
				$outside_tag .= $s;
			}
		}

		// <trans/> tag
		// You should check '.'
		elseif ($s=='.') {
			$outside_tag .= $s;
			$outside_tag .= $tag_c;
			$string .= $outside_tag;
			$outside_tag = "";
			$ready = true;
		}
		// You should check '?'
		elseif ($s=='?') {
			$outside_tag .= $s;
			$outside_tag .= $tag_c;
			$string .= $outside_tag;
			$outside_tag = "";
			$ready = true;
		}
 
		// Even if it is in normal alphabet, you should discern if it is in '< >' or not.
		else{
			// if it is in '< >', you should pass the data to $inside_tag transparently, for it is not 'p'.
			if ($flag_c_h_t==true) {
				$inside_tag .= $s;
			}
			// if it is outside '< >', you should pass the data to $outside_tag open tag attached.
			else{

				if ($ready==true) {
					$outside_tag = $tag_o;
					$outside_tag .= $s;
					$ready = false;
				}
				else{
					$outside_tag .= $s;
				}
			}
		}	
		$count++;
	}	
	$string;
	return $string;
}

// This application tags <sen/> to the English sentences.
// The final node will be like "<sen>This is a book.</sen>". It is supposed to have'.'.
function sen_tag(){
	$flag_c_h=false; 	//flag for <con_header> tag. This function only works in <con_header> tag.
	$flag_p=false;		//flag for <page> tag. This function only works in <page> tag.

	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	// Open temperary file.
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	while (!feof($file1)) {
		$temp = fgets($file1);

		// In the <con_header> tag, it turns the flag to true to call sub function().
		if(strpos($temp, "<con_header>")&&!strpos($temp, "</con_header>")){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			$flag_c_h = true;
		}

		// In the <con_header> tag, it turns the flag to true to call sub function().
		elseif(strpos($temp, "</con_header>")&&!strpos($temp, "<con_header>")){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			$flag_c_h = false;
		}

		// In the <con_header> tag, it turns the flag to true to attach "number" to English characteer.
		elseif(strpos($temp, "</con_header>")&&strpos($temp, "<con_header>")){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			$flag_c_h = false;
		}

		////////////////////////////////////////
		// In the <page> tag, it turns the flag to true to call sub function().
		elseif(strpos($temp, "<page>")&&!strpos($temp, "</page>")){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			//fputs($file2,"AA");
			$flag_c_h = false;
			$flag_p=true;
		}

		// In the <page> tag, it turns the flag to true to call sub function().
		elseif(strpos($temp, "</page>")&&!strpos($temp, "<page>")){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			//fputs($file2,"******");
			$flag_c_h = false;
			$flag_p=false;
		}

		// In the <page> tag, it turns the flag to true to attach "number" to English characteer.
		elseif(strpos($temp, "</page>")&&strpos($temp, "<page>")){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			//fputs($file2,"************************");
			$flag_c_h = false;
			$flag_p=true;
		}
		///////////////////////////////

		//The strings could be in <con_header/> tag or inside <page/> or not.
		else{
			// protecting from removing the contents in <title></title>.
			if (strpos($temp, "<title2>")) {
				fputs($file2,$temp);
				$temp = "";
			} 		


			// in case of <long> tag, you don't put any <sen> tag.
			elseif (strpos($temp, "<long>")) {
				fputs($file2,$temp);
				$temp = "";
			} 	

			// in case of <long> tag, you don't put any <sen> tag.
			elseif (strpos($temp, "<p1>")) {
				fputs($file2,$temp);
				$temp = "";
			} 	

			// in case of <long> tag, you don't put any <sen> tag.
			elseif (strpos($temp, "<p2>")) {
				fputs($file2,$temp);
				$temp = "";
			} 	

			// in case of <long> tag, you don't put any <sen> tag.
			elseif (strpos($temp, "<p3>")) {
				fputs($file2,$temp);
				$temp = "";
			} 	
			// in case of <long> tag, you don't put any <sen> tag.
			elseif (strpos($temp, "<p4>")) {
				fputs($file2,$temp);
				$temp = "";
			} 	
			// in case of <chap> tag, you don't put any <sen> tag.
			elseif (strpos($temp, "<chap>")) {
				fputs($file2,$temp);
				$temp = "";
			} 				

			// Inside <con_header/>
			elseif($flag_c_h==true){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			}

			// Inside <page/>
			elseif($flag_p==true){
			$temp2 = sub_sen_tag($temp);
			fputs($file2,$temp2);
			}	

			// Outside <con_header/>
			else{
				fputs($file2,$temp);
				$temp = "";
			}
		}
	}

	fclose($file1);
	fclose($file2);

	// PART TWO : 
	// Transport the data in temp file "hello.xml" to "book2_final.xml" transparentally
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);
}

// Returns tagged string after receiving a string if it has English sentences.
// This works in the <con_header> tag.
function sub_sen_tag($string){
	$temp="";
	$count=0;
	$reg = '/[A-Za-z]/';
	$reg2 = '/[ㄱ-ㅎㅏ-ㅣ]/';

	$flag_q = false;		// flag for '"'
	$flag_bra = false;		// flag for <>
	$flag_e=false;			// flag for English character
	$e_sen="";				// variable for English sentence.
	$q="";					// variable for '"'

	while (  !((strlen($string))==($count))  ) {
		$s = substr($string,$count,1);
		// Checks if it is in '< >'
		if($s=="<"){
			$flag_bra = true;
			$flag_e=false;
			$temp .= $s;
		}

		// Checks if it is in '< >'
		elseif($s==">"){
			$flag_bra = false;
			$temp .= $s;
		}		

		// if the cahracter is English one, you should discern if it is in '< >' or not
		elseif(preg_match($reg, $s)){

			// if it is in '<  >', you just pass the character to $temp.
			if ($flag_bra==true) {
				$temp .= $s;
			}

			// if it is outside '<  >', you should put the character into $e_sen. $flag turned true. 
			else{
				// if the cahracter is English one after English one, you should put the character into $e_sen.
				// it sends the data transparentally.				
				if($flag_e==true){
					$e_sen .= $s;
				}
				// if the cahracter is English one after others, you should put the character into $e_sen.
				// $flag_e turned true.
				else{
					// if there is '"' before first English character, 
					//you should put '"' before English character.
					/********
					if($flag_q==true){
						$e_sen = $q;
						$q = "";
						$flag_q = false;
					}
					*******/
					$e_sen .= $s;
					$flag_e = true;	
				}				
			}
		}

		// if the cahracter is Korean one, you should discern if it is after English one or not.
		elseif(preg_match($reg2, $s)){
			// if it is in '<  >', you just pass the character to $temp.
			if ($flag_bra==true) {
				$temp .= $s;
			}

			else{
				// if the cahracter is Korean one after not English one(Korean), just pass the character.
				if($flag_e==false){
					$temp .= $s;
				}
				// if the cahracter is Korean one after English one, you should send $e_sen to $temp.
				// $flag turned false.
				else{
					$temp .= $e_sen;
					$temp .= $s;
					$e_sen = "";
					$flag_e = false;						
				}
			}
		}		


		// if the cahracter is '"', you should discern it is in the middle of English sentence, or not
		elseif( $s =='"'){
			// if it is in '<  >', you just pass the character to $temp.
			if ($flag_bra==true) {
				$temp .= $s;
			}
			else{
				// if the cahracter is in the middle of English one, you should put the character into $e_sen.
				// $flag_e turned true.
				if($flag_e==true){
						$e_sen .= $s;
				}						
				// if the cahracter is after not English one, you should put the character into $q.			
				else{
					$q = $s;
					$flag_q = true;
				}				
			}			

		}

		// if the character is ".", you should discern if it is after English one or Korean.
		elseif ($s=="."||$s=="!"||$s=="?") {
			// if it is after English character, you should tag <sen/> and add it to $temp.
			if ($flag_e==true) {

				$to_be_sent = "<sen>";
				$to_be_sent .= $e_sen;
				$to_be_sent .= $s;
				if($flag_q ==true){
					$to_be_sent .= $q;
					$q ="";
					$flag_q=false;
				}				
				$to_be_sent .= "</sen>";
				$temp .= $to_be_sent;
				$to_be_sent = "";
				$e_sen = "";
			}

			// if it is after Korean character, you should just pass it to $temp.
			else {
				$temp .= $s;
			}
			$flag_e = false;
			$flag_q == false;
		}

		// if the character is neither English one nor Korean, you should discern if it is after English one or Korean.
		else{
			// if it is in '<  >', you just pass the character to $temp.
			if ($flag_bra==true) {
				$temp .= $s;
			}
			else{
				// if it is in English character, you put the character into $e_sen.
				if ($flag_e==true) {
					$e_sen .= $s;
					//$temp .= "AA";
				}

				// if it is in Korean cahracter, you put the character into $temp.
				else {
					$temp .= $s;
					//$temp .= "AA";
				}					
			}			
		}
		$count++;
	}
	return $temp;
}


// This application tags <quote></quote> to the sentences for what is korean translation.
// For example, 첫번째 문장은 '그 의사는 나에게 모든 테스트를 통과시켰다.' 이다.
function quote(){

	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	// Open temperary file.
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$flag_c_h=false; 	//flag for <con_header> tag. This function only works in <con_header> tag.

	$open_tag ="<quote>";
	$close_tag = "</quote>";
	$reg0='/문장은.*다.\s+이다/';
	$reg1='/석하면.*다.\s+이다/';
	$reg2='/뜻은.*다.\s+이다/';
	//$reg3='/\~.*,\s+이다/';

	$reg = [$reg0,$reg1,$reg2,$reg3,$reg4,$reg5,$reg6];

	while (!feof($file1)) {
		$temp = fgets($file1);

		// In the <con_header> tag, it turns the flag to true to call sub function().
		if(strpos($temp, "<con_header>")&&!strpos($temp, "</con_header>")){
			$temp2 = sub_quote($temp, $reg, $open_tag, $close_tag);
			fputs($file2,$temp2);
			$flag_c_h = true;
		}

		// In the <con_header> tag, it turns the flag to true to call sub function().
		elseif(strpos($temp, "</con_header>")&&!strpos($temp, "<con_header>")){
			$temp2 = sub_quote($temp, $reg, $open_tag, $close_tag);
			fputs($file2,$temp2);
			$flag_c_h = false;
		}

		// In the <con_header> tag, it turns the flag to true to attach "number" to English characteer.
		elseif(strpos($temp, "</con_header>")&&strpos($temp, "<con_header>")){
			$temp2 = sub_quote($temp, $reg, $open_tag, $close_tag);
			fputs($file2,$temp2);
			$flag_c_h = false;
		}

		//The strings could be in <con_header_trans/> tag or not.
		else{
			// Inside <con_header_trans/>
			if($flag_c_h==true){
			$temp2 = sub_quote($temp, $reg, $open_tag, $close_tag);
			fputs($file2,$temp2);
			}
			// Outside <con_header_trans/>
			else{
				fputs($file2,$temp);
			}
		}
	}

	fclose($file1);
	fclose($file2);

	// PART TWO : 
	// Transport the data in temp file "hello.xml" to "book2_final.xml" transparentally
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "w");

	while (!feof($file1)) {
		$temp = fgets($file1);
		fputs($file2,$temp);
	}

	fclose($file1);
	fclose($file2);	
}

// This function outputs tagged string from input string.
// Returns tagged string after receiving a string if it has $reg expression.
// For example, 첫번째 문장은 <quote>그 의사는 나에게 모든 테스트를 통과시켰다.</quote> 이다.
// This works in the <con_header> tag.

function sub_quote($string, $reg, $open_tag, $close_tag){
	$result="";		// Output string to return.
	$temp="";		// Storage for <quote> tagged.
	$count=0;		// the location of character being processed.

// For example, 첫번째 문장은 '그 의사는 나에게 모든 테스트를 통과시켰다.' 이다.
	while (  !((strlen($string))==($count))  ) {
		$s = substr($string,$count,1);
		$temp .= $s;

		// Check if the string includes $reg.
		// If it does, it does a particular process to tag <quote></quote>
		if(preg_match($reg[0], $temp)){
			$result .= each_quote($reg[0], $temp);
			$temp = "";
		}

		// Attaches <quote></quote> tag.
		elseif(preg_match($reg[1], $temp)){
			$result .= each_quote($reg[1], $temp);
			$temp = "";
		}

		// Attaches <quote></quote> tag.
		elseif(preg_match($reg[2], $temp)){
			$result .= each_quote($reg[2], $temp);
			$temp = "";
		}

		// Attaches <quote></quote> tag.
		//elseif(preg_match($reg[3], $temp)){
		//	$result .= each_quote($reg[3], $temp);
		//	$temp = "";
		//}
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

// Attaches <quote></quote> tag 
function each_quote($reg, $temp){
			// Look for the border word of $reg, before '.*' in $reg.
			$border = substr($reg, 0, strpos($reg, "."));
			$border = substr($border, 1);

			// The length of front $border word and space.
			$border_len = strlen($border) +1;

			// The length of back $border word and space.
			// Let me make next time.

			// Look for the last occurence of "문장은" for $reg.
			$loc = strrpos($temp, $border);

			// Split the string in $temp variable into $result.
			$result .= substr($temp, 0, $loc+$border_len);
			// tag <quote>
			$result .= "<quote>";
			$result .= substr($temp, $loc+$border_len, -7);	//-7 = 3bytes(Korean letter)*2 + 1byte(space)  
			$result .= "</quote>";
			$result .= substr($temp, -7);		// \s이다 -7 = 3bytes(Korean letter)*2 + 1byte(space)
			return $result;
}


/*************
 Attach tag <bold></bold> on English characters to make it look good.
***********/
function bold(){
	//$flag_c_h=false; 	//flag for <con_header> tag. This function only works in <con_header> tag.
	//$flag_p=false; 		//flag for <page> tag. This function only works in <page> tag.

	$flag_item = 'false'; // if it is in <item> 1 ~ 25  tag or not
	$flag_con_header = 'false'; // if it is in <con_header> tag or not
	$flag_page = 'false'; // if it  is in <page> 1, 2 tag or not 
	$item_count = 0 ; // to check what number item it is in
	$page_count = 0 ; // to check what number page it is in

	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	// Open temperary file.
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$open_tag ="<bold>";
	$close_tag = "</bold>";
	$reg = '/[A-Za-z]/';

	while (!feof($file1)) {
		$temp = fgets($file1);

		// if the string is a tag something like <something/>, do nothing.
		if(strpos($temp, ">")){
			if (!(strpos($temp, "<item>") === false)) {
				$flag_item = 'true';
				$item_count++;
				$page_count = 0;
			}

			elseif (!(strpos($temp, "</item>") === false)) {
				$flag_item = 'false';		
			}

			elseif (!(strpos($temp, "<con_header>") === false)) {
				$flag_con_header = 'true';

			}

			elseif (!(strpos($temp, "</con_header>") === false)) {
				$flag_con_header = 'false';
			}						

			elseif (!(strpos($temp, "<page>") === false)) {
				$flag_page = 'true';
				$page_count++;
			}

			elseif (!(strpos($temp, "</page>") === false)) {
				$flag_page = 'false';
				if ($page_count == 6) {
					$page_count = 0;
				}
			}			

			else{
			}
		}


		//if it is between <item> number 1 and <item> number 25 and 
		// between <page> number 1 and <page> number 2
		// tag bold
		elseif ((($item_count >=1 && $item_count <=24 )) && (($page_count >= 1 && $page_count <=6))) {
			$temp = sub_bold($temp, $reg, $open_tag, $close_tag);
		}

		//if it is between <item> number 25 and <item> number 43 and 
		// between <page> number 1 and <page> number 3
		// tag bold
		elseif ((($item_count >=25 && $item_count <=43 )) && (($page_count >= 1 && $page_count <=6))) {
			$temp = sub_bold($temp, $reg, $open_tag, $close_tag);
		}	

		//if it is <con_header>
		// tag bold
		elseif ( $flag_con_header == 'true' ) {
			$temp = sub_bold($temp, $reg, $open_tag, $close_tag);
		}	

		else{
		}

		fputs($file2,$temp);
	}

	fclose($file1);
	fclose($file2);

	// PART TWO : 
	// Transport the data in temp file "hello.xml" to "book2_final.xml" transparentally
	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "w");

	while (!feof($file1)) {
		$temp = fgets($file1);
		fputs($file2,$temp);
	}

	fclose($file1);
	fclose($file2);	
}

// This function outputs tagged string from input string.
// Returns tagged string after receiving a string if it has $reg expression.
// This works in the <con_header> tag and <page> tag.
function sub_bold($string, $reg, $open_tag, $close_tag){
	$count=0;
	$temp="";				// for overall sentence from bold() function.
	$e_words="";			// variable for English words to bold.

	$flag_e=false;			// flag for English character
	
	while (!((strlen($string))==($count))) {
		$s = substr($string,$count,1);

		// if the cahracter is English one
		if(preg_match($reg, $s)){

			// if the cahracter is English one after English one, you should put the character into $e_words.			
			if($flag_e==true){
				$e_words .= $s;
			}
			// if the cahracter is English one after others, you should put the character into $e_words.
			// $flag_e turned true.
			else{
					$e_words = $s;
					$flag_e = true;	
			}
		}

		// if the character is " "(empty string), 
		//you should discern if it is in English character or Korean character.
		elseif ($s==" ") {
			// if it is in English character, you put the character into $e_words.
			if ($flag_e==true) {
		
				$e_words .= $s;
			}

			// if it is in Korean cahracter, you put the character into $temp.
			if ($flag_e==false) {
				$temp .= $s;
			
			}				
		}

		// if the character is ".", you should discern if it is after English one or Korean.
		elseif ($s==".") {
			// if it is after English character, you should tag <bold/> and add it to $temp.
			if ($flag_e==true) {
				$temp_e_words = $open_tag.PHP_EOL.$e_words.PHP_EOL.$close_tag;
				
				$temp .= $temp_e_words;
				$temp .= $s;

				$e_words = "";			
			}

			// if it is after Korean character, you should just pass it to $temp.
			if ($flag_e==false) {
				$temp .= $s;
			}

			$flag_e = false;
		}

		// if the character is ","or "?", you should discern if it is after English one or Korean.
		elseif ($s=="," || $s=="?") {
			// if it is after English character, you should tag <sen/> and add it to $temp.
			if ($flag_e==true) {
				$e_words .= $s;
			}

			// if it is after Korean character, you should just pass it to $temp.
			if ($flag_e==false) {
				$temp .= $s;
			}
		}

		// if the character is "'", you should discern if it is after English one or Korean.
		//elseif ($s=="'") {
			// if it is after English character, you should tag <sen/> and add it to $temp.
			//if ($flag_e==true) {
				//$e_words .= $s;
			//	$temp .= $s;
			//}

			// if it is after Korean character, you should just pass it to $temp.
			//if ($flag_e==false) {
			//	$temp .= $s;
			//}
		//}				

		// if the character is "&#xD;", you should increment the $count by 4.
		elseif ($s=="&") {
			$count = $count + 4;
		}



		// if the character is not English one(Korean), you should discern if it after English one or Korean.
		else{
			// if the cahracter is not English one after not English one(Korean), just pass the character.
			if($flag_e==false){
				$temp .= $s;
			}
			// if the cahracter is not English one after English one, you should send $e_words to $temp.
			// $flag turned false.
			else{
				$temp_e_words = $open_tag.PHP_EOL.$e_words.PHP_EOL.$close_tag;
				
				$temp .= $temp_e_words;
				$temp .= $s;

				$e_words = "";
				$flag_e = false;						
			}
		}

		$count++;
	}
	return $temp;
}


/*************
This application is function to be called.
It extracts the paragraphs from the source file.
***********/
//extracts paragraph from a directory of files iterating.
function ex_paragraph_in_turn($file_name){
	$path = $file_name."/";

	if(is_dir($file_name)){		
		$files = scandir($file_name);
		$num = count($files);
		// Should distinguish "." diredtory and ".." directory from normal directory.
		// So it starts from $i=2, not from $i=0.
		for($i=2;$i<$num;$i++){
			print_r($path.$files[$i]."\n");
			ex_paragraph_in_turn($path.$files[$i]);  //recursion
		}
	}
	else{
		ex_paragraphs($file_name);	// "$file_name" should be in accordance with function argument.
	}
}


/*************
This application is function to be called.
It extracts the paragraphs from the limited(in number) source file.
***********/
//extracts paragraph from a directory of files iterating.
// flag for the level of directory. 
// The program is supposed to stop in first level with $argv2
$level = 0;	
function ex_paragraph_limited($file_name, $argv2){

	$path = $file_name."/";

	if(is_dir($file_name)){		
		$level++;	// flag for the level of directory. 
		$files = scandir($file_name);
		$num = (int)$argv2;
		$num2 = count($files);

		if ($level == 1 ) {

			// Should distinguish "." diredtory and ".." directory from normal directory.
			// So it starts from $i=2, not from $i=0.
			for($i=2;$i<$num;$i++){
				//print_r($path.$files[$i]."\n");
				ex_paragraph_limited($path.$files[$i], $argv2);  //recursion
			}
			$level++;
		} 

		else {
			echo "hello";
			// Should distinguish "." diredtory and ".." directory from normal directory.
			// So it starts from $i=2, not from $i=0.
			for($i=2;$i<$num2;$i++){
				//print_r($path.$files[$i]."\n");
				ex_paragraph_limited($path.$files[$i], $argv2);  //recursion
			}
			$level++;
		}

	}
	else{
		ex_paragraphs($file_name);	// "$file_name" should be in accordance with function argument.
		$level--;
	}
}


//extracts the paragraphs from the source file.
function ex_paragraphs($source){
	// file open two files
	$file = fopen($source, "r");
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/Making sentences/paragraph.txt", "a");
	$first ="";
	$paragraph = "";
	$ex ="";

	while (!feof($file)) {
		$first = fgetc($file);

		if ($first=="\n"||$first=="\r") {

			//extract paragraphs
			$ex = $paragraph;
			$paragraph = "";

			$ex .= PHP_EOL;
			$ex .= PHP_EOL;

			if (strlen($ex)<50) {
				# Remove the paragraph if the length is less than 50 doing nothing.
			}		

			//if & is included in the paragraph, it is taken away from the paragraph.
			elseif (strpos($ex, "&")) {
				# Remove the paragraph if the paragraph includes & simbol doing nothing.
				//echo "& found";
			}

			//if & is included in the paragraph, it is taken away from the paragraph.
			elseif (strpos($ex, "font")) {
				# Remove the paragraph if the paragraph includes & simbol doing nothing.
			}

			//save the paragraph to the file B if the length is longer than 20.
			else{
				fputs($file2, $ex);
			}
		}
		else{
			$paragraph .= $first;
		}			
	}	

	// file close two files
	fclose($file);
	fclose($file2);
}

// Extracts all sentences from a directory iterally.(recursion)
function ex_sentences_in_turn($file_name){
	$path = $file_name."/";

	if(is_dir($file_name)){		
		$files = scandir($file_name);
		$num = count($files);
		// Should distinguish "." diredtory and ".." directory from normal directory.
		// So it starts from $i=2, not from $i=0.
		for($i=2;$i<$num;$i++){
			print_r($path.$files[$i]."\n");
			ex_sentences_in_turn($path.$files[$i]);  // recursion
		}
	}
	else{
		ex_sentences($file_name);	// "$file_name" should be in accordance with function argument.
	}
}

//extracts the sentences from the source file.
function ex_sentences($source){
	// file open two files
	$file = fopen($source, "r");
	$file2 = fopen("sentence.txt", "a");

	$first ="";
	$sentence = "";
	$ex ="";

	while (!feof($file)) {
		$first = fgetc($file);

		if ($first =="."||$first == "?") {
			$sentence .= $first;

			//extract sentences
			$ex = $sentence;
			$sentence = "";

			$ex .= PHP_EOL;

			if (strlen($ex)<20) {
				# Remove the sentence if the length is less than 20 doing nothing.
			}

			//if & is included in the sentence, it is taken away from the sentence.
			elseif (strpos($ex, "&")) {
				# Remove the sentence if the sentence includes & simbol doing nothing.
				//echo "& found";
			}

			//if & is included in the sentence, it is taken away from the sentence.
			elseif (strpos($ex, "font")) {
				# Remove the sentence if the sentence includes & simbol doing nothing.
				//echo "& found";
			}

			//save the sentence to the file B if the length is longer than 20.
			else{
				fputs($file2, $ex);
			}
		}
		elseif ($first=="\n"||$first=="\r") {
			//echo "EOL";
		}
		else{
			$sentence .= $first;
		}
	}

	// file close two files
	fclose($file);
	fclose($file2);
}

///////////////////////////////  PART TWO	
// makes an xml file of paragraphs
function to_xml(){

	$arr = [];
	// first part : make an array of all the tags from "tagger.xml" file in xml folder.
	$file1 = fopen( "C:/Program Files (x86)/BaseX/webapp/xml/tagger_oneword.xml", "r");
	while (!feof($file1)) {
		$str = fgets($file1);
		if (strpos($str, "<name>")) {
			$str = strip_tags($str);
			$str = trim($str);
			array_push($arr, $str);
		}
	}
	//print_r($arr);
	fclose($file1);

	// two files open
	$file3 = fopen("paragraph.txt", "r");
	$file4 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/paragraphs.xml", "w");

	//root element
	fputs($file4, "<paragraphs>".PHP_EOL);	

	while (!feof($file3)) {
		//line by line process
		$paragraph = fgets($file3);

		// Remove the paragraph that contains roman letters doing nothing.
		if (strpos($paragraph, "I")) {
			# code...
		}

		else{
			$trimed = trim($paragraph);

			fputs($file4, "  <paragraph>".PHP_EOL);

			$paragraph2 = "\t".$trimed;
			fputs($file4, $paragraph2);
			fputs($file4, PHP_EOL);

			// Tags <tags> element
			fputs($file4,"    <tags>".PHP_EOL);

			// Tags for the paragraph
			$length = "      <length>".strlen($trimed)."</length>".PHP_EOL;
			fputs($file4, $length);

			$genre = "      <genre>"."culture"."</genre>".PHP_EOL;
			fputs($file4, $genre);	

			// Tags all
			tag_all($file4, $arr, $trimed);

			fputs($file4,"    </tags>".PHP_EOL);

			fputs($file4, "  </paragraph>".PHP_EOL);
		}
	}

	//close root element
	fputs($file4, "</paragraphs>".PHP_EOL);
	// two files close
	fclose($file3);
	fclose($file4);
}

// Tags each paragraph

function tag1($file, $tagger, $trimed){
		if (stripos($trimed, $tagger) !== false){
			fputs($file,"      <tag>".PHP_EOL);
			fputs($file,"        $tagger".PHP_EOL);
			fputs($file,"      </tag>".PHP_EOL);
		}
}

function tag2($file, $tagger){
			fputs($file,"      <occurrences>".PHP_EOL);
			fputs($file,"        $tagger".PHP_EOL);
			fputs($file,"      </occurrences>".PHP_EOL);
}

// This applicaiton tags for book 2 page signal.
function signal_tag($tag_name, $contents){

			$temp33 = "<".$tag_name.">".substr($contents, 9, strpos($contents,"<trans>")-9)."</".$tag_name.">";
			$temp33 .= PHP_EOL."<trans>".PHP_EOL;
			$temp33 .= "<t>".PHP_EOL.substr($contents, strpos($contents,"<trans>")+7)."</t>".PHP_EOL;
			return $temp33;
			//fputs($file, $temp33);							
}

// This applicaiton tags for book 2 page signal.
// This is for the paragraph not including "<trans>".
function signal_tag2($tag_name, $contents){

			$temp33 = "<".$tag_name.">".substr($contents, 9)."</".$tag_name.">";
			return $temp33;
			//fputs($file, $temp33);							
}


/*************
This application is to make direct paragraph from paragraph.txt
to web page not making xml file.
??? encoding error happens on the browser ???
***********/
function tag($word, $count,$len1,$len2){
	$file3 = fopen("C:\Program Files (x86)\BaseX\webapp\Making sentences\paragraph.txt", "r");

	while (!feof($file3)) {
		//line by line process
		$paragraph = fgets($file3);

		// Remove the paragraph that contains roman letters doing nothing.
		// Remove the paragraph if it does not contain argv.
		if (strpos($paragraph, "I")||!strpos($paragraph, $word)) {
			# code...
		}		
		else{		
			$trimed = trim($paragraph);

			// count the occurrences of tagger.
			$occur = substr_count($trimed, $word);
			$length = strlen($trimed);

			if(($count==$occur)&&($length>=$len1)&&($length<=$len2))
				echo $trimed."\n\n";
		}
	}
	fclose($file3);
}

///////////////////////////////  PART TWO	
// makes an xml file of paragraphs
function to_xml_a($argv){		// Receive main argument to be tagged.

	if (file_exists("C:/Program Files (x86)/BaseX/webapp/xml/tagged files/".$argv.".xml")) {
		echo "file ".$argv.".xml exist";
	}

	else{
		// two files open
		$file3 = fopen("C:/Program Files (x86)/BaseX/webapp/Making sentences/paragraph.txt", "r");
		$file4 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/tagged files/".$argv.".xml", "w");

		//root element
		fputs($file4, "<paragraphs>".PHP_EOL);	

		$count = 0;

		while (!feof($file3)) {
			//line by line process
			$paragraph = fgets($file3);

			$count++;

			// Remove the paragraph that contains roman letters doing nothing.
			if (strpos($paragraph, "I")) {
				# code...
			}		

			// Remove the paragraph if it does not contain argv.
			if (!strpos($paragraph, $argv)) {
				# code...
			}

			else{
				$trimed = trim($paragraph);

				// count the occurrences of tagger.
				$count = substr_count($trimed, $argv);

				fputs($file4, "  <paragraph>".PHP_EOL);

				$paragraph2 = "\t".$trimed;
				fputs($file4, $paragraph2);
				fputs($file4, PHP_EOL);

				// Tags <tags> element
				fputs($file4,"    <tags>".PHP_EOL);

				// Tags for the paragraph
				$length = "      <length>".strlen($trimed)."</length>".PHP_EOL;
				fputs($file4, $length);

				$genre = "      <genre>"."culture"."</genre>".PHP_EOL;
				fputs($file4, $genre);		

				// Dynamic tagging. Receive the main argument to be tagged.
				tag1($file4, $argv, $trimed);
				
				// count the occurrences of tagger.
				tag2($file4, $count);
				fputs($file4,"    </tags>".PHP_EOL);
				fputs($file4, "  </paragraph>".PHP_EOL);
			}
		}

		//close root element
		fputs($file4, "</paragraphs>".PHP_EOL);
		// two files close
		fclose($file3);
		fclose($file4);
		}
}

///////////////////////////////  PART TWO	
// makes an xml file of paragraphs
function dynamic_regex_tag($argv){		// Receive main argument to be tagged.
	// two files open
	$file3 = fopen("C:/Program Files (x86)/BaseX/webapp/Making sentences/paragraph.txt", "r");
	$file4 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/tagged files/regex.xml", "w");

	$pattern = "/$argv/";

	$count = 0;

	//root element
	fputs($file4, "<paragraphs>".PHP_EOL);	
	
	while (!feof($file3)) {
		//line by line process
		$paragraph = fgets($file3);
		//echo $argv;
		$count++;

		// Remove the paragraph that contains roman letters doing nothing.
		if (strpos($paragraph, "I")) {
			# code...
		}		

		// Remove the paragraph if it does not contain argv.
		if (!strpos($paragraph, $argv)) {
			# code...
		}

		// Remove the paragraph if it does not contain argv.
		if (!preg_match($pattern, $paragraph)) {
			# code...
		}		

		else{
			$trimed = trim($paragraph);

			// count the occurrences of tagger.
			$count = substr_count($trimed, $argv);

			fputs($file4, "  <paragraph>".PHP_EOL);

			$paragraph2 = "\t".$trimed;
			fputs($file4, $paragraph2);
			fputs($file4, PHP_EOL);

			// Tags <tags> element
			fputs($file4,"    <tags>".PHP_EOL);

			// Tags for the paragraph
			$length = "      <length>".strlen($trimed)."</length>".PHP_EOL;
			fputs($file4, $length);

			$genre = "      <genre>"."culture"."</genre>".PHP_EOL;
			fputs($file4, $genre);		

			// Dynamic tagging. Receive the main argument to be tagged.
			tag1($file4, $argv, $trimed);
			
			// count the occurrences of tagger.
			tag2($file4, $count);
			fputs($file4,"    </tags>".PHP_EOL);
			fputs($file4, "  </paragraph>".PHP_EOL);
		}
	}

	//close root element
	fputs($file4, "</paragraphs>".PHP_EOL);
	// two files close
	fclose($file3);
	fclose($file4);
}

///////////////////////////////  PART TWO	
// makes an xml file of paragraphs, NOT COMPLETED YET !!!!!!!!!!!!!
function advanced_tag($argv1,$argv2,$argv3,$argv4){		// Receive main argument to be tagged.

echo $argv3;

}

// makes an xml file from "sentence.txt"
function to_xml_s(){
	// two files open
	$file3 = fopen("sentence.txt", "r");
	$file4 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/sentences.xml", "w");

	// to be tagged.
	$arr = array('ing','ed','to','that','which','who','whose','whom','should',
		'when', 'where', 'how', 'why', 'whoever', 'whatever', 'whenever',
		'wherever', 'however', 'because', 'as soon as','take', 'keep',  'up',
		'on','over',  'for', 'get');

	//root element
	fputs($file4, "<sentences>".PHP_EOL);	

	while (!feof($file3)) {
		//line by line process
		$sentence = fgets($file3);

		// Remove the sentence that contains roman letters doing nothing.
		if (strpos($sentence, "I")) {
			# code...
		}
		else{
			$trimed = trim($sentence);

			fputs($file4, "  <sentence>".PHP_EOL);

			$sentence2 = "\t".$trimed;
			fputs($file4, $sentence2);
			fputs($file4, PHP_EOL);

			// Tags <tags> element
			fputs($file4,"    <tags>".PHP_EOL);

			// Tags for the sentence
			$length = "      <length>".strlen($trimed)."</length>".PHP_EOL;
			fputs($file4, $length);

			$genre = "      <genre>"."culture"."</genre>".PHP_EOL;
			fputs($file4, $genre);			

			// Tags all
			tag_all($file4, $arr, $trimed);

			fputs($file4,"    </tags>".PHP_EOL);

			fputs($file4, "  </sentence>".PHP_EOL);
		}
	}

	//close root element
	fputs($file4, "</sentences>".PHP_EOL);
	// two files close
	fclose($file3);
	fclose($file4);
}

//insert <p> tag into "book2_final.xml" using hello.xml".
//avoid signal tags which are tagged previously.
//There is odd case that because of an alphabet, for example "t" in "the transformation" 
//and "l" in "for a long time", <p> tag doesn't work.
function p_tag(){

	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
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
	$arr35 = array("<long>","<title>","<title2>","<title15>","<chap>","<e_chap>","<tips>","<level11>","<level21>","<level31>","<level32>","<short>","<explain>","<trans>","<indent_1>","<mid_t>","<mid_t2>","<space-1>","<space-2>","<space-3>","<space-4>","<space-5>","<space-6>","<space-copy>","<p1>","<p2>","<p3>","<p4>","<p1t>","<p2t>","<p3t>","<p4t>","<p5t>","<p6t>","<p7t>","<p8t>","<p9t>");
	$arr36 = array("</long>","</title>","</title2>","</title15>","</chap>","</e_chap>","</tips>","</level11>","</level21>","</level31>","</level32>","</short>","</explain>","</trans>","</indent_1>","</mid_t>","</mid_t2>","</space-1>","</space-2>","</space-3>","</space-4>","</space-5>","</space-6>","</space-copy>","</p1>","</p2>","</p3>","</p4>","</p1t>","</p2t>","</p3t>","</p4t>","</p5t>","</p6t>","</p7t>","</p8t>","</p9t>");

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
		//$sig_neg = false ;



	}	

	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);
}


//insert <tip> tag into <tips></tips> in "book2_final.xml" using hello.xml".
//avoid signal tags which are tagged previously.
//argument $a : open tag, $b : close tag,  $c : open tag to be attached, $d: close tag to be attached.
function tip_tag($a,$b,$c,$d){

	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	// make a new file
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$in_tips = false ;		// for <trans>
	//$close_trans = false ;		// for </trans>

	while (!feof($file1)) {
		$temp = fgets($file1);

		if (    !(strpos($temp, $a)  === false)) {
			$in_tips = true ;
		}

		if (!(strpos($temp, $b)  === false)) {
			$in_tips = false;	
		}

		if ($in_tips && (strpos($temp, $a)===false) ) {
			$temp = $c.PHP_EOL.$temp.$d.PHP_EOL;
		}

		fputs($file2, $temp);
	}		

	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);
}


//insert <t> tag into <trans></trans> in "book2_final.xml" using hello.xml".
//avoid signal tags which are tagged previously.
//argument $a : open tag, $b : close tag,  $c : open tag to be attached, $d: close tag to be attached.
function t_tag($a,$b,$c,$d){

	$file1 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", "r");
	// make a new file
	$file2 = fopen("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml", "w");

	$in_trans = false ;		// for <trans>

	while (!feof($file1)) {
		$temp = fgets($file1);

		if (    !(strpos($temp, $a)  === false)) {
			$in_trans = true ;
		}

		if (!(strpos($temp, $b)  === false)) {
			$in_trans = false;	
		}

		if ($in_trans && (strpos($temp, $a)===false) ) {
			$temp = $c.PHP_EOL.$temp.$d.PHP_EOL;
		}

		fputs($file2, $temp);
	}		


	fclose($file1);
	fclose($file2);

	// Part Two 
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/hello.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2_final.xml", $file);
}

function tag_all($file, $arr, $trimed){
	foreach ($arr as $value) {
		tag1($file, $value, $trimed);
	}
}

function bookmarks(){
	$file = "C:\Users\user\AppData\Local\Google\Chrome\User Data\Default\bookmarks";
	$source = file_get_contents($file);
	file_put_contents("C:\Program Files (x86)\BaseX\webapp\static\bookmarks.json", $source);
}

/*************
This application is function to be called.
It changes the html format into txt format removing html tags.
***********/
//Removes tags from a directory of files iterating.
function html_to_txt($file_name){
	$path = $file_name."/";

	if(is_dir($file_name)){		
		$files = scandir($file_name);
		$num = count($files);
		// Should distinguish "." diredtory and ".." directory from normal directory.
		// So it starts from $i=2, not from $i=0.
		for($i=2;$i<$num;$i++){
			//print_r($path.$files[$i]."\n");
			html_to_txt($path.$files[$i]);  //recursion
		}
	}
	else{
		sub_html_to_txt($file_name);	// "$file_name" should be in accordance with function argument.
	}
}


//remove tags from a file of html
function sub_html_to_txt($file_name){
	$str = file_get_contents($file_name);
	$stripped = strip_tags($str);
	file_put_contents($file_name, $stripped);
}

/*************
This application backups "book2.xml" to "book2copy.xml"
***********/
function book2copy(){
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2copy.xml", $file);
}

/*************
This application reversely copy "book2copy.xml" to "book2.xml"
***********/
function book2_r_copy(){
	$file = file_get_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2copy.xml");
	file_put_contents("C:/Program Files (x86)/BaseX/webapp/xml/book2.xml", $file);
}