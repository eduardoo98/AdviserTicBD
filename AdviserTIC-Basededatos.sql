Create database AdviserTIC;
use AdviserTIC ;
-- DROP DATABASE advisertic;
-- 1
CREATE TABLE Pais(
Id int PRIMARY KEY AUTO_INCREMENT Comment 'Primary Key',
Descripcion varchar(128) NOT NULL comment 'Descripcion sobre el pais',
FIPS104 varchar(2) NOT NULL comment 'Abreviatura de pais',
ISO2 varchar(2) NOT NULL,
ISO3 varchar(3) NULL,
ISON varchar(3) NOT NULL,
Internet varchar(2) NULL,
Capital varchar(25) NULL comment 'Capital del pais',
MapReferencia varchar(50) NULL comment 'Mapa de referencia del pais',
NacionalidadSingular varchar(35) NULL comment 'Nacionalidad en singular del pais',
NacionalidadPlural varchar(35) NULL comment 'Nacionalidad en plural del pais',
Moneda varchar(30) NULL comment 'Tipo de moneda del pais',
CodigodeMoneda varchar(3) NULL comment 'Codigo de la moneda del pais',
Poblacion bigint NULL comment 'Numero de poblacion del pais',
Titulo varchar(50) NULL comment 'Titulo del pais',
Comentario varchar(2048) NULL comment 'Comentaros sobre el pais'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los paises';
-- select *from Pais;
-- 2 
CREATE TABLE Region(
Id int PRIMARY KEY AUTO_INCREMENT Comment 'Primary Key',
Id_pais int NOT NULL Comment 'Llave Foranea de pais',
ClaveEntidad varchar(2) NOT NULL,
Descripcion varchar(500) NOT NULL comment'informacion o descripcion sobre el estado',
Abrev varchar(10) NOT NULL comment 'Abreviatura del estado',
CveCab varchar(7) NULL,
NombreCab varchar(100) NULL,
PTOT varchar(10) NULL,
PMAS varchar(10) NULL,
PFEM varchar(10) NULL,
VTOT varchar(10) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los estados';
-- select *from Region;
-- 3
CREATE TABLE Ciudad(
Id int NOT NULL PRIMARY KEY AUTO_INCREMENT Comment 'Primary Key',
Id_pais int NOT NULL Comment 'Llave Foranea de Pais',
Id_region int NOT NULL Comment 'Llave Foranea de Estado',
ClaveEntidad varchar(2) NOT NULL,
ClaveCiudad varchar(3) NOT NULL,
Descripcion varchar(500) NOT NULL comment 'Informacion o descripcion de la ciudad',
CveCab varchar(4) NULL,
NombreCab varchar(100) NULL,
PTOT varchar(10) NULL,
PMAS varchar(10) NULL,
PFEM varchar(10) NULL,
VTOT varchar(10) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los municipios';
-- select *from ciudad where id_pais=159 and id_region=19;
-- 4
Create table Empleado(
	id int auto_increment Primary Key comment 'Primary key',
	numero_EMP int unique not null comment'Numero del empleado',
	nombre varchar(50) not null comment'Nombre del empleado',
	apellido_P char(50) not null comment'Apellido paterno del empleado',
	apellido_M varchar(50) not null comment 'Apellido materno del empleado',
	f_Nacimiento date not null comment'Fecha de nacimiento del empleado',
	CURP varchar(50) not null comment'CURP del empleado',
	RFC varchar(50) null comment'RFC del empleado',
	Telefono_casa varchar(40) null comment 'Telefono de casa del empleado',
	codigo_Postal int(5) not null comment'Codigo postal del lugar donde vive el empleado',
	correo varchar(100) null comment'Correo del empleado',
	TelefonoCelular varchar(40) null comment'telefono celular del empleado',
	inicio boolean null comment 'campo que sirve para verificar si es la primera
    ves que el empleado usa la aplicacion o no', 
	Direccion varchar(200) not null comment'Colonia, calle y numero donde vive el empleado',
    id_usuario int not null comment'Llave foranea de usuario',
	id_genero int not null comment 'Llave foranea de genero',
	id_estadoC int not null comment 'Llave foranea de estado civil',
	id_region int not null comment 'Clave foranea de region',
	id_pais int not null comment 'Clave foranea de pais',
	id_ciudad int not null comment 'Clave foranea de ciudad',
	TransTime DATETIME NOT NULL comment 'seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar a los empleados';
    /*
    select*from empleado;
    INSERT INTO empleado values(1,123,'Horacio','Castillo','Puente','1990-10-30','nose','tampocose','83854444',66612,'horacio@gmail.com'
    ,'81158246',true,'arboledas',1,2,2,19,159,986,now()); 
    INSERT INTO empleado values(2,123,'leyva','leyvon','Puente','1990-10-30','nose','tampocose','83854444',66612,'horacio@gmail.com'
    ,'81158246',true,'arboledas',2,2,2,19,159,986,now());
    INSERT INTO empleado values(3,1234,'susana','leyvon','Puente','1990-10-30','nose','tampocose','83854444',66612,'horacio@gmail.com'
    ,'81158246',true,'arboledas',2,2,2,19,159,986,now());*/
-- 5
create table Universidad(
	id int auto_increment Primary Key comment 'Primary key',
	nombre varchar(100) not null comment 'Nombre completo de la universidad',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar Datos de la universidad';
-- 6
Create table Cuatrimestre (
	id int auto_increment Primary Key comment 'Primary key',
    grado varchar(10) not null comment 'Cuatrimestre que esta cursando ejemplo:5',
	grupo varchar(10) not null comment'Grupo con su grado ejemplo:A',
    turno varchar (10) not null comment 'Turno matutino o vespertino',
	modalidad varchar(10) not null comment 'Modalidad del grupo bis o Trad',
	id_carrera int not null comment 'Clave foranea de carrera',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los grupos';
    -- select *from cuatrimestre;
-- 7
create table Usuario(
	id int auto_increment not null primary key comment 'Primary key',
	usuario varchar(50) not null comment'Nombre de Usuario exclusivo del empleado',
	contraseña varchar(150) not null comment 'Contraseña exclusiva del empleado',
	activo boolean not null comment 'Campo para verificar si el usuario esta activo o no',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar a los usuarios';
    insert into usuario values(1,'horacin','123',true,now());
    insert into usuario values(2,'leyvin','123',true,now());
-- 8
create table Carrera(
	id int auto_increment Primary Key comment 'Primary key',
	nombre varchar(100) not null comment 'Nombre de la carrera del edificio',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar a las carreras';
-- 9
Create table Materia(
	id int auto_increment not null primary key comment 'Primary key',
    -- se cambio la clave a tipo entero y se quito el atributo de unidad y se puso en la tabla de calificacion
	clave int(30) not null comment 'Clave que tiene cada materia',
	nombre varchar(100) not null comment'Nombre de la materia',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar las materias de cada cuatrimestre';
   -- select *from materia;
    -- select *from cuatrimestre_materia ;
    -- inner join amaya
   /*select id_cuatrimestre,id_materia,c.grado,c.grupo,c.turno,c.modalidad,m.nombre from cuatrimestre_materia as cm inner join cuatrimestre as c
   ON cm.id_cuatrimestre=c.id join materia as m ON cm.id_materia=m.id where cm.id_cuatrimestre=4;
   
   -- este es el chido inner join brandon
   select a.matricula,a.Nombre,b.nombre,d.tipo,e.tipo,c.Nombre,a.comentario from Alumno_materia as ab inner join Alumno as a ON 
   ab.id_Alumno=a.id join materia as b ON ab.id_materia=b.id join rol_empleado as ac inner join empleado as c ON ac.id_empleado=c.id 
   join rol as d ON ac.id_rol=d.id inner join vulnerabilidad as e ON a.id=e.id where a.id=2 and c.id=2 ;
   
   -- este esta mas completo inner join brandon
   select a.matricula,a.Nombre,b.nombre,d.tipo,e.tipo,c.Nombre,a.comentario from Alumno_materia as ab inner join Alumno as a ON 
   ab.id_Alumno=a.id join materia as b ON ab.id_materia=b.id join rol_empleado as ac inner join empleado as c ON ac.id_empleado=c.id 
   join rol as d ON ac.id_rol=d.id JOIN empleado_cuatrimestre as ad ON ad.id_empleado=c.id join cuatrimestre
   as f ON ad.id_cuatrimestre=f.id inner join vulnerabilidad as e ON a.id=e.id where a.id=3 and c.id=3 ;
   
   select *from Rol_Empleado;
   select *from alumno_materia;
   select*from alumno;*/
-- 10
create table Rol(
	id int auto_increment Primary Key comment 'Primary key',
	tipo varchar(20) not null comment'tipo de rol ya sea docente,tutor o coordinador',
	activo boolean not null comment'Campo para verificar si el rol esta activo o no',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los roles disponibles';
 -- 11
Create table Alumno(
	id int auto_increment Primary Key comment 'Primary key',
	matricula int unique not null comment'Numero que se le da al alumno',
	nombre varchar(50) not null comment'Nombre del alumno',
	apellido_P varchar(50) not null comment'Apellido paterno del alumno',
	apellido_M varchar(50) not null comment'Apellido Materno del alumno',
	f_Nacimiento date not null comment'Fecha de nacimiento del alumno',
	CURP varchar(50) not null comment 'CURP del alumno',
	comentario varchar(200) null comment'Comentario que se le haga al alumno para saber como va',
	Direccion Varchar(200) not null comment'Direccion del alumno ejemplo: Colonia,calle y numero',
	RFC varchar(50) null comment'RFC del alumno si lo tiene',
	Telefono_casa varchar(40) null comment'Telefono de casa del alumno',
	Telefono_Celular varchar(40)  null comment 'Telefono celular del alumno',
	codigo_Postal int(5) not null comment'Codigo postal de donde vive el alumno',
	correo varchar(100) null comment 'Correo del alumno',
	id_cuatrimestre int not null comment 'Clave foranea de cuatrimestre',
    -- aqui no se si poner como null el atribto de vulnerabilidad ,por si el almno no es vulnerable para nada
	id_Vulnerabilidad int null comment 'Clave foranea de vulnerabilidad',
	id_genero int not null comment 'Clave foranea de genero',
	id_estadoC int not null comment 'Clave foranea de estado civil',
	id_region int not null comment 'Clave foranea de region',
	id_pais int not null comment'Clave foranea de pais',
	id_ciudad int not null comment'Clave foranea de ciudad',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar a los alumnos';
     -- select *from Alumno;
    /* INSERT INTO Alumno values(1,301610173,'Eduardo','Coronado','Montemayor','1998-08-30','COME980830HNLRND05','Bueno','Encelado #148',
     'COME980830HNLRND0534343',83850174,811496758,66612,'eduardocoronadoedu@hotmail.es',6,1,2,1,19,159,986,now());
      INSERT INTO Alumno values(2,301610172,'Brandon','lopez','Obrador','1998-08-30','COME980830HNLRND05','Bueno','Encelado #148',
     'COME980830HNLRND0534343',83850174,811496758,66612,'eduardocoronadoedu@hotmail.es',6,4,2,1,19,159,986,now());
      INSERT INTO Alumno values(3,301610174,'omar','lopez','Obrador','1998-08-30','COME980830HNLRND05','Bueno','Encelado #148',
     'COME980830HNLRND0534343',83850174,811496758,66612,'eduardocoronadoedu@hotmail.es',6,4,2,1,19,159,986,now());
     INSERT INTO Alumno values(4,301610175,'perron','lopez','Obrador','1998-08-30','COME980830HNLRND05','Bueno','Encelado #148',
     'COME980830HNLRND0534343',83850174,811496758,66612,'eduardocoronadoedu@hotmail.es',5,4,2,1,19,159,986,now());
    -- select *from cuatrimestre;
    -- select *from vulnerabilidad;
    -- select *from genero;
    -- select *from estado_civil;
    -- select *from region;
    -- select * from pais;
    select*from alumno;
    select*from alumno_materia;
    select*from calificacion;
    select*from cuatrimestre;*/
    -- select *from ciudad where descripcion='Monterrey';
-- 12
create table Menu(
	id int auto_increment Primary Key comment 'Primary key',
	menu Varchar(30) not null comment'Nombre del alguna opcion de un menu',
	activo boolean not null comment 'Campo para verificar si esta activo o no el menu',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	) ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los menus de la aplicacion';
-- 13
create table Submenu(
	id int auto_increment Primary Key comment 'Primary key',
	submenu varchar(30) not null comment'nombre de una opcion del menu',
	activo boolean not null comment 'Campo para verificar si el submenu esta activo o no',
	id_menu int not null comment 'Clave foranea de menu',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los submenus de la aplicacion';
    
-- 14
create table Vulnerabilidad(
	id int auto_increment Primary Key comment'Primary key',
	Tipo varchar(30) not null comment 'tipos de vulneraibilidades, economico,academica y perosnal',
    -- activo boolean null,
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los tipos de vulnerabilidades que hay';

    
-- 15
create table RolPermiso(
	id int auto_increment Primary Key comment 'Primary key',
	rol_id int not null comment'Clave foranea de rol',
	menu_id int not null comment 'Clave foranea de menu',
	submenu_id int not null comment 'Clave foranea de submenu',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla para almacenar los permisos que se le dara a cada usuario';
-- 16
create table Empleado_Cuatrimestre(
	id_empleado int not null comment 'Clave foranea de empleado',
	id_cuatrimestre int not null comment'Clave foranea de cuatrimestre',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla unida de empleado y cuatrimestre';
    insert into empleado_cuatrimestre values(1,6,now());
     insert into empleado_cuatrimestre values(2,6,now());
     insert into empleado_cuatrimestre values(3,5,now());
-- 17
create table Rol_Empleado(
	id_rol int not null comment 'Clave foranea del rol',
	id_empleado int not null comment 'Clave foranea de empleado',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla unida de rol y empleado';
    INSERT INTO Rol_Empleado values(2,1,now());
    INSERT INTO Rol_Empleado values(2,2,now());
    INSERT INTO Rol_Empleado values(2,3,now());
    select *from rol;
-- 18
create table Cuatrimestre_Materia (
	id_cuatrimestre int not null comment 'Clave foranea de cuatrimestre',
	id_materia int not null comment 'Clave foranea de materia',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla unida de cuatrimestre y materia';
    -- select *from Cuatrimestre;
    -- select *from Materia;
    -- select *from Cuatrimestre_Materia;
    -- select *from Cuatrimestre inner join Materia;
-- 19
create table Usuario_Rol(
	id_Usuario int not null comment 'Clave foranea de usuario',
	id_Rol int not null comment 'Clave foranea de rol',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla unida de usuario y rol';
-- 20
create table Alumno_Materia(
	id_Alumno int not null comment 'clave foranea de alumno',
	id_Materia int not null comment 'Clave foranea de materia',
	TransTime DATETIME NOT NULL comment 'Seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla de alumno y materia unidas';
    /*
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(1,30,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(1,31,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(1,32,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(1,33,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(1,34,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(1,35,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(1,36,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(2,30,now());
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(2,31,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(2,32,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(2,33,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(2,34,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(2,35,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(2,36,now());
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(3,30,now());
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(3,31,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(3,32,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(3,33,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(3,34,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(3,35,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(3,36,now());
    
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,20,now());
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,21,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,22,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,23,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,24,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,25,now());
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,26,now());
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,27,now());
	INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,28,now());
    INSERT INTO Alumno_Materia(id_Alumno,id_Materia,TransTime)values(4,29,now());
     select *from Alumno_materia ;
     select *from materia;*/
-- 21
create table Universidad_Carrera(
	id_universidad int not null comment 'Clave foranea de universidad',
	id_carrera int not null comment 'Clave foranea de carrera',
	TransTime DATETIME NOT NULL comment 'seguimiento de modificacion a la tabla'
	)ENGINE=InnoDB DEFAULT CHARSET=latin1 Comment='Tabla de universidad y carrera unidas';
-- 22
Create table Calificacion(
	id int auto_increment Primary Key comment 'Primary key',
	calificacion double(8,2) not null comment 'Calificacion dada al alumno',
    Unidad int(11) not null comment 'Unidad calificada del Alumno',
	id_cuatrimestre int not null comment 'Clave foranea de cuatrimestre',
	id_alumno int not null comment 'Clave foranea de alumno',
	id_materia int not null comment 'Clave foranea de materia',
	TransTime DATETIME NOT NULL comment 'seguimiento de modificacion a la tabla'
	);
     -- insert into Calificacion (id,calificacion,Unidad,id_cuatrimestre,id_alumno,id_materia,TransTime) values(1,10.0,1,1,1,1,NOW());
     -- select *from Calificacion;
     -- select *from Cuatrimestre;
-- 23
create table Genero(
	id int auto_increment Primary Key comment 'Primary key',
	sexo varchar(50) not null comment'si es hombre o mujer',
	TransTime DATETIME NOT NULL comment 'seguimiento de modificacion a la tabla'
	);
-- 24
create table  Estado_Civil(
id int auto_increment primary key comment 'Primary key',
estadoC varchar(50) not null comment'Estado civil de la persona ',
TransTime DATETIME NOT NULL comment 'seguimiento de modificacion a la tabla'
);


/*DELIMITER $$

CREATE PROCEDURE `sp_fail`()
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    START TRANSACTION;
    INSERT INTO `tablea` (`date`) VALUES (NOW());
    INSERT INTO `tableb` (`date`) VALUES (NOW());
    INSERT INTO `tablec` (`date`) VALUES (NOW()); -- FAIL
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;
call sp_fail;*/
