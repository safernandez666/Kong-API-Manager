-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: maradona
-- ------------------------------------------------------
-- Server version       5.6.50

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `frases`
--

DROP TABLE IF EXISTS `frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frase` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `detalle` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
INSERT INTO `frases` VALUES (1,'Fue la mano de Dios.','Así patentó la célebre frase, cuando en el Mundial de México 1986 le hizo a Inglaterra un gol con la mano.'),(2,'Yo me equivoqué y pagué, pero la pelota no se mancha.','Una frase célebre, en una Bombonera llena durante el partido de su despedida del fútbol.'),(3,'Yo tengo dos sueños. Mi primer sueño es jugar en el Mundial. Y el segundo es salir campeón del mundo.','Una de las primeras declaraciones de Maradona, cuando jugaba en los Cebollitas.'),(4,'Se le escapó la tortuga.','Una frase muy recordada por Diego, que la usó en muchas ocasiones y se hizo un clásico en la sociedad. Julio Grondona, ex presidente de la AFA, fue destinatario de ella en alguna ocasión.'),(5,'Me cortaron las piernas.','En el Mundial de 1994, tras ser suspendido por consumo de efedrina y quedar afuera de la Copa luego de un control antidoping.'),(6,'La pelota no se mancha.','Una de las frases más famosas, en su partido despedida realizado en La Bombonera.'),(7,'Si está vacío, que se llene, porque no se puede traicionar a los hinchas.','Una dura declaración sobre Riquelme, en 2012, luego de que Román dijera que no iba a seguir en Boca.'),(8,'Pelé debutó con un pibe…','Al brasileño lo cuestionó muchas veces, con temas extrafutbolísticos, aunque en varias oportunidades se amigó.'),(9,'Lástima no se le tiene a nadie, maestro.','En un programa de TV, el 10 le dijo esta frase a José Sanfilippo, quien cuestionaba a la Selección que había sigo goleada por Colombia en las Eliminatorias de 1994.'),(10,'Ganarle a River es como que tu mamá te venga a despertar con un beso a la mañana.','Sobre su pasión por Boca, y lo que significaba para Maradona vencer al clásico rival.'),(11,'Más falso que dólar celeste.','Una frase que en más de una ocasión sirvió para mostrar lo pensaba sobre un conocido con el que la relación terminó mal.'),(12,'Pensé que venía Berlusconi y me encontré con el cartonero Báez.','Una de las frases más recordadas, comparando a Macri, presidente de Boca, con el cartonero del caso Monzón.'),(13,'Me siento más sólo que Kung Fu.','Cuando se estaba recuperando de sus adicciones en Cuba, el 10 puso un buen ejemplo de ese particular momento.'),(14,'Les pido que me dejen vivir mi vida. Nunca quise ser un ejemplo.','Una frase muy escuchada por el 10, cuando era criticado por sus acciones dentro y fuera de la cancha.'),(15,'Lo espero Segurola y Habana 4310, séptimo piso.','Con Julio César Toresani tuvo un fuerte cruce en un Boca-Colón. El 10 le dio la dirección de su casa para un mano a mano.'),(16,'Para mí, ir a un Mundial es lo mismo que para un chico ir a Disney.','La pasión por el Mundial y por la Selección siempre estuvo presente.'),(17,'Fuma debajo del agua.','Sobre Guillermo Coppola, su representante y amigo, con quien se había peleado y luego se reconcilió.'),(18,'Si voy al banco es para sacar plata, fiera.','Ocurrencia que tuvo cuando le preguntaron si el DT iba a ponerlo en el banco, durante su ciclo en Boca en 1996.'),(19,'Si no me va a contestar, es un botón.','Con el árbitro Javier Castrilli tuvo una relación polémica durante su segundo ciclo en Boca.'),(20,'Si a Sampaoli le tirás la pelota, te la devuelve con la mano.','Jorge Sampaoli no escapó a la ironía del 10. Así lo definió cuando Sampa llegó a la Selección.'),(21,'Si nos quedábamos afuera del Mundial, yo me tenía que ir a Haití.','Una sincera declaración cuando Diego era DT de Argentina y sufrió y mucho para llegar al Mundial de Sudáfrica 2010.'),(22,'La droga es un pacman que se come a toda tu familia.','Uno de los momentos más sinceros, cuando habló de la droga y su familia.'),(23,'Ahora que me dijo gordito le voy a meter cuatro goles.','Cuando jugaba en Argentinos, el Loco Gatti lo tildó de “gordito”. Maradona había dicho que le iba a hacer dos goles, pero tras escuchar esas declaraciones subió la apuesta. El Bicho goleó a Boca con cuatro goles de Diego.'),(24,'Para jugar contra Australia nos daban café veloz.','Otra de sus frases polémicas, cuando señaló que Grondona, ex presidente de la AFA, les aseguró que ante Australia en el Repechaje para el Mundial ’94 no habría control antidoping.'),(25,'Es capaz de meterle un supositorio a una liebre.','Sobre el Hernán Bernasconi, el juez que armó una causa trucha en la que encarceló a Guillermo Coppola.'),(26,'La tenés adentro.','Frase dirigida al periodista Juan Carlos Pasman, uno de los tantos críticos de su tarea como DT de la Selección, tras la clasificación al Mundial de 2010.'),(27,'Cristiano Ronaldo hace un gol y te vende un shampoo.','Así describió al portugués, por su manera de mostrarse dentro y fuera de la cancha.'),(28,'Cuando entré al Vaticano y vi todo ese oro me convertí en una bola de fuego.','Sus críticas a la Iglesia tampoco escaparon a la mirada del 10.'),(29,'Quería ir a Estados Unidos, pero el cabeza de termo de Clinton no me deja.','En 1996 quiso viajar a Estados Unidos, no lo dejaron y Pelusa no dudó en apuntar contra el presidente norteamericano.'),(30,'Fui, soy y seré drogadicto.','Una frase fuerte, que en 1996 tuvo mucho eco cuando le preguntaron sobre sus problemas con las drogas.'),(31,'Es inútil querer hacer caudillo a un hombre que va 20 veces al baño antes de un partido.','Tras el fracaso del Mundial de Rusia cuestionó nada menos que a Lionel Messi, a quien muchas otras veces elogió.'),(32,'Los boludos son como las hormigas, están en todas partes del mundo.','En medio de un conflicto familiar entre Rocío Oliva y Verónica Ojeda, fue contundente.'),(33,'Crecí en un barrio privado de Buenos Aires... privado de luz, de agua, de teléfono.','Una dura realidad que Maradona expresó con humor, hablando sobre el lugar que lo vio nacer.'),(34,'Mis hijas legítimas son Dalma y Gianinna. Los demás son hijos de la plata o de la equivocación.','En 1999 fue duro cuando le preguntaron sobre sus hijos no reconocidos. Luego, cambió y les dio lugar a Diego Junior y a Jana.'),(35,'Boca-River es distinto a todo otro clásico. Es como dormir con Julia Roberts.','Maradona señaló siempre que un Superclásico no se compara con nada… salvo con la reconocida actriz.'),(36,'La rinoscopía, el pelo corto... Un día los muchachos de la Selección se van a rascar un huevo y Passarella se los va a mandar a cortar.','Con Daniel Passarella siempre estuvo enfrentado, sobre todo cuando el ex defensor fue DT de la Selección.'),(37,'Si me muero, quiero volver a nacer y quiero ser futbolista.','Una frase que hoy cobra más fuerza que nunca. La dijo en 1992.');
/*!40000 ALTER TABLE `frases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-17 21:01:19