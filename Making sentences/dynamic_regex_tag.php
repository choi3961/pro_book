<?php
/*************
This application is to make paragraph in xml form.
It consists of two parts.

First part extracts the paragraphs from the source file.
Second part makes an xml file with the paragraph file.

***********/
require_once("extensions.php");
///////////////////////////////  part 1
// if not "paragraph.txt" make paragraph.txt and extracts paragraph from a directory of files.
if(!file_exists("../webapp/Making sentences/paragraph.txt")){

	ex_paragraph_in_turn("../webapp/Making sentences/source");	//from a directory, it iterates.
}
else echo "paragraph.txt exists".PHP_EOL;

///////////////////////////////  PART TWO
// makes a xml file of paragraphs
// You should send the main arguments to the function.
dynamic_regex_tag($argv[1]);