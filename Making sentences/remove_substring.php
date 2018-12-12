<?php
/*************
This application remove "&nbsp" from "paragraph.txt" in "making sentences" folder
***********/
require_once("extensions.php");

//echo $argv[1]." and ".$argv[2];

remove_substring($argv[1], $argv[2]);
