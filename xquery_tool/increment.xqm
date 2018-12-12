let $var := tokenize('Mohan Prakash, Ramesh Saini', ', ')
for $t at $pos in $var
return concat($t,",",  $pos)