<?php
/* This app is about utf-8.
It changes files into "utf-8"-encoded.
*/

require_once("extensions.php");

//echo $argv[1].$argv[2];

utf_change($argv[1]);


// get file contents
//$contents = file_get_contents("C:\Program Files (x86)\BaseX\webapp\Making sentences/paragraph.txt");
// get the contents "utf-8" encoded.
//$changed = iconv("UTF-8", "UTF-8//IGNORE", $contents);
// put the contents to the book2_final.xml
//file_put_contents("C:\Program Files (x86)\BaseX\webapp\Making sentences/paragraph.txt", $changed);
