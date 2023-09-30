-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: trailerflix
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Serie'),(2,'Película');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idGenero` int NOT NULL AUTO_INCREMENT,
  `nombreGenero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGenero`),
  UNIQUE KEY `idGenero_UNIQUE` (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Ciencia Ficción'),(2,'Fantasía'),(3,'Drama'),(4,'Ficción'),(5,'Sucesos'),(6,'Misterio'),(7,'Hechos verídicos'),(8,'Crimen'),(9,'Suspenso'),(10,'Aventura'),(11,'Acción'),(12,'Comedia'),(13,'Familia'),(14,'Western'),(15,'Tecnología'),(16,'Terror'),(17,'Historia'),(18,'Intriga');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparto`
--

DROP TABLE IF EXISTS `reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparto` (
  `idReparto` int NOT NULL AUTO_INCREMENT,
  `nombreActor` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idReparto`),
  UNIQUE KEY `idReparto_UNIQUE` (`idReparto`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparto`
--

LOCK TABLES `reparto` WRITE;
/*!40000 ALTER TABLE `reparto` DISABLE KEYS */;
INSERT INTO `reparto` VALUES (1,'Pedro Pascal'),(2,'Carl Weathers'),(3,'Misty Rosas'),(4,'Chris Bartlett'),(5,'Rio Hackford'),(6,'Giancarlo Esposito'),(7,'Tom Hopper'),(8,'David Castañeda'),(9,'Emmy Raver-Lampman'),(10,'Robert Sheehan'),(11,'Aidan Gallagher'),(12,'Elliot Page'),(13,'Anya Taylor-Joy'),(14,'Thomas Brodie-Sangster'),(15,'Harry Melling'),(16,'Moses Ingram'),(17,'Chloe Pirrie'),(18,'Janina Elkin'),(19,'Lili Reinhart'),(20,'Casey Cott'),(21,'Camila Mendes'),(22,'Marisol Nichols'),(23,'Madelaine Petsch'),(24,'Mädchen Amick'),(25,'Claire Fox'),(26,'Olivia Colman'),(27,'Matt Smith'),(28,'Tobias Menzies'),(29,'Vanesa Kirby'),(30,'Helena Bonham Carter'),(31,'Millie Bobby Brown'),(32,'Henry Cavill'),(33,'Sam Claflin'),(34,'Louis Partridge'),(35,'Adeel Akhtar'),(36,'Joaquin Phoenix'),(37,'Robert De Niro'),(38,'Zazie Beetz'),(39,'Frances Conroy'),(40,'Brett Cullen'),(41,'Shea Whigham'),(42,'Robert Downey Jr.'),(43,'Chris Evans'),(44,'Mark Ruffalo'),(45,'Chris Hemsworth'),(46,'Scarlett Johansson'),(47,'Jeremy Renner'),(48,'Emilia Clarke'),(49,'Lena Headey'),(50,'Sophie Turner'),(51,'Kit Harington'),(52,'Peter Dinklage'),(53,'Nikolaj Coster-Waldau'),(54,'Grant Gustin'),(55,'Carlos Valdes'),(56,'Danielle Panabaker'),(57,'Candice Patton'),(58,'Jesse L. Martin'),(59,'Tom Cavanagh'),(60,'Jim Parsons'),(61,'Johnny Galecki'),(62,'Kaley Cuoco'),(63,'Simon Helberg'),(64,'Kunal Nayyar'),(65,'Melissa Rauch'),(66,'Mayim Bialik'),(67,'Jennifer Aniston'),(68,'Courteney Cox'),(69,'Lisa Kudrow'),(70,'David Schwimmer'),(71,'Matthew Perry'),(72,'Matt LeBlanc'),(73,'Amybeth McNulty'),(74,'Geraldine James'),(75,'R. H. Thomson'),(76,'Corrine Koslo'),(77,'Dalila Bela'),(78,'Lucas Jade Zumann'),(79,'Gillian Anderson'),(80,'David Duchovny'),(81,'Mitch Pileggi'),(82,'Robert Patrick'),(83,'Tom Braidwood'),(84,'Bruce Harwood'),(85,'Jared Harris'),(86,'Stellan Skarsgård'),(87,'Emily Watson'),(88,'Paul Ritter'),(89,'Jessie Buckley'),(90,'Adam Nagaitis'),(91,'Evan Rachel Wood'),(92,'Thandie Newton'),(93,'Jeffrey Wright'),(94,'Tessa Thompson'),(95,'Ed Harris'),(96,'Luke Hemsworth'),(97,'Lee Pace'),(98,'Scoot McNairy'),(99,'Mackenzie Davis'),(100,'Kerry Bishé'),(101,'Toby Huss'),(102,'Alana Cavanaugh'),(103,'Jessica Chastain'),(104,'John Malkovich'),(105,'Colin Farrell'),(106,'Common'),(107,'Geena Davis'),(108,'Ioan Gruffudd'),(109,'Margot Robbie'),(110,'Ewan McGregor'),(111,'Mary Elizabeth Winstead'),(112,'Jurnee Smollett'),(113,'Rosie Perez'),(114,'Chris Messina'),(115,'Stacy Martin'),(116,'Rhona Mitra'),(117,'Theo James'),(118,'Peter Ferdinando'),(119,'Lia Williams'),(120,'Toby Jones'),(121,'Dwayne Johnson'),(122,'Kevin Hart'),(123,'Jack Black'),(124,'Karen Gillan'),(125,'Awkwafina'),(126,'Nick Jonas'),(127,'Miranda Cosgrove'),(128,'Kate Walsh'),(129,'Omar Epps'),(130,'Angus Macfadyen'),(131,'Jorja Fox'),(132,'Enver Gjokaj'),(133,'Bill Skarsgård'),(134,'Bill Hader'),(135,'James McAvoy'),(136,'Isaiah Mustafa'),(137,'Jay Ryan'),(138,'Chadwick Boseman'),(139,'Michael B. Jordan'),(140,'Lupita Nyong\'o'),(141,'Danai Gurira'),(142,'Martin Freeman'),(143,'Daniel Kaluuya'),(144,'Christian Bale'),(145,'Matt Damon'),(146,'Caitriona Balfe'),(147,'Josh Lucas'),(148,'Noah Jupe'),(149,'Jon Bernthal'),(150,'Génesis Rodríguez'),(151,'Vincent Piazza'),(152,'Benjamin Sokolow'),(153,'Emily Bayiokos'),(154,'Amy Manson'),(155,'Luke Allen-Gale'),(156,'Nina Bergman'),(157,'Dominic Mafham'),(158,'James Weber Brown'),(159,'Lorina Kamburova'),(160,'Marion Cotillard'),(161,'Laurence Fishburne'),(162,'Jude Law'),(163,'Kate Winslet'),(164,'Jennifer Ehle'),(165,'Gwyneth Paltrow'),(166,'Florence Pugh'),(167,'David Harbour'),(168,'O.T. Fagbenle'),(169,'Rachel Weisz'),(170,'William Hurt'),(171,'Ray Winstone'),(172,'Kristen Wiig'),(173,'Jeff Daniels'),(174,'Michael Peña'),(175,'Sean Bean'),(176,'Kate Mara'),(177,'Alicia Vikander'),(178,'Domhnall Gleeson'),(179,'Oscar Isaac'),(180,'Sonoya Mizuno'),(181,'Corey Johnson'),(182,'Claire Selby'),(183,'Gana Bayarsaikhan'),(184,'Bryce Dallas Howard'),(185,'Chris Pratt'),(186,'Irrfan Khan'),(187,'Vincent D\'Onofrio'),(188,'Omar Sy'),(189,'Nick Robinson'),(190,'Judy Greer'),(191,'Will Smith'),(192,'Alice Braga'),(193,'Charlie Tahan'),(194,'Dash Mihok'),(195,'Salli Richardson-Whitfield'),(196,'Willow Smith'),(197,'Emma Thompson'),(198,'Ryan Gosling'),(199,'Claire Foy'),(200,'Jason Clarke'),(201,'Kyle Chandler'),(202,'Corey Stoll'),(203,'Patrick Fugit'),(204,'John Boyega'),(205,'Scott Eastwood'),(206,'Cailee Spaeny'),(207,'Jing Tian'),(208,'Rinko Kikuchi'),(209,'Burn Gorman');
/*!40000 ALTER TABLE `reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailer`
--

DROP TABLE IF EXISTS `trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailer` (
  `idTrailer` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `link` varchar(120) DEFAULT NULL,
  `resumen` varchar(1000) DEFAULT NULL,
  `poster` varchar(100) DEFAULT NULL,
  `temporadas` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idTrailer`),
  UNIQUE KEY `idTrailer_UNIQUE` (`idTrailer`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailer`
--

LOCK TABLES `trailer` WRITE;
/*!40000 ALTER TABLE `trailer` DISABLE KEYS */;
INSERT INTO `trailer` VALUES (1,'The Crown',NULL,'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.','/posters/1.jpg','4'),(2,'Riverdale',NULL,'El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.','/posters/2.jpg','5'),(3,'The Mandalorian','https://www.youtube.com/embed/aOC8E8z_ifw','Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.','/posters/3.jpg','2'),(4,'The Umbrella Academy',NULL,'La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.','/posters/4.jpg','1'),(5,'Gambito de Dama',NULL,'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.','/posters/5.jpg','1'),(6,'Enola Holmes',NULL,'La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.','/posters/6.jpg','N/A'),(7,'Guasón','https://www.youtube.com/embed/zAGVQLHvwOY','Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.','/posters/7.jpg','N/A'),(8,'Avengers: End Game',NULL,'Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.','/posters/8.jpg','N/A'),(9,'Juego de tronos',NULL,'En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.','/posters/9.jpg','8'),(10,'The Flash',NULL,'Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.','/posters/10.jpg','6'),(11,'The Big Bang Theory','https://www.youtube.com/embed/WBb3fojgW0Q','Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.','/posters/11.jpg','12'),(12,'Friends',NULL,'\'Friends\' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.','/posters/12.jpg','10'),(13,'Anne with an \"E\"',NULL,'Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.','/posters/13.jpg','2'),(14,'Expedientes Secretos \'X\'','https://www.youtube.com/embed/KKziOmsJxzE','Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de \'siniestro\'.','/posters/14.jpg','11'),(15,'Chernobyl','https://www.youtube.com/embed/s9APLXM9Ei8','Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.','/posters/15.jpg','1'),(16,'Westworld','https://www.youtube.com/embed/qLFBcdd6Qw0','\'Westworld\' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.','/posters/16.jpg','3'),(17,'Halt and Catch Fire','https://www.youtube.com/embed/pWrioRji60A','Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).','/posters/17.jpg','4'),(18,'Ava',NULL,'Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.','/posters/18.jpg','N/A'),(19,'Aves de presa y la fantabulosa emancipación de una Harley Quinn',NULL,'Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.','/posters/19.jpg','N/A'),(20,'Archivo','https://www.youtube.com/embed/VHSoCnDioAo','2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.','/posters/20.jpg','N/A'),(21,'Jumanji - The next level','https://www.youtube.com/embed/rBxcF-r9Ibs','Las aventuras continúan en el fantástico mundo del videojuego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?','/posters/21.jpg','N/A'),(22,'3022','https://www.youtube.com/embed/AGQ7OkmIx4Q','La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.','/posters/22.jpg','N/A'),(23,'IT - Capítulo 2','https://www.youtube.com/embed/hZeFeYSmBcg','En este segundo capítulo Han pasado 27 años desde que el \'Club de los Perdedores\', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.','/posters/23.jpg','N/A'),(24,'Pantera Negra','https://www.youtube.com/embed/BE6inv8Xh4A','T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.','/posters/24.jpg','N/A'),(25,'Contra lo imposible (Ford versus Ferrari)','https://www.youtube.com/embed/SOVb0-2g1Q0','Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.','/posters/25.jpg','N/A'),(26,'Centígrados',NULL,'Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.','/posters/26.jpg','N/A'),(27,'DOOM: Aniquilación','https://www.youtube.com/embed/nat3u3gAVLE','Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.','/posters/27.jpg','N/A'),(28,'Contagio','https://www.youtube.com/embed/4sYSyuuLk5g','De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.','/posters/28.jpg','N/A'),(29,'Viuda Negra','https://www.youtube.com/embed/BIn8iANwEog','Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.','/posters/29.jpg','N/A'),(30,'The Martian','https://www.youtube.com/embed/XvB58bCVfng','Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.','/posters/30.jpg','N/A'),(31,'Ex-Machina','https://www.youtube.com/embed/XRYL5spvEcI','Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.','/posters/31.jpg','N/A'),(32,'Jurassic World',NULL,'Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.','/posters/32.jpg','N/A'),(33,'Soy leyenda','https://www.youtube.com/embed/dtKMEAXyPkg','Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.','/posters/33.jpg','N/A'),(34,'El primer hombre en la luna',NULL,'Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.','/posters/34.jpg','N/A'),(35,'Titanes del pacífico - La insurrección',NULL,'Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.','/posters/35.jpg','N/A');
/*!40000 ALTER TABLE `trailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailercategoria`
--

DROP TABLE IF EXISTS `trailercategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailercategoria` (
  `idTrailerCateogria` int NOT NULL AUTO_INCREMENT,
  `idTrailer` int NOT NULL,
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`idTrailerCateogria`),
  UNIQUE KEY `idTrailerCateogria_UNIQUE` (`idTrailerCateogria`),
  KEY `idCategoria_idx` (`idCategoria`),
  KEY `idTrailer_idx` (`idTrailer`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `idTrailer` FOREIGN KEY (`idTrailer`) REFERENCES `trailer` (`idTrailer`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailercategoria`
--

LOCK TABLES `trailercategoria` WRITE;
/*!40000 ALTER TABLE `trailercategoria` DISABLE KEYS */;
INSERT INTO `trailercategoria` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,2),(7,7,2),(8,8,2),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,2),(19,19,2),(20,20,2),(21,21,2),(22,22,2),(23,23,2),(24,24,2),(25,25,2),(26,26,2),(27,27,2),(28,28,2),(29,29,2),(30,30,2),(31,31,2),(32,32,2),(33,33,2),(34,34,2),(35,35,2);
/*!40000 ALTER TABLE `trailercategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailergenero`
--

DROP TABLE IF EXISTS `trailergenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailergenero` (
  `idTrailerGenero` int NOT NULL AUTO_INCREMENT,
  `idTrailer` int NOT NULL,
  `idGenero` int NOT NULL,
  PRIMARY KEY (`idTrailerGenero`),
  KEY `idGenero_idx` (`idGenero`),
  KEY `idTrailer_idx` (`idTrailer`),
  CONSTRAINT `id_Trailer` FOREIGN KEY (`idTrailer`) REFERENCES `trailer` (`idTrailer`),
  CONSTRAINT `idGenero` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailergenero`
--

LOCK TABLES `trailergenero` WRITE;
/*!40000 ALTER TABLE `trailergenero` DISABLE KEYS */;
INSERT INTO `trailergenero` VALUES (1,1,3),(2,1,7),(3,2,3),(4,2,6),(5,2,4),(6,3,1),(7,3,2),(8,4,1),(9,4,2),(10,5,3),(11,5,4),(12,5,5),(13,6,4),(14,6,3),(15,6,6),(16,7,8),(17,7,9),(18,7,3),(19,8,10),(20,8,1),(21,8,11),(22,9,10),(23,9,2),(24,9,3),(25,10,1),(26,10,2),(27,11,12),(28,11,2),(29,11,4),(30,12,12),(31,12,13),(32,12,3),(33,13,3),(34,13,13),(35,13,14),(36,14,3),(37,14,1),(38,15,3),(39,15,7),(40,16,14),(41,16,1),(42,17,4),(43,17,3),(44,17,15),(45,18,11),(46,18,3),(47,18,9),(48,19,11),(49,19,4),(50,19,12),(51,20,11),(52,20,1),(53,20,9),(54,21,12),(55,21,4),(56,21,10),(57,22,1),(58,22,9),(59,23,16),(60,23,9),(61,23,2),(62,24,11),(63,24,10),(64,24,2),(65,25,3),(66,25,17),(67,25,10),(68,26,3),(69,26,9),(70,26,18),(71,27,11),(72,27,1),(73,27,16),(74,28,3),(75,28,9),(76,28,4),(77,29,3),(78,29,11),(79,29,10),(80,30,3),(81,30,1),(82,30,10),(83,31,3),(84,31,1),(85,31,9),(86,32,9),(87,32,10),(88,32,4),(89,33,3),(90,33,16),(91,33,4),(92,34,3),(93,34,7),(94,35,11),(95,35,2),(96,35,1);
/*!40000 ALTER TABLE `trailergenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailerreparto`
--

DROP TABLE IF EXISTS `trailerreparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailerreparto` (
  `idTrailerReparto` int NOT NULL AUTO_INCREMENT,
  `idTrailer` int NOT NULL,
  `idReparto` int NOT NULL,
  PRIMARY KEY (`idTrailerReparto`),
  UNIQUE KEY `idTrailerReparto_UNIQUE` (`idTrailerReparto`),
  KEY `idTrailer_idx` (`idTrailer`),
  KEY `idReparto_idx` (`idReparto`),
  CONSTRAINT `idReparto` FOREIGN KEY (`idReparto`) REFERENCES `reparto` (`idReparto`),
  CONSTRAINT `idTrailerFk` FOREIGN KEY (`idTrailer`) REFERENCES `trailer` (`idTrailer`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailerreparto`
--

LOCK TABLES `trailerreparto` WRITE;
/*!40000 ALTER TABLE `trailerreparto` DISABLE KEYS */;
INSERT INTO `trailerreparto` VALUES (1,1,25),(2,1,26),(3,1,27),(4,1,28),(5,1,29),(6,1,30),(7,2,19),(8,2,20),(9,2,21),(10,2,22),(11,2,23),(12,2,24),(13,3,1),(14,3,2),(15,3,3),(16,3,4),(17,3,5),(18,3,6),(19,4,7),(20,4,8),(21,4,9),(22,4,10),(23,4,11),(24,4,12),(25,5,13),(26,5,14),(27,5,15),(28,5,16),(29,5,17),(30,5,18),(31,6,31),(32,6,32),(33,6,33),(34,6,30),(35,6,34),(36,6,35),(37,7,36),(38,7,37),(39,7,38),(40,7,39),(41,7,40),(42,7,41),(43,8,42),(44,8,43),(45,8,44),(46,8,45),(47,8,46),(48,8,47),(49,9,48),(50,9,49),(51,9,50),(52,9,51),(53,9,52),(54,9,53),(55,10,54),(56,10,55),(57,10,56),(58,10,57),(59,10,58),(60,10,59),(61,11,60),(62,11,61),(63,11,62),(64,11,63),(65,11,64),(66,11,65),(67,11,66),(68,12,67),(69,12,68),(70,12,69),(71,12,70),(72,12,71),(73,12,72),(74,13,73),(75,13,74),(76,13,75),(77,13,76),(78,13,77),(79,13,78),(80,14,79),(81,14,80),(82,14,81),(83,14,82),(84,14,83),(85,14,84),(86,15,85),(87,15,86),(88,15,87),(89,15,88),(90,15,89),(91,15,90),(92,16,91),(93,16,92),(94,16,93),(95,16,94),(96,16,95),(97,16,96),(98,17,97),(99,17,98),(100,17,99),(101,17,100),(102,17,101),(103,17,102),(104,18,103),(105,18,104),(106,18,105),(107,18,106),(108,18,107),(109,18,108),(110,19,109),(111,19,110),(112,19,111),(113,19,112),(114,19,113),(115,19,114),(116,20,115),(117,20,116),(118,20,117),(119,20,118),(120,20,119),(121,20,120),(122,21,121),(123,21,122),(124,21,123),(125,21,124),(126,21,125),(127,21,126),(128,22,127),(129,22,128),(130,22,129),(131,22,130),(132,22,131),(133,22,132),(134,23,133),(135,23,103),(136,23,134),(137,23,135),(138,23,136),(139,23,137),(140,24,138),(141,24,139),(142,24,140),(143,24,141),(144,24,142),(145,24,143),(146,25,144),(147,25,145),(148,25,146),(149,25,147),(150,25,148),(151,25,149),(152,26,150),(153,26,151),(154,26,152),(155,26,153),(156,27,154),(157,27,155),(158,27,156),(159,27,157),(160,27,158),(161,27,159),(162,28,160),(163,28,145),(164,28,161),(165,28,162),(166,28,163),(167,28,164),(168,28,165),(169,29,46),(170,29,166),(171,29,167),(172,29,168),(173,29,169),(174,29,170),(175,29,171),(176,30,145),(177,30,103),(178,30,172),(179,30,173),(180,30,174),(181,30,175),(182,30,176),(183,31,177),(184,31,178),(185,31,179),(186,31,180),(187,31,181),(188,31,182),(189,31,183),(190,32,184),(191,32,185),(192,32,186),(193,32,187),(194,32,188),(195,32,189),(196,32,190),(197,33,191),(198,33,192),(199,33,193),(200,33,194),(201,33,195),(202,33,196),(203,33,197),(204,34,198),(205,34,199),(206,34,200),(207,34,201),(208,34,202),(209,34,203),(210,35,204),(211,35,205),(212,35,206),(213,35,207),(214,35,208),(215,35,209);
/*!40000 ALTER TABLE `trailerreparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trailers`
--

DROP TABLE IF EXISTS `trailers`;
/*!50001 DROP VIEW IF EXISTS `trailers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trailers` AS SELECT 
 1 AS `idTrailer`,
 1 AS `titulo`,
 1 AS `link`,
 1 AS `resumen`,
 1 AS `poster`,
 1 AS `temporadas`,
 1 AS `categoria`,
 1 AS `generos`,
 1 AS `reparto`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `trailers`
--

/*!50001 DROP VIEW IF EXISTS `trailers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trailers` AS select `t`.`idTrailer` AS `idTrailer`,`t`.`titulo` AS `titulo`,coalesce(`t`.`link`,'Sin link') AS `link`,`t`.`resumen` AS `resumen`,`t`.`poster` AS `poster`,(case when (`t`.`temporadas` = 'N/A') then 'Sin temporadas' else `t`.`temporadas` end) AS `temporadas`,`c`.`nombreCategoria` AS `categoria`,group_concat(distinct `g`.`nombreGenero` separator ', ') AS `generos`,group_concat(distinct `r`.`nombreActor` separator ', ') AS `reparto` from ((((((`trailer` `t` join `trailercategoria` `tc` on((`t`.`idTrailer` = `tc`.`idTrailer`))) join `categoria` `c` on((`tc`.`idCategoria` = `c`.`idCategoria`))) join `trailergenero` `tg` on((`t`.`idTrailer` = `tg`.`idTrailer`))) join `genero` `g` on((`tg`.`idGenero` = `g`.`idGenero`))) join `trailerreparto` `tr` on((`t`.`idTrailer` = `tr`.`idTrailer`))) join `reparto` `r` on((`tr`.`idReparto` = `r`.`idReparto`))) group by `t`.`idTrailer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-30 15:09:10
