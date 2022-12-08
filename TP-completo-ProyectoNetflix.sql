-- Alumno Roman Gabriel Sebastian
create database if not exists ProyectoNetflix;
use ProyectoNetflix;

create table if not exists Paises(
	IdPais int primary key auto_increment,
    nombre varchar(255) not null
);

create table if not exists Genero(
	IdGenero int primary key auto_increment,
    nombre varchar(255) not null
);

create table if not exists Director(
	IdDirector int primary key auto_increment,
    nombre varchar(255) not null,
    apellido varchar(255) not null,
    IdPais int not null,
    FOREIGN KEY (IdPais) REFERENCES Paises(IdPais)
);

create table if not exists Usuarios(
	IdUsuarios int primary key auto_increment,
    nick varchar(255) not null,
    nombre varchar(255) not null,
    apellido varchar(255) not null,
    fNacimiento date  not null,
    contrasenia varchar(255) not null,
    sexo enum ('M','F'),
    IdPais int not null,
    FOREIGN KEY (IdPais) REFERENCES Paises(IdPais)
);

create table if not exists Peliculas(
	IdPeliculas int primary key auto_increment,
    nombre varchar(255),
    duracion int(4),
    descripcion text,
    IdDirector int not null,
    IdGenero int not null,
    IdPais int not null,
    FOREIGN KEY (IdPais) REFERENCES Paises(IdPais),
    FOREIGN KEY (IdGenero) REFERENCES Genero(IdGenero),
    FOREIGN KEY (IdDirector) REFERENCES Director(IdDirector)
);

create table if not exists Series(
	IdSeries int primary key auto_increment,
    nombre varchar(255),
    duracion int(4),
    temporadas int(2),
    capitulos int(2),
    descripcion text,
    IdGenero int not null,
    IdPais int not null,
    FOREIGN KEY (IdPais) REFERENCES Paises(IdPais),
    FOREIGN KEY (IdGenero) REFERENCES Genero(IdGenero)
);

create table if not exists Anime(
	IdAnime int primary key auto_increment,
    nombre varchar(255),
    duracion int(4),
    temporadas int(2),
    capitulos int(2),
    descripcion text,
    IdGenero int not null,
    IdPais int not null,
    FOREIGN KEY (IdPais) REFERENCES Paises(IdPais),
    FOREIGN KEY (IdGenero) REFERENCES Genero(IdGenero)
);

-- esta la comente, por que en la correccion me dijiste que la quitara

/*create table if not exists Favortios(
	IdUsuarios int not null,
    IdPeliculas int not null,
    IdSeries int not null,
    IdAnime int not null,
    FOREIGN KEY (IdUsuarios) REFERENCES Usuarios(IdUsuarios),
    FOREIGN KEY (IdPeliculas) REFERENCES Peliculas(IdPeliculas),
    FOREIGN KEY (IdSeries) REFERENCES Series(IdSeries),
    FOREIGN KEY (IdAnime) REFERENCES Anime(IdAnime)
);*/

-- aplicando las correcciones dadas
use ProyectoNetflix;
-- drop table `proyectonetflix`.`favortios`;
/* esta comentado, para que no gerene errores
esto no lo corrigio, pero lo quise agregar*/
alter table usuarios add column email varchar(255);

-- agregando las tablas nuevas 
create table if not exists UsuarioPeliculas(
	IdUsuarios int not null,
    IdPeliculas int not null,
    vista bool,
    favorita bool,
    FOREIGN KEY (IdUsuarios) REFERENCES Usuarios(IdUsuarios),
    FOREIGN KEY (IdPeliculas) REFERENCES Peliculas(IdPeliculas)
);

create table if not exists UsuarioAnime(
	IdUsuarios int not null,
    IdAnime int not null,
    vista bool,
    favorita bool,
    FOREIGN KEY (IdUsuarios) REFERENCES Usuarios(IdUsuarios),
    FOREIGN KEY (IdAnime) REFERENCES Anime(IdAnime)
);

create table if not exists UsuarioSeries(
	IdUsuarios int not null,
    IdSeries int not null,
    vista bool,
    favorita bool,
    FOREIGN KEY (IdUsuarios) REFERENCES Usuarios(IdUsuarios),
    FOREIGN KEY (IdSeries) REFERENCES Series(IdSeries)
);

/* carga de datos | abajo de cada carga hay un select, para que verificar que se haya cargado correctamente */

use ProyectoNetflix;
insert into Paises (IdPAis,Nombre) values 
(1, 'Australia'),
(2, 'Austria'),
(3, 'Azerbaiyán'),
(4, 'Anguilla'),
(5, 'Argentina'),
(6, 'Armenia'),
(7, 'Bielorrusia'),
(8, 'Belice'),
(9, 'Bélgica'),
(10, 'Bermudas'),
(11, 'Bulgaria'),
(12, 'Brasil'),
(13, 'Reino Unido'),
(14, 'Hungría'),
(15, 'Vietnam'),
(16, 'Haiti'),
(17, 'Guadalupe'),
(18, 'Alemania'),
(19, 'Países Bajos, Holanda'),
(20, 'Grecia'),
(21, 'Georgia'),
(22, 'Dinamarca'),
(23, 'Egipto'),
(24, 'Israel'),
(25, 'India'),
(26, 'Irán'),
(27, 'Irlanda'),
(28, 'España'),
(29, 'Italia'),
(30, 'Kazajstán'),
(31, 'Camerún'),
(32, 'Canadá'),
(33, 'Chipre'),
(34, 'Kirguistán'),
(35, 'China'),
(36, 'Costa Rica'),
(37, 'Kuwait'),
(38, 'Letonia'),
(39, 'Libia'),
(40, 'Lituania'),
(41, 'Luxemburgo'),
(42, 'México'),
(43, 'Moldavia'),
(44, 'Mónaco'),
(45, 'Nueva Zelanda'),
(46, 'Noruega'),
(47, 'Polonia'),
(48, 'Portugal'),
(49, 'Reunión'),
(50, 'Rusia'),
(51, 'El Salvador'),
(52, 'Eslovaquia'),
(53, 'Eslovenia'),
(54, 'Surinam'),
(55, 'Estados Unidos'),
(56, 'Tadjikistan'),
(57, 'Turkmenistan'),
(58, 'Islas Turcas y Caicos'),
(59, 'Turquía'),
(60, 'Uganda'),
(61, 'Uzbekistán'),
(62, 'Ucrania'),
(63, 'Finlandia'),
(64, 'Francia'),
(65, 'República Checa'),
(66, 'Suiza'),
(67, 'Suecia'),
(68, 'Estonia'),
(69, 'Corea del Sur'),
(70, 'Japón'),
(71, 'Croacia'),
(72, 'Rumanía'),
(73, 'Hong Kong'),
(74, 'Indonesia'),
(75, 'Jordania'),
(76, 'Malasia'),
(77, 'Singapur'),
(78, 'Taiwan'),
(79, 'Bosnia y Herzegovina'),
(80, 'Bahamas'),
(81, 'Chile'),
(82, 'Colombia'),
(83, 'Islandia'),
(84, 'Corea del Norte'),
(85, 'Macedonia'),
(86, 'Malta'),
(87, 'Pakistán'),
(88, 'Papúa-Nueva Guinea'),
(89, 'Perú'),
(90, 'Filipinas'),
(91, 'Arabia Saudita'),
(92, 'Tailandia'),
(93, 'Emiratos árabes Unidos'),
(94, 'Groenlandia'),
(95, 'Venezuela'),
(96, 'Zimbabwe'),
(97, 'Kenia'),
(98, 'Algeria'),
(99, 'Líbano'),
(100, 'Botsuana'),
(101, 'Tanzania'),
(102, 'Namibia'),
(103, 'Ecuador'),
(104, 'Marruecos'),
(105, 'Ghana'),
(106, 'Siria'),
(107, 'Nepal'),
(108, 'Mauritania'),
(109, 'Seychelles'),
(110, 'Paraguay'),
(111, 'Uruguay'),
(112, 'Congo (Brazzaville)'),
(113, 'Cuba'),
(114, 'Albania'),
(115, 'Nigeria'),
(116, 'Zambia'),
(117, 'Mozambique'),
(119, 'Angola'),
(120, 'Sri Lanka'),
(121, 'Etiopía'),
(122, 'Túnez'),
(123, 'Bolivia'),
(124, 'Panamá'),
(125, 'Malawi'),
(126, 'Liechtenstein'),
(127, 'Bahrein'),
(128, 'Barbados'),
(130, 'Chad'),
(131, 'Man, Isla de'),
(132, 'Jamaica'),
(133, 'Malí'),
(134, 'Madagascar'),
(135, 'Senegal'),
(136, 'Togo'),
(137, 'Honduras'),
(138, 'República Dominicana'),
(139, 'Mongolia'),
(140, 'Irak'),
(141, 'Sudáfrica'),
(142, 'Aruba'),
(143, 'Gibraltar'),
(144, 'Afganistán'),
(145, 'Andorra'),
(147, 'Antigua y Barbuda'),
(149, 'Bangladesh'),
(151, 'Benín'),
(152, 'Bután'),
(154, 'Islas Virgenes Británicas'),
(155, 'Brunéi'),
(156, 'Burkina Faso'),
(157, 'Burundi'),
(158, 'Camboya'),
(159, 'Cabo Verde'),
(164, 'Comores'),
(165, 'Congo (Kinshasa)'),
(166, 'Cook, Islas'),
(168, 'Costa de Marfil'),
(169, 'Djibouti, Yibuti'),
(171, 'Timor Oriental'),
(172, 'Guinea Ecuatorial'),
(173, 'Eritrea'),
(175, 'Feroe, Islas'),
(176, 'Fiyi'),
(178, 'Polinesia Francesa'),
(180, 'Gabón'),
(181, 'Gambia'),
(184, 'Granada'),
(185, 'Guatemala'),
(186, 'Guernsey'),
(187, 'Guinea'),
(188, 'Guinea-Bissau'),
(189, 'Guyana'),
(193, 'Jersey'),
(195, 'Kiribati'),
(196, 'Laos'),
(197, 'Lesotho'),
(198, 'Liberia'),
(200, 'Maldivas'),
(201, 'Martinica'),
(202, 'Mauricio'),
(205, 'Myanmar'),
(206, 'Nauru'),
(207, 'Antillas Holandesas'),
(208, 'Nueva Caledonia'),
(209, 'Nicaragua'),
(210, 'Níger'),
(212, 'Norfolk Island'),
(213, 'Omán'),
(215, 'Isla Pitcairn'),
(216, 'Qatar'),
(217, 'Ruanda'),
(218, 'Santa Elena'),
(219, 'San Cristobal y Nevis'),
(220, 'Santa Lucía'),
(221, 'San Pedro y Miquelón'),
(222, 'San Vincente y Granadinas'),
(223, 'Samoa'),
(224, 'San Marino'),
(225, 'San Tomé y Príncipe'),
(226, 'Serbia y Montenegro'),
(227, 'Sierra Leona'),
(228, 'Islas Salomón'),
(229, 'Somalia'),
(232, 'Sudán'),
(234, 'Swazilandia'),
(235, 'Tokelau'),
(236, 'Tonga'),
(237, 'Trinidad y Tobago'),
(239, 'Tuvalu'),
(240, 'Vanuatu'),
(241, 'Wallis y Futuna'),
(242, 'Sáhara Occidental'),
(243, 'Yemen'),
(246, 'Puerto Rico');

select * from paises;

insert into Genero (IdGenero,Nombre) values
(1, 'Acción'),
(2, 'Aventuras'),
(3, 'Ciencia Ficción'),
(4, 'Comedia'),
(5, 'Drama'),
(6, 'Fantasía'),
(7, 'Musical'),
(8, 'Suspenso'),
(9, 'Terror'),
(10, 'Animación'),
(11, 'Western'),
(12, 'Deportes'),
(13, 'Históricas'),
(14, 'Crimen'),
(15, 'Futuristas'),
(16, 'Religiosas'),
(17, 'Romance'),
(18, 'Policíaco'),
(19, 'Biográfico'),
(20, 'Cine independiente'),
(21, 'Cine infantil'),
(22, 'Artes Marciales'),
(23, 'Carreras'),
(24, 'Demencia'),
(25, 'Demonios'),
(26, 'Ecchi'),
(27, 'Escolares'),
(28, 'Espacial'),
(29, 'Escolares'),
(30, 'Harem'),
(31, 'Josei'),
(32, 'Juegos'),
(33, 'Magia'),
(34, 'Mecha'),
(35, 'Militar'),
(36, 'Misterio'),
(37, 'Parodia'),
(38, 'Psicológico'),
(39, 'Recuentos de la vida'),
(40, 'Samurai'),
(41, 'Seinen'),
(42, 'Shoujo'),
(43, 'Shounen'),
(44, 'Sobrenatural'),
(45, 'Superpoderes'),
(46, 'Vampiros'),
(47, 'Yaoi'),
(48, 'Yuri');

select * from genero;

insert into Usuarios (IdUsuarios,nick,nombre,apellido,fNacimiento,contrasenia,sexo,idPais,email) values
(1,'locoXlaspelis','Gerardo','Gonzalez',19880620,'qwerty123','M',111,'mrawkesby1@businessweek.com'),
(2,'Cinefila','Camila','Rondosa',19910426,'ljkasdj4ied','F',5,'celford0@rambler.ru'),
(3,'MagoGaro','Gabriel','Roman',19900302,'-asd48541dsd','M',5,'mhudspith1i@google.cn'),
(4,'ＦＩＸＡ４４４','Pedro','Jesus',19951223,'qwerty123','M',12,'mclegg1d@rambler.ru'),
(5,'ValkyriAce','Ludmila','Santos',20000506,'fsfasfd','F',95,'wdillingham1f@yolasite.com'),
(6,'Maléfica','Angelica','Lopez',19990606,'qewewrsd','F',110,'arauprich2@cocolog-nifty.com'),
(7,'FelinaFeliz','Marina','Echeverria',20020207,'43trgre123','F',103,'bbanbridge3@gmpg.org'),
(8,'BrujaBlair','Julieta','Serrano',19980120,'fdg654465b123','F',42,'cspini4@imageshack.us'),
(9,'BlackMamba','Esteban','Ugalde',19901129,'564651553','M',42,'tgoode5@people.com.cn'),
(10,'GhostEater','Ricando','Zamora',19970830,'weffsd--4','M',28,'ntovey6@intel.com'),
(11,'HellBringer','Eduardo','Sanchez',20000904,'5s64f65s4df','M',5,'arubel7@abc.net.au'),
(12,'DarkBoss','Fabian','Martinez',20010921,'q0060sdf','M',5,'rcattermoul8@smh.com.au'),
(13,'xXPredatorXx','Luis','Gomez',20020718,'wfedrbs','M',123,'rmacquarrie9@japanpost.jp'),
(14,'KroKoB34ST','Edwin','Garcia',20030414,'sf91bdf654','M',123,'babrahamoffa@scribd.com'),
(15,'Butcher','German','Perez',19970626,'fd941f9g4','M',81,'lemanuelb@kickstarter.com'),
(16,'CruelDemon','Fernando','Ordoña',19990716,'dgf654fg2','M',5,'cdensunc@wiley.com'),
(17,'B00mH34dSh0t','Patricio','Valverde',20010720,'fd954591g','M',103,'mrossod@php.net'),
(18,'HadesBringer','Lucas','Frios',20020109,'165f65g1f','M',82,'bbinniee@nytimes.com'),
(19,'TitánCronos','Ignacio','Leiva',20020202,'fdgfsd60g4','M',110,'ebengoecheaf@amazon.co.jp'),
(20,'DiosaMalice','Brenda','Gutierrez',20020916,'hj6g0hjg','F',5,'ballching@unicef.org');

select * from usuarios;

insert into director (IdDirector,nombre,apellido,IdPais) values
(1,'George','Lucas',55),
(2,'Quentin','Tarantino',55),
(3,'Steven','Spielberg',55),
(4,'Woody','Allen',55);

select * from director;

insert into peliculas (IdPeliculas,nombre,duracion,descripcion,IdDirector,IdGenero,IdPais) values
(1,'Star Wars: Episodio IV - Una nueva esperanza',121,'Hace mucho tiempo en una galaxia muy, muy lejana ... Son tiempos de guerra civil. Naves rebeldes han atacado desde una base secreta y han obtenido su primera victoria contra el malvado Imperio Galáctico. Durante la batalla, espías rebeldes lograron robar los planos secretos del arma más extrema del Imperio, la Estrella de la Muerte, una estación espacial blindada con suficiente potencia para destruir un planeta entero. Perseguida por los siniestros agentes del Imperio, la Princesa Leia se dirige velozmente a casa en su nave espacial, mientras resguarda los planos que pueden salvar a su pueblo y restaurar la libertad en la galaxia[...]',1,3,55),
(2,'Star Wars: Episodio I - La amenaza fantasma,',136,'Hace mucho tiempo en una galaxia muy, muy lejana [...] La República Galáctica está sumida en disturbios. Hay protestas contra la tributación de las rutas comerciales a sistemas estelares. [...] Esperando resolver el problema con un bloqueo de mortíferos cruceros, la avariciosa Federación de Comercio ha detenido todos los envios al pequeño planeta de Naboo. [...] Mientras el Congreso de la República debate sin fin esta alarmante cadena de acontecimientos, el Canciller Supremo ha despachado en secreto a dos Caballeros Jedi, los guardianes de la paz y la justicia en la galaxia, a resolver el conflicto...',1,3,55),
(3,'Kill Bill: Volumen 1',110,'En plena celebración de su boda, la Novia sufre un ataque brutal que acaba con la vida de muchos de sus invitados y también del novio. Mamba Negra estaba embarazada y se sumerge en un largo coma que durará hasta cuatro años. Después de este trance, la Novia se despierta y recuerda lo ocurrido. Descubre desconsolada que ha perdido a su hijo y con él todo lo que más quería, así que la sed de venganza contra los responsables de aquella tragedia será infinita.',2,1,55),
(4,'Kill Bill: Volumen 2',136,'Después de cinco años en coma, la “Mamba Negra” descubre con sorpresa que han querido asesinarla y que le han arrebatado al hijo que estaba esperando. Inicia entonces un plan para acabar con sus compañeros del Escuadrón de Serpientes Asesinas, que fueron quienes la traicionaron.',2,1,55),
(5,'E.T., el extraterrestre',114,'Un pequeño extraterrestre de otro planeta queda abandonado en la Tierra cuando su nave se olvida de él. Está completamente solo y asustado hasta que Elliott, un niño de nueve años, lo encuentra y decide esconderlo en su casa para protegerlo. El chico y sus hermanos intentarán encontrar la forma de devolver al extraterrestre a su planeta antes de que lo encuentren los científicos y la policía.',3,3,55),
(6,'Midnight in Paris',94,'Gil es un guionista de Hollywood algo bohemio que llega con su prometida Inez y los padres de ésta a París. El hombre es un entusiasta del París de los años 20 y planea escribir un libro sobre esa época, aunque su prometida no lo entiende. Una noche, cuando Gil camina solo por las calles de la ciudad, es invitado dentro de una limusina y viaja al pasado. Entonces conoce a todos los personajes que jamás hubiera imaginado conocer.',4,17,55);

select * from peliculas;

insert into series (IdSeries,nombre,duracion,temporadas,capitulos,descripcion,IdGenero,IdPais) values
(1,'House M. D.',43,8,177,'En el Princenton Plainsboro de Nueva Jersey, el Dr. Gregory House, un singular genio de la medicina, se encarga de resolver casos como lo haría Sherlock Holmes. De forma astuta juega con la psicología de la Dra. Lisa Cuddy, su mejor amigo, el oncólogo James Wilson, y del resto de su equipo de trabajo.',5,55),
(2,'Breaking Bad',45,5,62,'Tras cumplir 50 años, Walter White (Bryan Cranston), un profesor de química de un instituto de Albuquerque, Nuevo México, se entera de que tiene un cáncer de pulmón incurable. Casado con Skyler (Anna Gunn) y con un hijo discapacitado (RJ Mitte), la brutal noticia lo impulsa a dar un drástico cambio a su vida: decide, con la ayuda de un antiguo alumno (Aaron Paul), fabricar anfetaminas y ponerlas a la venta. Lo que pretende es liberar a su familia de problemas económicos cuando se produzca el fatal desenlace',8,55),
(3,'Game of Thrones',55,8,73,'La historia se desarrolla en un mundo ficticio de carácter medieval donde hay Siete Reinos. Hay tres líneas argumentales principales: la crónica de la guerra civil dinástica por el control de Poniente entre varias familias nobles que aspiran al Trono de Hierro; la creciente amenaza de "los otros", seres desconocidos que viven al otro lado de un inmenso muro de hielo que protege el Norte de Poniente; y el viaje de Daenerys Targaryen, la hija exiliada del rey que fue asesinado en una guerra civil anterior, y que pretende regresar a Poniente para reclamar sus derechos dinásticos. Tras un largo verano de varios años, el temible invierno se acerca a los Siete Reinos. Lord Eddard Ned Stark, señor de Invernalia, deja sus dominios para ir a la corte de su amigo, el rey Robert Baratheon, en Desembarco del Rey, la capital de los Siete Reinos. Stark se convierte en la Mano del Rey e intenta desentrañar una maraña de intrigas que pondrá en peligro su vida y la de todos los suyos. Mientras tanto, diversas facciones conspiran con un solo objetivo: apoderarse del trono.',2,55),
(4,'Börü',80,1,6,'Una unidad de seguridad especial, con arriesgadas misiones por toda Turquía, se enfrenta al peligro y la tragedia, tanto en el terreno como en casa.',1,59),
(5,'El encargado',30,1,11,'Eliseo trabaja como encargado en un importante edificio y, cada vez que los dueños no están, aprovecha para disfrutar de las comodidades de sus apartamentos.',1,5);

select * from series;

insert into anime (IdAnime,nombre,duracion,temporadas,capitulos,descripcion,IdGenero,IdPais) values
(1,'Quan Zhi Gao Shou',24,2,24,'En el juego en línea Glory, Ye Xiu, es conocido como el experto en el nivel de libros de texto y un jugador de alto nivel. Debido a una serie de circunstancias, fue expulsado por la fuerza de su equipo profesional. Después de abandonar la escena pro gaming, reside en un Cyber Café, empleado como uno de los gerentes. Cuando Glory lanza el décimo servidor, se lanza al juego una vez más, equipado con diez años de experiencia en juegos, recuerdos del pasado y un arma incompleta hecha a sí misma. Su viaje de regreso a la cima comienza.',1,35),
(2,'Slam Dunk',25,2,101,'trata sobre la vida de Hanamichi Sakuragi, un pandillero que se convierte en un gran jugador de baloncesto, sólo para tratar de ligar con una chica de su escuela',12,70),
(3,'Death Note',23,2,37,'Diez años después de que Light, un estudiante de bachillerato, encontrara un cuaderno con poderes sobrenaturales llamado "Death Note", seis nuevos cuadernos llegan a la Tierra, la cual se está consumiendo por culpa del ciberterrorismo. Dos nuevos herederos del ADN de Light y el detective L volverán a enfrentarse por el control de las Death Notes, mientras el agente de policía Mishima tendrá que luchar contra todos para evitar que esta nueva batalla destruya el mundo entero.',36,70),
(4,'Hinomaruzumou',24,1,24,'El sumo es algo más que un arte marcial, ¡es un ritual divino! Prepárate para disfrutar de toda la emoción y sudar como nunca con el mundo del sumo. Ushio Hinomaru puede ser pequeño de tamaño, pero está dispuesto a demostrar su valía en el ring. El problema es que el sumo es un deporte donde tu peso y tamaño son muy importantes y dependes directamente de ellos, con lo que su pasión no bastará para compensar su poca envergadura. ¡Da inicio la batalla por el Hinoshita Kaisan!',12,70),
(5,'Great Teacher Onizuka',23,1,43,'Eikichi Onizuka, 22 años, soltero, esta es la forma en que este peculiar personaje se presenta; con su gran sueño de ser profesor Onizuka se enfrenta a una serie de problemas, creados por quienes podrían ser los alumnos mas problemáticos para un profesor. Estudiantes que crean a la vez un sinfín de divertidas situaciones',4,70);

select * from anime;

insert into usuariopeliculas (IdUsuarios,IdPeliculas,vista,favorita) values
(5,3,false,false),
(3,1,true,true),
(1,6,true,false),
(1,2,true,false),
(8,4,false,false);

select * from usuariopeliculas;

insert into usuarioseries (IdUsuarios,IdSeries,vista,favorita) values
(2,3,true,true),
(3,3,true,true),
(15,1,true,false),
(6,4,false,false),
(3,5,true,true);

select * from usuarioseries;

insert into usuarioanime (IdUsuarios,IdAnime,vista,favorita) values
(18,2,true,true),
(4,1,true,false),
(9,5,false,true),
(1,4,false,false),
(4,1,true,true);

select * from usuarioanime;

/* Vistas */

-- vista 1 
create or replace view  vista_ListadoDePeliculas as
select p.nombre, p.duracion, g.nombre as 'genero', p.descripcion, d.nombre as 'nombre director', d.apellido as 'apellido director'
from peliculas as p
inner join director as d
on p.IdDirector = d.IdDirector
inner join genero as g
on p.IdGenero = g.IdGenero;

select * from vista_listadodepeliculas;

-- vista 2
create or replace view  vista_ListadoDeUsuarios as
select u.nick, u.sexo ,pa.nombre as 'pais'
from usuarios as u
inner join paises as pa
on u.IdPais = pa.IdPais;

select * from vista_ListadoDeUsuarios;

-- vista 3
create or replace view  vista_ListadoDeVistoPeliculas as
select u.nick, pe.nombre, p.vista
from usuariopeliculas as p
inner join usuarios as u
on p.IdUsuarios = u.IdUsuarios
inner join peliculas as pe
on p.IdPeliculas = pe.IdPeliculas
order by (nick);

select * from vista_ListadoDeVistoPeliculas;

-- vista 4
create or replace view  vista_ListadoDeSeries as
select s.nombre, s.duracion, s.temporadas, s.capitulos, s.descripcion, g.nombre as 'genero', pa.nombre as 'pais'
from series as s
inner join genero as g
on s.IdGenero = g.IdGenero
inner join paises as pa
on s.IdPais = pa.IdPais
order by (nombre);

select * from vista_ListadoDeSeries;

/* Funciones */

-- primera funcion

delimiter $$
create function pais_origen(p_id_pais int)
returns varchar(255)
reads sql data
begin
	declare respuesta varchar(255);
    set respuesta = (select nombre from paises where IdPais = p_id_pais);
    return respuesta;
end
$$

SELECT nombre , duracion , descripcion ,  pais_origen(IdPais) as 'Pais origen' from peliculas;
SELECT nombre , duracion , descripcion ,  pais_origen(IdPais) as 'Pais origen' from anime;
SELECT nombre , duracion , descripcion ,  pais_origen(IdPais) as 'Pais origen' from series;

-- segunda funcion

DELIMITER $$
CREATE FUNCTION cantidad_peliculas_director (p_director_id INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
	DECLARE n_r VARCHAR(244);
    DECLARE c_r INT;
    
    SET n_r = (SELECT apellido FROM director WHERE IdDirector = p_director_id );
    SET c_r = (select count(*) from peliculas WHERE IdDirector = p_director_id);
    
    RETURN CONCAT('El Director: ' , n_r , ' Dirigio ' , c_r , ' pelis');
    
END
$$

SELECT IdDirector , cantidad_peliculas_director(IdDirector) as 'Cantidad de Pelis' from peliculas GROUP BY `IdDirector`;

/* Stored Procedure */

-- Stored Procedures 1

select * from genero;

DELIMITER $$
create procedure SP_AgregarGenero (in Vgenero varchar(100))
begin
	
    insert into genero (nombre) values (Vgenero);
end$$

call SP_AgregarGenero('Thriller');
select * from genero;

-- Stored Procedures 2

select * from peliculas;

DELIMITER $$
create procedure SP_DuracionPeliculas (in DP int)
begin
	if DP >= 120 then
		select * from peliculas where duracion >= DP order by duracion asc;
	else
		select * from peliculas where duracion <= DP order by duracion asc;
	end if;
end$$

call SP_DuracionPeliculas(121);

/* Triggers */

-- se crea una tabla de Registros
use proyectonetflix;

create table if not exists `Registros` (
  `Id_Registro` int primary key auto_increment,
  `anotacion` varchar(255) ,
  `fecha` datetime  default current_timestamp
  );
  
  -- Primer Trigger
  delimiter //
create trigger TR_log_nuevo_usuario after insert on usuarios
for each row begin
  insert into registros(anotacion) value (concat('Se inserto el usuario: ',"ID ",NEW.IdUsuarios));
end//

insert into Usuarios (nick,nombre,apellido,fNacimiento,contrasenia,sexo,idPais,email) values
('Seriefila','Jhoana','Perez',20000916,'sdsdffs','F',5,'JhoanaPerez@unicef.org');

Select * from registros;

-- Segundo Trigger
delimiter //
create trigger TR_log_modificaion_usuario after update on usuarios
for each row begin
  insert into registros(anotacion) value (concat('Se Modifico el usuario: ',"ID ",NEW.IdUsuarios));
end//

SET SQL_SAFE_UPDATES = 0;

UPDATE usuarios   
    SET contrasenia  = 'sh5g4g7f'
    where email = 'mhudspith1i@google.cn';
    
Select * from registros;