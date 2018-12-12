<?php
/*************
This application is to make sentences in xml form.
It consists of two parts.

First part extracts the sentences from the source file.
Second part makes an xml file with the sentence file.

***********/
require_once("extensions.php");

///////////////////////////////  part 1
// if not "sentence.txt", makes sentence.txt and extracts sentences from a directory of files.
if(!file_exists("sentence.txt")){
	ex_sentences_in_turn("sentences");
}

///////////////////////////////  PART TWO
// makes a xml file of sentences
to_xml_s();