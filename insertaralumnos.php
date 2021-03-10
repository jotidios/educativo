<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>

<body>
<?php 
  include("conexion.php"); 
  if(isset($_POST['nombres'])  && !empty($_POST['nombres']))
    {
	   $con=mysqli_connect($host,$user,$pwd) or die("problemas al conectarse a UE");
	   mysqli_select_db($db,$con) or die("problemas al abrir la base de datos UE");
	   
	   // Generar Codigo ----------------------------------------------
      $sql = "select valor from control ";
	  $sql .= "where parametro = 'Alumnos'";
	  $rs = mysql_query( $sql, $con );
	  $cont = mysql_result( $rs, 0, 0 );
	  $sql = "update control set valor = valor + 1 ";
	  $sql .= "where parametro = 'Alumnos'";
      	
	  $rpta = mysql_query( $sql, $con );
	  if( !$rpta ) {
		mysql_query( "rollback", $con );
		fnShowMsg( "Error", "No se puede generar el código." );
		say( "</body>" );
		return;
	  }
	  $sql = "select valor from control ";
	  $sql .= "where parametro = 'Alumnos'";
	  $rs = mysql_query( $sql, $con );
	  $cont = mysql_result( $rs, 0, 0 );
      //$codigo = "0000" . $cont ;
	  $codigo = $cont;
	  //----------------------------------------------------------------
	  echo $cont, "<br>";
	  echo $codigo, "<br>" ;
	  echo $_POST['nombres'], "<br>";
	   
	  //mysql_query( "insert into Alumnos(idAlumnos,NombresAl,ApellidosAl,FechaNacimiento,Edad) values ('$codigo','$_POST[nombres]','$_POST[ape]','$_POST[fecha]','$_POST[edad]')", $con);
	  //mysql_query("insert into incrementa(nombre) values('$_POST[nombre]')", $conexion); 
	  
	  $sql = "insert into Alumnos(idAlumno, NombresAl, ApellidosAl, FechaNacimiento, Edad ) ";
	  $sql .= " values ('$codigo', '$_POST[nombres]', '$_POST[ape]', '$_POST[fecha]', '$_POST[edad]')";
      $rpta = mysql_query( $sql, $con );
	  
	  $rpta = mysql_query( $sql, $con );
	  if(!$rpta){
		   mysql_query( "rollback", $con );
		   $msg = "Datos ingresados no son correctos.<br>";
		   $msg .= "SQL: $sql";
		   //fnShowMsg( "Error", $msg );
		   //say( "</body>" );
		   return;
	  }else{
	       mysql_query( "commit", $con );
	       $msg = "Alumno registrado correctamente.<br>";
	       $msg .= "Código Generado: $codigo<br>";
	       fnShowMsg( "Mensaje", $msg );
	       say( fnLink( "ingresar.php","","Nuevo Alumno", "Nuevo Alumno" ) );
	  }
	}
?>
</body>
</html>