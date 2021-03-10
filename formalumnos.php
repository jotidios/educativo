<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<link rel="stylesheet" href="estilo.css" type="text/css">
<style type="text/css">
#apDiv2 {
	position: absolute;
	width: 48px;
	height: 50px;
	z-index: 1;
	left: 606px;
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
#apDiv {
	position: absolute;
	width: 48px;
	height: 50px;
	z-index: 1;
	left: 534px;
	top: 64px;
}
</style>

<body>
<center>

 <h1 class="e">Alumnos</h1>
 <p><a href="index.php">Principal</a></p>
 <tr></tr>
 <tr></tr>
  <form action="insertaralumnos.php" method="post" name="form">
    <p>Nombres
      <input name="nombres" type="text" />
    </p>
    <p><br />
      Apellidos<input name="ape" type="text" />
    </p>
    <p><br />
      Fecha - Nac<input name="fecha" type="text" />
    </p>
    <p><br />
      Edad<input name="edad" type="text" />
    </p>
    <p><br />
    </p>
    <tr></tr>
    <tr></tr>
    <input name="" type="submit" value="Insertar Datos" />
  </form>
</center>
</body>
</html>