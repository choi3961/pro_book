<?php
/*************
This application is to make paragraph in xml form.
It consists of two parts.

First part extracts the paragraphs from the source file.
Second part makes an xml file with the paragraph file.

***********/
require_once("extensions.php");

//echo $argv[1].$argv[2];

find_words($argv[1],$argv[2]);
