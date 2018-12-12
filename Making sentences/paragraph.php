<?php
/*************
This application is to make paragraph in xml form.
It consists of two parts.

First part extracts the paragraphs from the source file.
Second part makes an xml file with the paragraph file.

***********/
require_once("extensions.php");

///////////////////////////////  part 1
// if not "paragraph.txt", make paragraph.txt and extracts paragraph from a directory of files.
if(!file_exists("C:/Program Files (x86)/BaseX/webapp/Making sentences/paragraph.txt")){
	ex_paragraph_in_turn("../webapp/Making sentences/source");
}
else{
	echo "C:/Program Files (x86)/BaseX/webapp/Making sentences/paragraph.txt doesn't exist!!!";
}

///////////////////////////////  PART TWO
// makes a xml file of paragraphs
//to_xml();
