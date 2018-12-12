<?php
// This function outputs tagged string from input string.
// Returns tagged string after receiving a string if it has $reg expression.
// This works in the <con_header> tag.
function sub_bold($string, $reg, $open_tag, $close_tag){
	$temp="";
	$count=0;

	$flag_bra = false;		// flag for <>
	$flag_e=false;			// flag for English character
	$e_words="";				// variable for English words to bold.

	while (  !((strlen($string))==($count))  ) {

		// Checks if it is in '< >'
		if(substr($string,$count,1)=="<"){
			$flag_bra = true;
			$flag_e=false;
			$temp .= substr($string,$count,1);
		}

		// Checks if it is in '< >'
		elseif(substr($string,$count,1)==">"){
			$flag_bra = false;
			$temp .= substr($string,$count,1);
		}		

		// if the cahracter is English one, you should discern if it is in '< >' or not
		elseif(preg_match($reg, substr($string,$count,1))){

			// if it is in '<  >', you just pass the character to $temp.
			if ($flag_bra==true) {
				$temp .= substr($string,$count,1);
			}


			// if it is outside '<  >', you should put the character into $e_words. $flag turned true. 
			else{
				// if the cahracter is English one after English one, you should put the character into $e_words.
				// it sends the data transparentally.				
				if($flag_e==true){
					$e_words .= substr($string, $count,1);
				}
				// if the cahracter is English one after others, you should put the character into $e_words.
				// $flag_e turned true.
				else{
						$e_words .= substr($string, $count,1);
						$flag_e = true;	
				}				
			}

		}

		// if the character is " ", you should discern if it is in English character or Korean character.
		elseif (substr($string,$count,1)==" ") {
			// if it is in English character, you put the character into $e_words.
			if ($flag_e==true) {
				//$temp = substr($string,$count,1);
				$e_words .= substr($string,$count,1);
			}

			// if it is in Korean cahracter, you put the character into $temp.
			if ($flag_e==false) {
				$temp .= substr($string,$count,1);
			}				
		}

		// if the character is ".", you should discern if it is after English one or Korean.
		elseif (substr($string, $count,1)==".") {
			// if it is after English character, you should tag <sen/> and add it to $temp.
			if ($flag_e==true) {

				$temp .= substr($e_words, 6);
				$temp .= substr($string, $count,1);
				$e_words = "";
			}

			// if it is after Korean character, you should just pass it to $temp.
			if ($flag_e==false) {
				$temp .= substr($string, $count,1);
			}

			$flag_e = false;
		}


		// if the character is not English one(Korean), you should discern if it after English one or Korean.
		else{
			// if the cahracter is not English one after not English one(Korean), just pass the character.
			if($flag_e==false){
			
				$temp .= substr($string, $count,1);

			}
			// if the cahracter is not English one after English one, you should send $e_words to $temp.
			// $flag turned false.
			else{
				$e_words = $open_tag;
				$e_words .= $close_tag;
				$e_words .= substr($string, $count,1);

				$temp .= $e_words;

				$e_words = "";
				$flag_e = false;						
			}
		}
		$count++;
	}
	return $temp;
}
