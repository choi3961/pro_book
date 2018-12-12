<?php
/*************
 Attach tag <bold></bold> on English characters to make it look good.
***********/

require_once("extensions02.php");

replace_attribute($argv[1], $argv[2]);
