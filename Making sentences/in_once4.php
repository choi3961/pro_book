<?php
/*************
 makes files for fiction modifying.
***********/
require_once("extensions02.php");
require_once("p_classes.php");

//echo $argv[1];

//Start a book by making a xml file from a txt file.
to_xml_book($argv[1]);

//Simply make "fiction_final.xml" from "book_fiction.xml"
modify_fiction();

// combine "fiction_front.xml", "book_fiction.xml", "fiction_back.xml" into "book_fiction.xml".
combine();

//1. Remove &#xD;
//2. This application is for modifying book_fiction.xml apperance of tags. for exmaple : <tags> appearance into fiction_final.xml
modify333();

sig_tags();

//insert <p> tag into "book2_final.xml" 
p_tag();

// creates "fiction_fo.xsl"; fiction_fo.xsl is including tags for page master.
c_fiction_fo();

// parse "fiction_final.xml" file; make "fiction_tag.xml" file
fiction_parser();

//return distinct tags to "fiction_tag.xml" file
distinct_tags();

//This application creates 2 files, to say "fiction_underhood.xsl", "fiction_attribute.xsl".
aux_files();

default_base();

default_setting();

default_fo();




/*************
// creates "C:\Program Files (x86)\BaseX\webapp\static\js/fiction_interfere.js
//fiction_interfere();
***********/