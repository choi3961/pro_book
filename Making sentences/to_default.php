<?php
/*************
from display to "default.xml". The process is partly similar to the "span01" event handler.
***********/
require_once("extensions02.php");

//$file = fopen("C:\Program Files (x86)\BaseX\webapp\static/default_set/hello.xml", "w");
//fputs($file, "hello");

//fclose($file);

to_default($argv[1], $argv[2]);