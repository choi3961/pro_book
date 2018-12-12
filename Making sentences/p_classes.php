<?php
class Book{
	public function __construct(){
		$this->front = new Front();
		$this->body  = array();
		$this->back = new Back();
	}		
}

class Front{
	public function __construct(){
		$this->title = "title";
		$this->preface = "preface";
		$this->colophone = "colophone";
	}			

}

class Item{
	public function __construct($val01, $val02, $val03){
		$this->style = $val01;
		$this->title = $val02;
		$this->contents = array();	
	}		
}

// right below of class Item
class Page{
	public function __construct($val01){
		$this->title = $val01;
	}			
}

class Back{
	public function __construct(){
		$this->epilogue = " aa";
		$this->afterword= " ";
		$this->index = " ";
	}		
}

class XMLSerializer {
    // functions adopted from http://www.sean-barton.co.uk/2009/03/turning-an-array-or-object-into-xml-using-php/
    public static function generateValidXmlFromObj($obj, $node_block) {

        $arr = get_object_vars($obj);

        return self::generateValidXmlFromArray($arr, $node_block);
    }

    public static function generateValidXmlFromArray($array, $node_block) {

        $xml = '<'.$node_block.'>'.PHP_EOL;

        $xml .= self::generateXmlFromArray($array);

        $xml .= '</'.$node_block.'>';

        return $xml;
    }

    private static function generateXmlFromArray($array) {

        $xml = '';
        if (is_array($array) || is_object($array)) {

            foreach ($array as $key=>$value) {
				// if "sigssection" is included in the string, do something.
				if (!(strpos($key, "item")===false)) {
					$key = "item";		
				}

				// if "sigssection" is included in the string, do something.
				elseif (!(strpos($key, "page")===false)) {
					$key = "page";		
				}

				// if "sigssection" is included in the string, do something.
				elseif (!(strpos($key, "p")===false)) {
					$key = "p";		
				}
				else{
					
				}
                //if (is_numeric($key)) {
                //   $key = $node_name;
                //}

				// if it contains "<p>" tag, remove the "<p>" tag for "fiction_final.xml".
				if ($key === "p") {

	                $xml .=self::generateXmlFromArray($value);
	                
	                $xml .=PHP_EOL;
				}
				else{

	                $xml .='<'.$key.'>'.self::generateXmlFromArray($value).'</'.$key.'>';
				}

            }


        } else {

            //$xml = htmlspecialchars($array, ENT_QUOTES);
            $xml = $array;			// ".PHP_EOL"  makes some unknown problem.

        }
        return $xml;
    }
}