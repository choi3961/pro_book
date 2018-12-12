<?php
/*************
This application is to make paragraph_temp in xml form.
It consists of two parts.

First part extracts the paragraphs from the limited(in number) source file.
Second part makes an xml file with the paragraph file.

***********/
require_once("extensions.php");
///////////////////////////////  part 1
// Make paragraph_temp.txt and extracts paragraph from limited directory(by argv2 in number) of files.

ex_paragraph_limited("../webapp/Making sentences/sentences", $argv[2]);	//from a directory, it iterates.

///////////////////////////////  PART TWO
// makes a xml file of paragraphs
// You should send the main arguments to the function.
// advanced_tag($argv[1],$argv[2],$argv[3],$argv[4]);