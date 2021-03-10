<?php

function fnConnect( &$msg){
	$cn=mysqli_connect("localhost","root","");
	if(!$cn){
		$msg = "Error en la conexión";
		return 0;
	}
	$rpta = mysqli_select_db("ue",$cn);
	if(!$rpta){
		$msg = "BD no existe";
		mysqli_close($cn);
		return 0;
	}
	return $cn;
}

function say($cad){
	echo $cad . "\n";
}

function fnShowMsg($title,$msg){
    say("<table width='250'>");
    say("<tr>");
    say("<th align=center valign=middle>$title</th>");
    say("</tr>");
    say("<tr>");
	say("<td align=left valign=middle>".$msg."</td>");    
    say("</tr>");
    say("</table>");
}

function fnLink($link,$target,$mouseover,$msg){
	$cad = "<A href='$link' target='$target' ";
	$cad .= "onmouseout=\"self.status='';return true\" ";
	$cad .= "onmouseover=\"self.status='$mouseover' ;return true\">";
	$cad .= "$msg</A>";
	return $cad;
}

?>