<?php
/*************
insert <t> tag into <trans></trans> in "book2_final.xml".
***********/

require_once("extensions.php");

t_tag("<trans>","</trans>","<t>","</t>");

echo "t_tag attached";