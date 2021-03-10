/*
 * Empresa          :  marvalsoft
 * Site             :  www.marval.com
 * DBMS             :  MySQL Server
 * Base de Datos    :  rh
 * Descripción      : Base de Datos de Recursos Humanos
 * Script           :  Crea la Base de Datos
 * Responsable      :  Vaesca Corporation
 * Email            :  vaesca@grupovaesca.com
 * Web site         :  http://www.grupovaesca.com/vaesca
*/


CREATE DATABASE IF NOT EXISTS ue;
USE ue;

CREATE TABLE control (
    Parametro       varchar(20)     Not Null,
	Valor    		varchar(20)		Not Null,
	Constraint Pk_control Primary Key (parametro)
) ENGINE = INNODB;

CREATE TABLE Profesores (
    IdProfesor		char(4)	        Not Null,
	NombresProf		char(50)		Not Null,
	ApellidosProf	char(50)		Not Null,
	FechaNacimiento	date			Not Null,
	TituloAcademico	char(70)		Not Null,
	Edad			int				Not Null,
	Constraint Pk_Profesor Primary Key (IdProfesor)
) ENGINE = INNODB;

Create Table Parciales
(
	IdParcial		int				Not Null,
	FechaInicio		date			Not Null,
	FechaFin		date			Not Null,
	Constraint Pk_Parciales Primary Key (IdParcial)
) ENGINE = INNODB;

Create Table Alumnos
(
	IdAlumno		char(4)	        Not Null, 
	NombresAl		char(50)		Not Null,
	ApellidosAl		char(50)		Not Null,
	FechaNacimiento	date			Not Null,
	Edad			int				Not Null,
	Constraint Pk_Alumno Primary Key (IdAlumno)
)ENGINE = INNODB;

Create Table Especialidades
(
	IdEspecialidad		int			Not Null,
	NombreEsp			char(20)	Not Null,
	Constraint Pk_Especialidad Primary Key (IdEspecialidad)
)ENGINE = INNODB;

Create Table Cursos
(
	IdCurso			int				Not Null,
	IdEspecialidad	int				Not Null,
	NombreCurso		char(15)		Not Null,
	Paralelo		char(2)			Not Null,
	Constraint Pk_Cursos Primary Key (IdCurso)
)ENGINE = INNODB;

Create Table Asignaturas
(
	IdAsignatura	char(4)		    Not Null,
	NombresAs		char(50)		Not Null,
	NumHoras		int				Not Null,
	IdEspecialidad	int				Not Null,
	IdCurso			int				Not Null,
	Constraint Pk_Asignaturas Primary Key (IdAsignatura),
    Constraint Rel_AsignaturasCursos
        Foreign key (IdCurso)
        References Cursos(IdCurso)
		ON DELETE RESTRICT 
        ON UPDATE RESTRICT,
    Constraint Rel_AsignaturasEspecialidad
        Foreign key (IdEspecialidad)
        References Especialidades(IdEspecialidad)
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT
)ENGINE = INNODB;

Create Table Asignaturas_Profesor
(
	IdAsignatura	char(4)		Not Null,
	IdProfesor		char(4)	Not Null,
    Constraint Rel_AsignaturasProfesor
        Foreign key (IdProfesor)
        References Profesores(IdProfesor),
    Constraint Rel_AsignaturasProfesor_Asig
        Foreign key (IdAsignatura)
        References Asignaturas(IdAsignatura)
)ENGINE = INNODB;

CREATE TABLE RegistroCalifaciones (
    IdRegistro      int             Not Null,
    IdAlumno        char(4)         Not Null,
    IdProfesor      char(4)         Not Null,
    IdAsignatura    char(4)         Not Null,
    IdParcial       int             Not Null,
    FechaRegistro   date            Not Null,
	Lecciones		Decimal(2,2)	Null,
	TareasClase		Decimal(2,2)	Null,	
	TareasEClase	Decimal(2,2)	Null,
	TrabGrupal		Decimal(2,2)	Null,
	NotaParcial		Decimal(2,2)	Null,
	Ano_Lectivo		varchar(12)	    Not Null,
	Observacion		varchar(12)	    Not Null,
    CONSTRAINT pk_Registro PRIMARY KEY ( IdRegistro, IdAlumno, IdProfesor, IdAsignatura, IdParcial ),
    Constraint Rel_RegistroAlumno
        Foreign key (IdAlumno)
        References Alumnos(IdAlumno)
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT,
    Constraint Rel_RegistroProfesor
        Foreign key (IdProfesor)
        References Profesores(IdProfesor)
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT,
    Constraint Rel_RegistroParcial
        Foreign key (IdParcial)
        References Parciales(IdParcial)
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT,
    Constraint Rel_RegistroAsignaturas
        Foreign key (IdAsignatura)
        References Asignaturas(IdAsignatura)
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT
) ENGINE = INNODB;

/*------------------------------------------------------------------------------------*/
/*-------------INSERTAMOS PRIMERO DATOS EN LAS ENTIDADES FUERTES ---------------------*/
/*------------------------------------------------------------------------------------*/
INSERT INTO control ( Parametro, Valor ) VALUES ( 'Especialidades', '0006');
INSERT INTO control ( Parametro, Valor ) VALUES ( 'Profesores', '0006');
INSERT INTO control ( Parametro, Valor ) VALUES ( 'Cursos', '0006');
INSERT INTO control ( Parametro, Valor ) VALUES ( 'Alumnos', '0006');
INSERT INTO control ( Parametro, Valor ) VALUES ( 'Parciales', '0006');
INSERT INTO control ( Parametro, Valor ) VALUES ( 'Asignaturas', '0006');
INSERT INTO control ( Parametro, Valor ) VALUES ( 'Asignaturas_Profesor', '0006');
INSERT INTO control ( Parametro, Valor ) VALUES ( 'RegistroCalifaciones', '0006');
/*-----------------------------------------------------------------------------------*/	   
INSERT INTO Especialidades ( IdEspecialidad, NombreEsp )  
       VALUES ( 001, 'Multimedia');
INSERT INTO Especialidades ( IdEspecialidad, NombreEsp )  
       VALUES ( 002, 'Informatica');
INSERT INTO Especialidades ( IdEspecialidad, NombreEsp )  
       VALUES ( 003, 'Lenguas');
INSERT INTO Especialidades ( IdEspecialidad, NombreEsp )  
       VALUES ( 004, 'Matematicas');
INSERT INTO Especialidades ( IdEspecialidad, NombreEsp )  
       VALUES ( 005, 'Historia');
INSERT INTO Especialidades ( IdEspecialidad, NombreEsp )  
       VALUES ( 006, 'Biologia');	   
/*-----------------------------------------------------------------------------------*/	   
INSERT INTO Profesores ( IdProfesor, NombresProf, ApellidosProf, FechaNacimiento, TituloAcademico, Edad ) 
       VALUES ( '0001', 'Juan', 'Perez',  '19600406', 'Doctor', 55);
INSERT INTO Profesores ( IdProfesor, NombresProf, ApellidosProf, FechaNacimiento, TituloAcademico, Edad ) 
       VALUES ( '0002', 'Barak', 'Obama',  '19700609', 'Licenciado', 58);
INSERT INTO Profesores ( IdProfesor, NombresProf, ApellidosProf, FechaNacimiento, TituloAcademico, Edad ) 
       VALUES ( '0003', 'Vladimir', 'Putin',  '19801107', 'PhD', 65);	   
INSERT INTO Profesores ( IdProfesor, NombresProf, ApellidosProf, FechaNacimiento, TituloAcademico, Edad ) 
       VALUES ( '0004', 'Evo', 'Morales',  '19600406', 'Doctor', 55);
INSERT INTO Profesores ( IdProfesor, NombresProf, ApellidosProf, FechaNacimiento, TituloAcademico, Edad ) 
       VALUES ( '0005', 'Pablo', 'Escobar',  '19700609', 'Licenciado', 58);
INSERT INTO Profesores ( IdProfesor, NombresProf, ApellidosProf, FechaNacimiento, TituloAcademico, Edad ) 
       VALUES ( '0006', 'Bachar', 'Asad',  '19801107', 'PhD', 65);	   
/*--------------------------------------------------------------------------------*/	
INSERT INTO Cursos ( IdCurso, IdEspecialidad, NombreCurso, Paralelo )  
       VALUES ( 001, 'Multimedia', 'Tercero', 'A4');
INSERT INTO Cursos ( IdCurso, IdEspecialidad, NombreCurso, Paralelo )  
       VALUES ( 002, 'Multimedia', 'Cuarto', 'A3');
INSERT INTO Cursos ( IdCurso, IdEspecialidad, NombreCurso, Paralelo )  
       VALUES ( 003, 'Informatica', 'Primero', 'A1');
INSERT INTO Cursos ( IdCurso, IdEspecialidad, NombreCurso, Paralelo )  
       VALUES ( 004, 'Fisico', 'Tercero', 'A4');
INSERT INTO Cursos ( IdCurso, IdEspecialidad, NombreCurso, Paralelo )  
       VALUES ( 005, 'Lenguas', 'Cuarto', 'A3');
INSERT INTO Cursos ( IdCurso, IdEspecialidad, NombreCurso, Paralelo )  
       VALUES ( 006, 'Lenguas', 'Primero', 'A1');
/*---------------------------------------------------------------------------------*/	   
INSERT INTO Alumnos ( IdAlumno, NombresAl, ApellidosAl, FechaNacimiento, Edad )  
       VALUES ('0001', 'Pepito', 'Soso', '19990216', 14 );
INSERT INTO Alumnos ( IdAlumno, NombresAl, ApellidosAl, FechaNacimiento, Edad )  
       VALUES ('0002', 'Rosita', 'Mesa', '19990902', 14 );
INSERT INTO Alumnos ( IdAlumno, NombresAl, ApellidosAl, FechaNacimiento, Edad )  
       VALUES ('0003', 'Carlitos', 'Tapia', '19990512', 14 );
INSERT INTO Alumnos ( IdAlumno, NombresAl, ApellidosAl, FechaNacimiento, Edad )  
       VALUES ('0004', 'Julio', 'Andrade', '19990518', 14 );
INSERT INTO Alumnos ( IdAlumno, NombresAl, ApellidosAl, FechaNacimiento, Edad )  
       VALUES ('0005', 'David', 'Gaona', '19990516', 14 );
INSERT INTO Alumnos ( IdAlumno, NombresAl, ApellidosAl, FechaNacimiento, Edad )  
       VALUES ('0006', 'Luis', 'Cepeda', '19990212', 14 );
/*---------------------------------------------------------------------------------*/
INSERT INTO Parciales ( IdParcial, FechaInicio, FechaFin )  
       VALUES ( 001, '20130423', '20130702' );
INSERT INTO Parciales ( IdParcial, FechaInicio, FechaFin )  
       VALUES ( 002, '20130612', '20130902' );
INSERT INTO Parciales ( IdParcial, FechaInicio, FechaFin )  
       VALUES ( 003, '20130401', '20130914' );
INSERT INTO Parciales ( IdParcial, FechaInicio, FechaFin )  
       VALUES ( 004, '20130423', '20130702' );
INSERT INTO Parciales ( IdParcial, FechaInicio, FechaFin )  
       VALUES ( 005, '20130612', '20130902' );
INSERT INTO Parciales ( IdParcial, FechaInicio, FechaFin )  
       VALUES ( 006, '20130401', '20130914' );
/*---------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------*/
/*-------------Ahora insertamos datos en las entidades debiles ---------------------*/
/*------------------------------------------------------------------------------------*/
INSERT INTO Asignaturas ( IdAsignatura, NombresAs, NumHoras, IdEspecialidad	, IdCurso )  
       VALUES ('0001', 'Realidad Virtual', 160, 001, 003 );
INSERT INTO Asignaturas ( IdAsignatura, NombresAs, NumHoras, IdEspecialidad	, IdCurso )  
       VALUES ('0002', 'Animacion 3D', 160, 001, 003 );
INSERT INTO Asignaturas ( IdAsignatura, NombresAs, NumHoras, IdEspecialidad	, IdCurso )  
       VALUES ('0003', 'Edicion de Video', 160, 001, 003 );
INSERT INTO Asignaturas ( IdAsignatura, NombresAs, NumHoras, IdEspecialidad	, IdCurso )  
       VALUES ('0004', 'Matematicas', 80, 002, 002 );
INSERT INTO Asignaturas ( IdAsignatura, NombresAs, NumHoras, IdEspecialidad	, IdCurso )  
       VALUES ('0005', 'Ofimatica', 80, 003, 001 );	   
INSERT INTO Asignaturas ( IdAsignatura, NombresAs, NumHoras, IdEspecialidad	, IdCurso )  
       VALUES ('0006', 'Ofimatica', 80, 003, 001 );	   
/*---------------------------------------------------------------------------------*/	   
INSERT INTO Asignaturas_Profesor ( IdAsignatura,IdProfesor )  
       VALUES ( '0001', '0001');
INSERT INTO Asignaturas_Profesor ( IdAsignatura,IdProfesor )  
       VALUES ( '0002', '0003');
INSERT INTO Asignaturas_Profesor ( IdAsignatura,IdProfesor )  
       VALUES ( '0003', '0002');
INSERT INTO Asignaturas_Profesor ( IdAsignatura,IdProfesor )  
       VALUES ( '0004', '0001');
INSERT INTO Asignaturas_Profesor ( IdAsignatura,IdProfesor )  
       VALUES ( '0005', '0002');
INSERT INTO Asignaturas_Profesor ( IdAsignatura,IdProfesor )  
       VALUES ( '0006', '0003');	   
/*---------------------------------------------------------------------------------*/	   
INSERT INTO RegistroCalifaciones ( IdRegistro,IdAlumno, IdProfesor, IdAsignatura, IdParcial, FechaRegistro, Lecciones, 
                                   TareasClase, TareasEClase, TrabGrupal, NotaParcial, Ano_Lectivo, Observacion )
	   VALUES ( 001, '0001', '0001', '0001', 001, '20130731', 10, 8.5, 7.6, 3.0, 8.0, '2013', 'Ninguna' );
INSERT INTO RegistroCalifaciones ( IdRegistro,IdAlumno, IdProfesor, IdAsignatura, IdParcial, FechaRegistro, Lecciones, 
                                   TareasClase, TareasEClase, TrabGrupal, NotaParcial, Ano_Lectivo, Observacion )
	   VALUES ( 002, '0002', '0002', '0001', 001, '20130528', 8.5, 5.1, 2.5, 5.0, 6.0, '2013', 'Ninguna' );
INSERT INTO RegistroCalifaciones ( IdRegistro,IdAlumno, IdProfesor, IdAsignatura, IdParcial, FechaRegistro, Lecciones, 
                                   TareasClase, TareasEClase, TrabGrupal, NotaParcial, Ano_Lectivo, Observacion )
	   VALUES ( 003, '0003', '0003', '0001', 001, '20130614', 7.5, 3.1, 1.5, 4.0, 8.0, '2013', 'Ninguna' );	   
INSERT INTO RegistroCalifaciones ( IdRegistro,IdAlumno, IdProfesor, IdAsignatura, IdParcial, FechaRegistro, Lecciones, 
                                   TareasClase, TareasEClase, TrabGrupal, NotaParcial, Ano_Lectivo, Observacion )
	   VALUES ( 004, '0001', '0001', '0001', 001, '20130731', 10, 8.5, 7.6, 3.0, 8.0, '2013', 'Ninguna' );
INSERT INTO RegistroCalifaciones ( IdRegistro,IdAlumno, IdProfesor, IdAsignatura, IdParcial, FechaRegistro, Lecciones, 
                                   TareasClase, TareasEClase, TrabGrupal, NotaParcial, Ano_Lectivo, Observacion )
	   VALUES ( 005, '0002', '0002', '0001', 001, '20130528', 8.5, 5.1, 2.5, 5.0, 6.0, '2013', 'Ninguna' );
INSERT INTO RegistroCalifaciones ( IdRegistro,IdAlumno, IdProfesor, IdAsignatura, IdParcial, FechaRegistro, Lecciones, 
                                   TareasClase, TareasEClase, TrabGrupal, NotaParcial, Ano_Lectivo, Observacion )
	   VALUES ( 006, '0003', '0003', '0001', 001, '20130614', 7.5, 3.1, 1.5, 4.0, 8.0, '2013', 'Ninguna' );	   	   
	   
	   
	   
	   

