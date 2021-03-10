<?php require( "libreria.php" ); ?>
<link rel="stylesheet" href="estilo.css" type="text/css">
<style type="text/css">
#apDiv2 {
	position: absolute;
	width: 48px;
	height: 50px;
	z-index: 1;
	left: 524px;
	top: 62px;
}
#apDiv3 {
	position: absolute;
	width: 48px;
	height: 50px;
	z-index: 2;
	left: 459px;
	top: 61px;
}
</style>
<body>
<h1 class="e">Listado de Alumnos</h1>
<p>
  <?php
// Conexión con la base de datos
$cn = fnConnect( $msg );
// Verificar la conexión con la base de datos
if( !$cn ) {
	fnShowMsg( "Error", $msg );
	say( "</body>" );
	return;
}
// Parámetros de Paginación
$pagesize = 5;
$pageno = 1;
if( isset($_GET["pageno"]) ) { $pageno = $_GET["pageno"]; }
// Paginación
$dezp = ($pageno - 1) * $pagesize;
$sql = "select count(*) from Alumnos ";
$rs = mysqli_query( $sql, $cn );
$rows = mysqli_result( $rs, 0, 0 );
$pages = ceil( $rows / $pagesize );
say( "Páginas: " );
for( $i = 1; $i <= $pages; $i++ ) {
	if($i != $pageno) {
		$link = "<a href='alumnosl.php?pageno=$i'>$i</a>";
	} else {
		$link = $i;
	}
	say( $link . " " );
}
// Listado
//$sql = "select IdAlumno,NombresAl, ApellidosAl, FechaNacimiento , Edad";
$sql = "select *";
$sql .= "from Alumnos limit $dezp, $pagesize";
$rs = mysqli_query( $sql, $cn );
say( "<table align='center' border='1'>" );
say( "<tr>" );
say( "<th>Código</th>" );
say( "<th>Nombre</th>" );
say( "<th>Apellido</th>" );
say( "<th>Fecha de Nacimiento</th>" );
say( "<th>Edad</th>" );
say( "</tr>" );


while( $rec = mysqli_fetch_row($rs) ) {
	say( "<tr>" );
	foreach ( $rec as $field ){
		say( "<td>$field</td>" );
	}
	say( "</tr>" )
	;
}

?>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a href="index.php">Ir al men&ugrave;</a></p>

</body>