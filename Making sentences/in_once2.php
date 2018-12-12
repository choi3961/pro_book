<?php
/*************
 Attach tag <bold></bold> on English characters to make it look good.
***********/

require_once("extensions.php");

modify333();
sig_tags();
p_tag();
t_tag("<trans>","</trans>","<t>","</t>");			//t_tag();
tip_tag("<tips>","</tips>","<tip>","</tip>");
bold();
utf_change("C:\Program Files (x86)\BaseX\webapp\xml/book2_final.xml");
bold_modify();



echo "modify333();
sig_tags();
p_tag(); 
t_tag(); 
tip_tag();
bold();
utf_change()
bold_modify()";


