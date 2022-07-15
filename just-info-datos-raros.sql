/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : just-info

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-08-01 18:12:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comentarios
-- ----------------------------
DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id_comentario` int(50) NOT NULL AUTO_INCREMENT,
  `comentario` text NOT NULL,
  `fecha` date NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_trabajo` int(10) NOT NULL,
  PRIMARY KEY (`id_comentario`) USING BTREE,
  UNIQUE KEY `unicidad_id_comentario` (`id_comentario`) USING BTREE,
  KEY `realizan` (`id_usuario`) USING BTREE,
  KEY `reciben` (`id_trabajo`) USING BTREE,
  CONSTRAINT `realizan` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reciben` FOREIGN KEY (`id_trabajo`) REFERENCES `noticias` (`id_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comentarios
-- ----------------------------
INSERT INTO `comentarios` VALUES ('12', 'No me funciona el COD en mi celu!!!!! JAJAAJA', '2020-11-29', '17', '21');
INSERT INTO `comentarios` VALUES ('15', 'Se veia venir esta noticia la verdad. Un desastre.', '2020-11-27', '22', '18');
INSERT INTO `comentarios` VALUES ('17', 'NOOOOO. YO JUGABA GRATIS CON MIS AMIGOS', '2020-11-26', '22', '16');
INSERT INTO `comentarios` VALUES ('18', 'Steam Deck es desastrozo....', '2020-11-29', '19', '15');
INSERT INTO `comentarios` VALUES ('19', 'Excelente! Un monton de hackers no podran jugar.', '2020-11-28', '24', '16');
INSERT INTO `comentarios` VALUES ('21', 'Lo voy a probar', '2020-11-26', '25', '24');
INSERT INTO `comentarios` VALUES ('22', 'Voy a ir a verlo presencial sea donde sea.', '2020-11-28', '18', '17');
INSERT INTO `comentarios` VALUES ('23', 'Ya me canse de Dota. Siempre lo mismo...', '2020-11-29', '22', '17');
INSERT INTO `comentarios` VALUES ('24', 'GRACIAS!!!! MUY BUENA PUBLICACION', '2020-11-25', '25', '23');
INSERT INTO `comentarios` VALUES ('25', 'Me encanta cagarme bien a corchazos mientras estoy en el bondi. 10/10', '2020-11-27', '18', '21');
INSERT INTO `comentarios` VALUES ('26', 'ME ESTAFARON HACE POCO. gracias por el post', '2020-12-01', '13', '23');
INSERT INTO `comentarios` VALUES ('27', 'Buen post.', '2020-12-01', '13', '21');
INSERT INTO `comentarios` VALUES ('28', 'La PS5 es lo mejor por lejos!', '2020-12-02', '13', '15');
INSERT INTO `comentarios` VALUES ('29', 'No me la conteiner', '2020-12-01', '13', '18');
INSERT INTO `comentarios` VALUES ('30', 'vamo el barsa', '2020-12-01', '16', '11');
INSERT INTO `comentarios` VALUES ('31', 'QUE GRANDE MARKITO NAVAJA PA', '2020-12-01', '16', '22');
INSERT INTO `comentarios` VALUES ('32', 'Ubisoft = MIERDA', '2020-12-01', '16', '19');
INSERT INTO `comentarios` VALUES ('33', 'EL CORAZON SIEMPRE CON EL BARSA! EL BARSA DE LIONEL.', '2020-12-02', '33', '11');

-- ----------------------------
-- Table structure for detalle_rubros
-- ----------------------------
DROP TABLE IF EXISTS `detalle_rubros`;
CREATE TABLE `detalle_rubros` (
  `id_detalle_rubro` int(10) NOT NULL AUTO_INCREMENT,
  `id_trabajo` int(10) NOT NULL,
  `id_rubro` int(3) NOT NULL,
  PRIMARY KEY (`id_detalle_rubro`) USING BTREE,
  UNIQUE KEY `unicidad_id_detalle_rubro` (`id_detalle_rubro`) USING BTREE,
  KEY `contienen` (`id_trabajo`) USING BTREE,
  KEY `pertenecen3` (`id_rubro`) USING BTREE,
  CONSTRAINT `contienen` FOREIGN KEY (`id_trabajo`) REFERENCES `noticias` (`id_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pertenecen3` FOREIGN KEY (`id_rubro`) REFERENCES `rubros` (`id_rubro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of detalle_rubros
-- ----------------------------
INSERT INTO `detalle_rubros` VALUES ('12', '11', '11');
INSERT INTO `detalle_rubros` VALUES ('13', '15', '12');
INSERT INTO `detalle_rubros` VALUES ('14', '16', '13');
INSERT INTO `detalle_rubros` VALUES ('15', '17', '14');
INSERT INTO `detalle_rubros` VALUES ('16', '18', '15');
INSERT INTO `detalle_rubros` VALUES ('17', '19', '16');
INSERT INTO `detalle_rubros` VALUES ('18', '21', '17');
INSERT INTO `detalle_rubros` VALUES ('19', '22', '18');
INSERT INTO `detalle_rubros` VALUES ('20', '23', '19');
INSERT INTO `detalle_rubros` VALUES ('21', '24', '20');

-- ----------------------------
-- Table structure for formatos
-- ----------------------------
DROP TABLE IF EXISTS `formatos`;
CREATE TABLE `formatos` (
  `id_formato` int(3) NOT NULL AUTO_INCREMENT,
  `extension` varchar(5) NOT NULL,
  PRIMARY KEY (`id_formato`) USING BTREE,
  UNIQUE KEY `unicidad_id_formato` (`id_formato`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of formatos
-- ----------------------------
INSERT INTO `formatos` VALUES ('1', 'jpg');
INSERT INTO `formatos` VALUES ('2', 'png');
INSERT INTO `formatos` VALUES ('3', 'mp4');
INSERT INTO `formatos` VALUES ('4', 'gif');
INSERT INTO `formatos` VALUES ('5', 'mov');
INSERT INTO `formatos` VALUES ('6', 'webm');
INSERT INTO `formatos` VALUES ('7', 'jpeg');
INSERT INTO `formatos` VALUES ('8', 'avi');
INSERT INTO `formatos` VALUES ('9', 'tiff');
INSERT INTO `formatos` VALUES ('10', 'svg');

-- ----------------------------
-- Table structure for imagenes
-- ----------------------------
DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes` (
  `id_imagen` int(50) NOT NULL AUTO_INCREMENT,
  `nombre_imagen` varchar(30) NOT NULL,
  `descripcion_imagen` tinytext DEFAULT NULL,
  `id_trabajo` int(10) NOT NULL,
  `id_formato` int(3) NOT NULL,
  PRIMARY KEY (`id_imagen`) USING BTREE,
  UNIQUE KEY `unicidad_id_imagen` (`id_imagen`) USING BTREE,
  KEY `contienen3` (`id_trabajo`) USING BTREE,
  KEY `tienen` (`id_formato`) USING BTREE,
  CONSTRAINT `contienen3` FOREIGN KEY (`id_trabajo`) REFERENCES `noticias` (`id_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tienen` FOREIGN KEY (`id_formato`) REFERENCES `formatos` (`id_formato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of imagenes
-- ----------------------------
INSERT INTO `imagenes` VALUES ('11', 'rocket.png', 'Rocket league', '11', '2');
INSERT INTO `imagenes` VALUES ('12', 'steamvps5.jpg', 'Steam vs PS5', '15', '1');
INSERT INTO `imagenes` VALUES ('13', 'csgo.png', 'Counter Strike imagen', '16', '2');
INSERT INTO `imagenes` VALUES ('14', 'lol.png', 'Equipos de lol', '18', '2');
INSERT INTO `imagenes` VALUES ('15', 'dota.png', 'ubicaciones dota', '17', '2');
INSERT INTO `imagenes` VALUES ('16', 'markito.png', 'Markito Navaja', '22', '2');
INSERT INTO `imagenes` VALUES ('17', 'f1.jpg', 'Formula 1', '24', '1');
INSERT INTO `imagenes` VALUES ('18', 'cod.png', 'Call of duty mobile', '21', '2');
INSERT INTO `imagenes` VALUES ('19', 'ubisoft.jpg', 'Denuncia Ubisoft', '19', '1');
INSERT INTO `imagenes` VALUES ('20', 'roblox.jpg', 'Imagen robux', '23', '1');

-- ----------------------------
-- Table structure for niveles
-- ----------------------------
DROP TABLE IF EXISTS `niveles`;
CREATE TABLE `niveles` (
  `id_nivel` int(2) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(20) NOT NULL,
  PRIMARY KEY (`id_nivel`) USING BTREE,
  UNIQUE KEY `unicidad_id_nivel` (`id_nivel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of niveles
-- ----------------------------
INSERT INTO `niveles` VALUES ('1', 'admin');
INSERT INTO `niveles` VALUES ('2', 'usuario');

-- ----------------------------
-- Table structure for noticias
-- ----------------------------
DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id_trabajo` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `introduccion` text NOT NULL,
  `desarrollo` mediumtext NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `fecha_trabajo` date DEFAULT NULL,
  PRIMARY KEY (`id_trabajo`) USING BTREE,
  UNIQUE KEY `unicidad_id_trabajo` (`id_trabajo`) USING BTREE,
  KEY `suben` (`id_usuario`) USING BTREE,
  CONSTRAINT `suben` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of noticias
-- ----------------------------
INSERT INTO `noticias` VALUES ('11', 'El FC Barcelona volverá a Rocket League fichando a White Demons', 'El conjunto azulgrana volverá a apostar fuerte por Rocket League, uno de sus títulos insignia en los esports, firmando a uno de los equipos españoles con más proyección y que más han sorprendido en la última RLCS X.', 'Aunque parezca que fue hace mucho, un 4 de abril de 2019 se confirmó una de las mayores noticias para la comunidad española de Rocket League, y es que el FC Barcelona entraba de lleno en el título de Psyonix firmando un roster de ensueño.\r\n\r\nEn aquel entonces, la plantilla formada por Bluey, Deevo y Alpha54 tenían un gran futuro europeo, y lograron no solo un subcampeonato europeo en la RLCS 7, sino también ir a los mundiales de esta temporada.\r\n\r\nCon el tiempo, el Barça logró una ESL Masters española y seguir aumentando su historial en Rocket League, volviendo a hacer un top 4 europeo en marzo de 2020 con Deevo, Flakes y Ronaky, volviéndose a meter en un mundial que nunca se llegó a disputar.\r\nSin embargo, el Barça abandonó Rocket League el pasado 19 de abril despidiendo a Nachitow, Fredi y Tahz de la organización, y confirmando que dejaban el juego hasta ahora, que vuelven por la puerta grande.\r\nSegún ha podido saber este medio, y confirmando distintas fuentes, el FC Barcelona tiene un principio de acuerdo con White Demons, equipo español formado el 1 de noviembre de 2020 y que, desde entonces, ha logrado 25.000€ en ganancias.\r\nWhite Demons ha sido una de las grandes revelaciones de la RLCS X desde el split de invierno, consiguiendo un top  4 en el primer regional de primavera, así como lograr ganar torneos de menor categoría como la Elemental Series 2 o las finales de The Field.\r\nAdemás, White Demons logró meterse entre los 10 mejores equipos del split de primavera accediendo al Major, y aunque cayeron en grupos, confirmaron que la siguiente temporada tienen mucho que decir.\r\ncrr es una de las joyas europeas, considerado uno de los mejores bubble player del momento con una ambición admirable. Dorito es el compañero perfecto de crr, con una proyección abismal y un juego coral envidiable. \r\n\r\nJunto a ellos está Tigreee, el jugador más experimentado y que entró para sustituir a Ghostfire en el roster; con el cambio, White Demons mejoró mucho y consiguió colarse en el top 8 de Europa. Braan., por su parte, ha demostrado dotes de mánager y coach para hacer un equipo del que ya se habla en todo el continente.', '13', '2020-10-25');
INSERT INTO `noticias` VALUES ('15', 'Steam Deck vs. PS5: comparación gráfica y de procesamiento de las consolas', 'Steam Deck tomó por sorpresa a todos los gamers. Pocos se imaginaban que a mitad de 2021, Nintendo presentará una versión nueva de la Nintendo Switch con pantalla OLED; mientras que Valve trabaja en un aparato portátil que cuenta con muchas similitudes con la Switch en tanto hardware: Steam Deck.', 'Esta última es una consola de más de 700 gramos que tiene en su interior un pequeño ordenador. El objetivo de Valve es que puedas correr la gran mayoría de títulos de Steam sin comprometer la duración de batería ni el rendimiento gráfico.\r\n\r\nEn los primeros análisis del medio IGN vemos que también contará con un dock para conectarlo a monitores, pero que se venderá por separado. Además de correr con el sistema operativo Steam OS, también se podrá instalar Windows.\r\n\r\n\r\nComo es de esperarse, se ha realizado una comparación con la nueva generación de consolas (PS5 y Xbox Series X). Algunos especialistas estiman que la consola portátil tendrá una GPU tan rápida como la PS4 original.\r\n\r\nAl estar limitada la resolución de 1280x800p, el GPU podrá correr casi cualquier juego. No obstante, el procesador (CPU) sería solo la mitad de potente que una Xbox Series X o una PS5.\r\n\r\nEn cuanto a memoria RAM, cuenta con 16GB al igual que la PS5, cuatro veces más que Nintendo Switch.', '14', '2020-10-27');
INSERT INTO `noticias` VALUES ('16', 'Las cuentas gratuitas de CS:GO no podrán jugar más clasificatorias', 'La última actualización de CS:GO es, posiblemente, de las más importantes de los últimos tiempos. Valve va a quitar la posibilidad de jugar clasificatorias a las cuentas gratuitas y les obligarán a pagar para ello.', 'Hace un tiempo, CS:GO tomó un rumbo que para muchos jugadores veteranos del shooter más popular de la historia era erróneo, y el tiempo parece que ha dado la razón a estas opiniones.\r\n\r\nValve hizo gratuito su juego, y con tiempo de juego podías disfrutar de las clasificatorias de CS:GO, algo que provocó que se llenara de hackers, gente tóxica y personas que no le importaba ganar o perder.\r\nSin embargo, a partir de ya, todas las cuentas gratuitas de CS:GO no podrán competir en clasificatorias y tendrán que actualizar su estado a prime para poder hacerlo.\r\nEs decir, que todos los nuevos jugadores de CS:GO podrán disfrutar del juego como todo el mundo, pero sin la posibilidad de subir de nivel o jugar competitivas contra otros jugadores del mismo nivel de habilidad.\r\n\r\nEl objetivo de Valve es acabar con los hackers en las partidas y garantizar que, si juegas clasificatorias, has pagado por el juego, y si usas cualquier tipo de hack o exploit te expones a una suspensión permanente.\r\nEso sí, los jugadores prime que ya habían subido al mínimo de nivel necesario se supone que podrán jugar clasificatorias aun así, por lo que se aplicará a cuentas nuevas a partir de ahora.', '13', '2020-11-02');
INSERT INTO `noticias` VALUES ('17', 'The International 10 cambia de sede: Suecia no considera deporte a los esports', 'como consecuencia de algunas restricciones sanitarias impuestas por el gobierno de Suecia, a raíz de la pandemia por COVID-19 y algunos rebrotes, The International 10, el Mundial de Dota 2, que reparte 40 millones de dólares en premios, no podrá realizarse en ese país como estaba estipulado, primero en 2020 y ahora en 2021.', 'Mediante un extenso comunicado, Valve, desarrolladora del MOBA, indicó que la única posibilidad que tenía para llevar adelante el Mundial era que la Federación Sueca de Deportes reconociera a los deportes electrónicos como deporte y así contar con el permiso que sí tienen actividades de elite como el fútbol, por ejemplo.\r\n\r\nEsto no sólo se traduce en la imposibilidad de llevar a delante un evento presencial con público, sino también en las negativas que recibirían algunos jugadores que no forman parte de la Unión Europea a la hora de pedir una visa para ingresar al país. De esta manera, The International deberá buscar nueva sede. ¿Se suspenderá?\r\nComenzamos a trabajar con Suecia en 2019 para poner todo en marcha para mantener el TI10 allí en 2020. Cuando la pandemia global requirió un aplazamiento, duplicamos nuestros esfuerzos para trabajar en conjunto con los funcionarios de allí para asegurarnos de que les proporcionáramos todo lo que necesitaban para que se haga de este un evento seguro y exitoso para todos.\r\n\r\nEn el transcurso del año pasado, Stockholm Live y Visit Stockholm continuaron asegurándonos en nuestras comunicaciones regulares y constantes que The International - Dota 2 Championships calificaba para las mismas exenciones que otros eventos deportivos de élite recibieron allí. Sin embargo, a pesar de las garantías anteriores, nos informaron hace dos semanas que la Federación Sueca de Deportes acababa de votar para no aceptar los deportes electrónicos en la federación deportiva.\r\n\r\nEn reuniones posteriores (e inmediatas) con la Federación Sueca de Esports (SESF) y Visit Stockholm, descubrimos que nuestra única opción restante era pedirle al Ministro del Interior de Suecia que reclasificara The International - Dota 2 Championships como un evento deportivo de élite. Nuestra solicitud fue denegada de inmediato.\r\n\r\nDado que el Ministro del Interior no reconoció The International - Dota 2 Championships como un evento deportivo de élite, se le negaría a cualquiera que intente obtener una visa para viajar a Suecia para TI10 (incluidos jugadores, talentos y personal). La ausencia de este reconocimiento oficial también significa que los agentes fronterizos individuales tomarían decisiones sobre la entrada para aquellos que viajen al evento desde países fuera de la UE que normalmente no necesitan una visa para ingresar a Suecia.\r\nPresentamos una apelación directamente ante el gobierno sueco el 9 de junio, pero no pudieron brindar asistencia. El 14 de junio seguimos pidiéndoles que reconsideraran y hasta ahora no han podido ofrecer una resolución. Como resultado, y a la luz de la situación política actual en Suecia, hemos comenzado a buscar posibles alternativas en otros lugares de Europa para albergar el evento este año, en caso de que el gobierno sueco no pueda acomodar el Campeonato Internacional - Dota 2 como estaba planeado. Confiamos en que, en cualquier caso, tendremos una solución que nos permita realizar el TI10 en Europa este año y que podremos anunciar un plan actualizado en un futuro muy próximo.\r\n\r\nSeguimos comprometidos con albergar a The International este año de una manera que sea segura para todos los involucrados y que celebre adecuadamente a los jugadores y fanáticos de Dota 2. Comunicaremos lo que averigüemos tan pronto como podamos. Mientras tanto, los clasificatorios de TI todavía se llevarán a cabo en las fechas programadas originalmente a partir del 23 de junio. Y más adelante esta semana, llegará el nuevo evento de verano Nemestice.\r\n\r\nEste fue el comunicado con el que Valve intentó calmar las aguas pues confirmó que harán todo lo necesario para que el mundial de Dota 2 se lleva a cabo este año en Suecia. Por el momento, esta es toda la información que se tiene al respecto sobre este importante evento.', '14', '2020-11-09');
INSERT INTO `noticias` VALUES ('18', 'Uno de los grandes de Europa en LEC se quedará fuera de Worlds 2021', 'La LEC no llevará 4 representantes al mundial de 2021 de LoL como pasó en Worlds 2020 al perder la plaza que otorgaba el MSI, por lo que uno de los grandes se quedará fuera de esta cita.', 'La temporada 2020 fue histórica para Europa, y no solo por la trayectoria que llevaban los equipos de LEC (dos finales del mundo consecutivas y un MSI ganado) sino por la representación de la región en Worlds.\r\n\r\nLos mundiales del año pasado fueron los únicos en la historia en los que Europa llevó 4 representantes de la LEC: G2 Esports, Fnatic, Rogue y MAD Lions, aunque solo 3 disputaron la fase de grupos tras la debacle de los leones.\r\nSin embargo, tras la derrota de MAD Lions en el MSI frente a DAMWON KIA en semifinales (2-3), Europa ha perdido la 4ª plaza que se otorgaba en este campeonato, volviendo a la normalidad de llevar 3 representantes de la región.\r\n\r\nDe hecho, serán China y Corea del Sur (LPL y LCK) los que llevarán 4 representantes al ser consideradas las ligas punteras del mundo, por lo que será todavía más difícil traer la Copa del Invocador a nuestra región.\r\nSin embargo, todo puede ocurrir todavía, porque el split de Fnatic y Misfits en verano está siendo muy bueno y podrían ser la gran sorpresa en playoffs si acaban entrando, pero uno se quedará fuera de Worlds.\r\n\r\nEs decir, que puede ser que G2 Esports, Rogue, MAD Lions o Fnatic no acudan a Worlds 2021 si no se dan sus resultados, y que incluso dos de ellos se queden fuera si Misfits da la campanada al final.\r\nTodavía queda mucha LEC por delante y en los próximos meses conoceremos a los equipos que irán al mundial, pero será interesante comprobar cual de los \'grandes\' no va a la cita más importante del mundo de LoL.', '14', '2020-10-27');
INSERT INTO `noticias` VALUES ('19', 'Ubisoft, denunciada de nuevo por \"acoso institucional\" ante la corte francesa', 'El sindicato Solidaires Informatique y antiguos miembros de la compañía gala han presentado una nueva denuncia por los casos de abusos y acoso sexual.', 'El retraso de algunos de sus próximos lanzamientos como Riders Republic o el spin off Rainbow Six Extraction parece ser el menor de los problemas para Ubisoft. Ya el anuncio de Assassin\'s Creed Infinity desveló problemas a nivel interno en la compañía gala debido a las acusaciones por acoso y abuso, un fantasma que parece no abandonar a la empresa que comanda Yves Guillemot. Así, hemos podido saber que Ubisoft y el propio Guillemot han sido denunciados ante la Corte Francesa por \"acoso institucional\", y es que según una encuesta publicada hace unos meses, 1 de cada 4 empleados de Ubisoft ha sufrido o sido testigo de algún tipo de abuso.\r\nEsta denuncia fue presentada el día de ayer en la corte criminal de Bobigny, asistiendo miembros del sindicato francés Solidaires Informatique y dos antiguos empleados de Ubisoft. \"La denuncia apunta a Ubisoft como entidad legal por acoso institucional, por mantener y reforzar un sistema donde el acoso sexual se tolera, ya que es más rentable para la empresa mantener a acosadores que proteger a sus empleados\", escribieron en Twitter desde el sindicato.\r\nLa denuncia apunta también directamente a algunos nombres propios de algunos ex directivos de Ubisoft, pero también de otros que aún forman parte de la plantilla de la compañía, tales como el director creativo Serge Hascoet o el Vicepresidente Tommy François, quienes renunciaron a su puesto durante el verano de 2020.\r\n\r\n\"Cualquier empleado que haya alegado sufrir o ser testigo de esto y continúa en Ubisoft ha visto como su caso ha sido rigurosamente revisado por una tercera compañía, habiéndose tomado las acciones pertinentes\", se dijo hace unos días desde Ubisoft en el medio Bloomberg. \"Empleados que hayan sido investigados no permanecerán en Ubisoft si los resultados son esclarecedores\".\r\n\r\nDe esta forma, aunque hace ya mucho tiempo que Yves Guillemot anunciara que se venían cambios profundos a nivel interno tras estas acusaciones, parece ser que los problemas en este sentido están lejos de terminar.', '13', '2020-11-08');
INSERT INTO `noticias` VALUES ('21', 'Call of Duty: Mobile - Diversión explosiva en la palma de la mano', 'Hace poco, Red Bull Gaming tuvo la oportunidad de entrevistar al equipo de Call of Duty: Mobile sobre la diferencia entre su versión, Call of Duty Honey I Shrunk the Conflict™, de sus hermanos mayores', 'Jugadores incondicionales. Es decir, la fraternidad de jugadores que confraterniza íntimamente con las plataformas de sobremesa y consola tiende a tener la abeja detrás de la oreja cuando se trata de juegos móviles. A menudo con razón. Especialmente cuando se percibe que un lanzamiento para dispositivos móviles no es más que el aprovechamiento de un concepto de éxito comercializado para un público más amplio que realmente no tiene la misma inversión en su preciada IP. Los jugadores acérrimos se muestran extraños ante este tipo de cosas: la propiedad de una marca.\r\nPero a veces todo sale bien.\r\nEl mundo de la estrategia ha tenido una buena cantidad de éxitos con juegos como Civilization y, más recientemente, Frostpunk. Y todos sabemos que ese pequeño título de Hearthstone es más que una excepción a la regla. Aunque nos consideramos igual que los jugadores más incondicionales de los que hablamos aquí, no nos gusta juzgar cuando se trata del nombre más importante en los juegos, Call of Duty, que tiene una versión para móviles. Estamos contentos porque no nos hemos dejado llevar por la arrogancia.\r\nHace poco tuvimos la oportunidad de charlar con el equipo que está detrás de la versión móvil del juego. Mira lo que tienen que decir a continuación.\r\nRed Bull: El nombre \"Call of Duty\" conlleva una gran responsabilidad y mucha gente duda en jugar a un título triple A en un dispositivo móvil por miedo a una experiencia inferior, ¿puedes decirnos si CoD Mobile, además de jugable, es también desafiante y divertido?\r\nEquipo de Call of Duty: Mobile: Lo que hace que Call of Duty: Mobile sea único es que reúne los mapas que más gustan, los modos competitivos, los personajes conocidos y las armas emblemáticas de esta histórica franquicia, incluyendo Black Ops y Modern Warfare, a la vez que ofrece nuevos contenidos y experiencias para que los fans los exploren.\r\nEn su esencia, Call of Duty: Mobile es tan visceral y lleno de acción como se espera de una experiencia de Call of Duty, pero hemos hecho importantes personalizaciones a algunos de los sistemas favoritos de los fans desde la experiencia de consola/PC para que sea más adaptable a la forma en que los jugadores de móviles prefieren jugar. Cuando los jugadores tienen el juego en sus manos por primera vez, se sorprenden de que sea un juego de Call of Duty de principio a fin, pero adaptado a los dispositivos móviles.\r\nRed Bull: Al decir esto, ¿cómo ha cambiado la plataforma móvil la dirección del diseño de un juego que se considera que sigue unos ritmos de juego y unas características bastante importantes? ¿Ha habido algo en el desarrollo de la serie para móviles (fuera de la movilidad) que destaque como revelación frente a las versiones de PC y consola?\r\nEquipo de Call of Duty: Mobile: Aparte de la movilidad y los cambios en el factor de forma, la frecuencia y la composición de las temporadas es diferente entre plataformas. Para el equipo de Call of Duty: Mobile, las temporadas son un marco clave en la forma de empaquetar y entregar nuevos mapas, modos, cosméticos y nuevos elementos funcionales. La mayoría de los juegos de consola y PC tienen temporadas de entre 2 y 4 meses, y eso funciona muy bien para su público.\r\n\r\nEn los móviles, hemos descubierto que los jugadores prefieren temporadas más cortas y temáticas. Por ejemplo, con el lanzamiento de la cuarta temporada en mayo, el contenido no solo estaba repleto de nuestro evento 80s Action Heroes, sino que la temporada también tiene una estética del Salvaje Oeste. Tenemos un evento llamado \"High Noon Chase\" que permite a los jugadores formar un pelotón para perseguir una diligencia llena de ladrones de bancos para desbloquear nodos, ganar XP y recompensas temáticas por el camino.\r\nEste evento ya está disponible desde el 12 de junio y te da una idea de cómo estamos enfocando nuestro contenido para los fans. Es diferente de lo que se puede hacer en un juego de consola/PC, donde la historia es un poco más ágil. Hemos trabajado mucho en la planificación de un itinerario a lo largo del año que creemos que va a gustar a los jugadores. Pronto veréis algunos ejemplos de nuevas y mayores ideas en torno a nuestro contenido estacional.', '14', '2020-10-25');
INSERT INTO `noticias` VALUES ('22', 'La cadena de Markito: los streamers se unieron contra el coronavirus', 'En un directo de Twitch que fue retransmitido por otros streamers, Markito Navaja alentó la campaña de vacunación y el cuidado contra el coronavirus.', 'Consciente de la importancia y la repercusión que tienen los streamers hoy en día, el Gobierno Nacional se unió a algunos de los creadores de contenido más reconocidos del país para brindar un mensaje conjunto para alentar la campaña de vacunación y los cuidados contra el COVID. Markito Navaja protagonizó \"La cadena de Markito\" en Twitch, a la que se sumaron otros streamers como Facu Banzas, Aylu Lopez, Sofi Carmona, Momo y Pedro Pérez Disalvo.\r\n\r\nEn las últimas horas, el popular streamer Markito Navaja había anticipado en sus redes sociales que este viernes a las 18 iba a prender la transmisión de Twitch para realizar un anuncio muy importante y que lo haría representando a toda la comunidad de Twitch Argentina. Otros creadores de contenido argentinos se sumaron al mensaje de \"La cadena de Markito\" y también retransmitieron el mismo desde sus propias cuentas.\r\nEl directo de Markito comenzó tal como si fuera una cadena nacional, con el himno e imágenes de todo el país. A pesar de la formalidad del fondo y su vestimenta, el streamer aseguró que se trataba de un \"stream como los de siempre\", aunque algo más corto ya que duró un poco más de 20 minutos. Aunque se lo veía un poco nervioso, Markito se mostró muy seguro en su mensaje enfocado en alentar la campaña de vacunación contra el COVID encabezada por el Gobierno Nacional.\r\n\r\nMientras otros importantes creadores de contenido como Facu Banzas, Aylu Lopez y Momo retransmitían el mensaje de Markito, el streamer le habló directamente a su público para generar consciencia en los cuidados que hay que tener frente a la pandemia. Además, les pidió que se vacunaran y que ayuden a la gente mayor a inscribirse en la campaña de vacunación, con el objetivo de que una importante baja en los contagios del coronavirus permita volver a la \"normalidad\".\r\nTal como aseguró Markito en diversos momentos de la transmisión, la misma fue un hecho histórico tanto para él como para toda la comunidad de streamers argentinos. \"Lo del stream de hoy me llena de orgullo y aunque me van a ver a mi solo, quiero que sepan que estoy representado a la comunidad, a todos los streamers argentinos del mas grande al mas chico, estamos logrando cosas increíbles\", compartió en Twitter unas horas antes de que iniciara la transmisión en Twitch.\r\n\r\n\"El mensaje es claro amigos, seguir cuidándonos, anotándonos para las vacunas y ayudando a los más grandes para que se anoten y vacunen, estoy orgulloso de que nos hayan elegido para esto\", escribió Markito en Twitter solo unos minutos después de apagar el directo. De esta forma, la comunidad de Twitch Argentina se sumó al pedido de cuidado y concientización frente al coronavirus.', '13', '2020-11-12');
INSERT INTO `noticias` VALUES ('23', 'Cómo comerciar en Roblox: guía para hacer intercambios con otros jugadores', 'Te damos todos los requisitos necesarios y todos los pasos requeridos para que puedas hacer intercambios comerciales en Roblox.', 'Roblox es una de las licencias más populares en el mundo del videojuego, y si bien está dirigida más al público joven, lo cierto es que está empezando a mover una considerable cantidad de dinero, y si quieres introducirte a este mundo que ahora mismo es mucho más popular, deberías conocer su sistema de comercio.\r\nSi bien Roblox es un mundo enorme, lo cierto es que quizás no sea del todo claro a la hora de explicar ciertos aspectos como el de comerciar con otros jugadores, una característica que no es gratuita, pero que podrías sacar gran provecho si sabes utilizarla al máximo.\r\n\r\nVamos a darte todos los pasos para que puedas desbloquear la característica del intercambio o el comercio en Roblox, e igualmente todos los pasos para enviar una oferta a otro jugador e incluso aceptar o rechazar alguna que hayas recibido.\r\nLo primero de todo, para poder tener desbloqueada la característica del intercambio comercial en Roblox debes contar con una cuenta de pago, y van desde los 4,99 € al mes a los 20,99 € al mes. Al suscribirte a Roblox Premium, recibirás un estipendio mensual de Robux y un bonus del 10 % en la compra de esta moneda.\r\nUna vez que seas miembro de Roblox premium, debes habilitar esta característica del comercio. Para activarla debes irte a la página de inicio de la configuración de tu cuenta de Roblox, y seleccionar el botón de “configuración” que está situado en la esquina superior derecha de la interfaz.\r\n\r\nUna vez que lo pulses, debes irte a privacidad, y una vez dentro localizar una opción que nos va a permitir elegir con quien comerciar, haciéndose a través de un menú desplegable.\r\nPodrás saber el estado de esta transacción simplemente accediendo a la página de intercambio de tu cuenta de Roblox, y en concreto yendo al menú desplegable donde te aparecerán todas las que están pendientes, tanto las entrantes como las salientes.\r\n\r\nSi pulsas sobre cada una de estas ofertas pendientes, podrás aceptarlas, rechazarla o incluso realizar una contraoferta.\r\n\r\nComo ves, ahora explicado parece mucho más sencillo comerciar en Roblox.', '14', '2020-10-28');
INSERT INTO `noticias` VALUES ('24', 'Análisis F1 2021, el juego más completo para disfrutar del Gran Circo', 'Crítica de F1 2021, el famoso juego de conducción que llega con cambios jugables evidentes y más modos de juego para darnos la experiencia más completa posible.', 'La Fórmula 1 nos está dejando con una de las temporadas más interesantes de los últimos años en la que Red Bull está compitiendo de tú a tú con Mercedes y en la que la zona media de la parrilla está apretada, muy apretada, con equipos como Ferrari, McLaren o Alpine disputándose los puntos en cada carrera y con Fernando Alonso y Carlos Sainz, pilotos de España, ofreciéndonos un gran espectáculo en muchos Grandes Premios.\r\nAhora a la gran expectación que ha provocado la competición durante este año hay que sumarle el lanzamiento de F1 2021, el juego a caballo entre el arcade y la simulación de Codemasters y EA Sports que ya hemos podido probar para traeros su análisis y contaros lo que nos ha parecido, las mejoras más evidentes en jugabilidad con respecto a la entrega del 2020 y, por supuesto, los nuevos modos de juego que tienen a Braking Point como principal novedad de esta entrega.\r\nVamos a comenzar este análisis escribiendo, precisamente, sobre Braking Point, un nuevo modo historia del que ya os hemos hablado con anterioridad que está protagonizado por Aiden Jackson, un prometedor piloto del que tomamos el control desde su última carrera en la F2 hasta sus dos primeras temporadas en la Fórmula 1 en las que comprobará de primera mano la dureza del Gran Circo.\r\nTal y como os contamos en nuestras impresiones, este modo nos permite disfrutar de carreras un tanto diferentes con distintos objetivos que van desde quedar en los puntos hasta superar a nuestro compañero de equipo pasando por adelantar a los coches de la escudería rival, renunciando a los entrenamientos o a la clasificación para centrarse en el punto álgido de los Grandes Premios disputando a veces carreras completas y en otras ocasiones comenzando el GP a partir de una determinada vuelta.\r\nLa experiencia con Braking Point en líneas generales ha sido bastante positiva y da algo de frescura a F1 2021 con un modo historia interesante como punto de partida para mejorarlo durante los próximos años en los que esperamos que haya una mayor profundidad ofreciendo más objetivos diferentes, dando peso a la decisión del piloto en el desarrollo del coche y ofreciendo una historia más atractiva que la de este debut. Como decimos las sensaciones son buenas y hemos disfrutado durante toda la campaña de unas 6 u 8 horas de duración, pero se nota que es un modo que acaba de aterrizar y que llega como base para hacerlo crecer en próximas entregas.\r\nLos otros dos modos estrella para un jugador son Mi Equipo y Piloto, que llegan también con algunos cambios interesantes que van a agradar a los jugadores de la saga. Los más evidentes son un nuevo sistema de I+D más completo e intuitivo para mejorar las piezas de nuestro monoplaza a lo largo de la temporada, así como una nueva forma de afrontar los entrenamientos libres para hacerlos menos pesados y más \"disfrutables\" para los jugadores. De hecho, incluso podemos hacer frente a los libres de forma automática, ganando menos puntos de desarrollo que si los realizamos de forma manual.\r\nMás allá de esto sin duda el mayor atractivo que encontramos es la posibilidad de jugar a la Carrera en modo \"dobles\" a través de internet, pudiendo disfrutar con un amigo de este modo a través de internet de una forma única, siendo parte de la misma escudería para trabajar juntos de cara al mundial de constructores o competir como rivales intentando quedar más arriba que el otro en la clasificación de pilotos.\r\nPasemos ahora a hablar del modo multijugador en el que no vemos demasiados cambios pudiendo disputar carreras rápidas informales (con modos para principiantes y expertos), clasificatorias, ligas, eventos semanales y grandes premios personalizados, así como torneos de esports que tienen su propio apartado dentro del juego. Además, como años anteriores contaremos con un sistema de rango y progresiones y un \"pase de temporada\" para obtener diferentes objetos cosméticos.\r\nCon el rendimiento del modo online estamos muy satisfechos, con pocos tiempos de espera en PC y sin encontrarnos con lagazos o ralentizaciones, pudiendo disfrutar de una experiencia similar de conducción a la que tenemos en solitario. El principal problema, sobre todo hasta que obtenemos rango, será la de esquivar a los jugadores más noveles o con una conducción más temeraria.\r\nYa en la pista vemos algunos cambios evidentes en la jugabilidad sobre todo en lo que a las físicas del coche se refiere, haciendo hincapié en la frenada más realista que en la edición anterior y en el comportamiento del coche cuando vamos a gran velocidad, siendo más difícil que en otras ediciones ser precisos en las curvas si vamos pasados de velocidad o si no cogemos una buena trazada.\r\n\r\nQuizás lo más obvio mientras jugamos lo encontramos en los pianos, que desestabilizan mucho más el coche que en años anteriores castigando a aquellos jugadores que los usan en exceso o que se \"comen\" parte de la curva utilizándolos, encontrando un ejemplo evidente la chicane del Circuit de Barcelona-Catalunya que antes se podía recortar de forma evidente pisando incluso el reborde amarillo sin perder tiempo y que ahora \"escupe\" a nuestro monoplaza perdiendo el control de forma evidente. Otro ejemplo gráfico lo podéis ver en el pequeño vídeo que os dejamos aquí abajo en el que perdemos el control del F1 tras pisar uno de los pianos de Spa-Francorchamps:\r\nLa IA también ha mejorado, sobre todo a la hora de cerrar bien la puerta en los adelantamientos, con algunos pilotos como Carlos Sainz siendo muy difíciles de superar en carrera. Además, nuestros rivales nos presionan mejor cuando nos tienen que adelantar castigando cualquier fallo o curva mal tomada para superarnos si están lo suficientemente cerca. Aun así, en ocasiones notamos como los pilotos en posiciones intermedias a veces van más lentos justo hasta que los superamos, momento en el que empiezan a apretar, o al menos eso es lo que hemos notado con la Dificultad 72 con la que hemos \"competido\" en los distintos modos de juego.', '13', '2020-11-14');

-- ----------------------------
-- Table structure for paises
-- ----------------------------
DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `id_pais` int(3) NOT NULL AUTO_INCREMENT,
  `pais` varchar(30) NOT NULL,
  PRIMARY KEY (`id_pais`) USING BTREE,
  UNIQUE KEY `unicidad_id_pais` (`id_pais`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of paises
-- ----------------------------
INSERT INTO `paises` VALUES ('14', 'Argentina');
INSERT INTO `paises` VALUES ('15', 'Bolivia');
INSERT INTO `paises` VALUES ('16', 'Paraguay');
INSERT INTO `paises` VALUES ('17', 'Uruguay');
INSERT INTO `paises` VALUES ('18', 'Brasil');
INSERT INTO `paises` VALUES ('19', 'Chile');
INSERT INTO `paises` VALUES ('20', 'Colombia');
INSERT INTO `paises` VALUES ('21', 'Ecuador');
INSERT INTO `paises` VALUES ('22', 'Puerto Rico');
INSERT INTO `paises` VALUES ('23', 'Venezuela');

-- ----------------------------
-- Table structure for rubros
-- ----------------------------
DROP TABLE IF EXISTS `rubros`;
CREATE TABLE `rubros` (
  `id_rubro` int(3) NOT NULL AUTO_INCREMENT,
  `rubro` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rubro`) USING BTREE,
  UNIQUE KEY `unicidad_id_rubro` (`id_rubro`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rubros
-- ----------------------------
INSERT INTO `rubros` VALUES ('11', 'Esports');
INSERT INTO `rubros` VALUES ('12', 'Consolas');
INSERT INTO `rubros` VALUES ('13', 'CS:GO');
INSERT INTO `rubros` VALUES ('14', 'Dota 2');
INSERT INTO `rubros` VALUES ('15', 'League of Legends');
INSERT INTO `rubros` VALUES ('16', 'Desarrolladoras');
INSERT INTO `rubros` VALUES ('17', 'Mobile');
INSERT INTO `rubros` VALUES ('18', 'Streamers');
INSERT INTO `rubros` VALUES ('19', 'Guías');
INSERT INTO `rubros` VALUES ('20', 'Reviews');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(20) NOT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `clave` varchar(10) NOT NULL,
  `descripcion_usuario` text DEFAULT NULL,
  `id_nivel` int(2) NOT NULL,
  `id_pais` int(3) NOT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  UNIQUE KEY `unicidad_id_usuario` (`id_usuario`) USING BTREE,
  UNIQUE KEY `unicidad_email` (`email`) USING BTREE,
  KEY `pertenecen` (`id_nivel`) USING BTREE,
  KEY `residen` (`id_pais`) USING BTREE,
  CONSTRAINT `pertenecen` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id_nivel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `residen` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('13', 'Juan', 'Pablo', 'Soro', 'Lovece', 'sorojuanpablo@gmail.com', 'juampitito', 'Soy diseñador gráfico egresado de la UBA, mi orientación como diseñador es principalmente en diseño impreso y packaging aunque tengo experiencia en otras áreas del diseño. Cuento con\nexperiencia en el manejo de equipos creativos, y tengo disposición a aprender nuevas técnicas y tendencias en el área del diseño.', '1', '14');
INSERT INTO `usuarios` VALUES ('14', 'Gonzalo', 'Nahuel', 'Rodriguez', null, 'gonzalito@gmail.com', 'gonsalito', 'Licenciado en diseño gráfico y comunicación visual, especializado en diseño digital e interactivo. Maquetador Front End, con amplios conocimientos y experiencia en HTML, CSS y Javascript.', '1', '14');
INSERT INTO `usuarios` VALUES ('15', 'Tatiana', null, 'Messi', null, 'messi@tati.com', 'tatibts', 'Trabajo en tareas como futura diseñadora gráfica hace 4 años. Me entusiasma desarrollarme en los procesos desde el marketing digital, branding, hasta la producción de una editorial, donde la imaginación es mi herramienta principal; Que profesionales me ayuden a formarme con su experiencia y conocimiento. Mi espíritu positivo y mi disciplina me permitirán lograr mis metas y alcanzar mi objetivo especifico.', '2', '15');
INSERT INTO `usuarios` VALUES ('16', 'Jorge', null, 'Selen', null, 'jorgitoselen@gmail.com', 'selenj', 'Desde mi infancia hasta hoy día he encontrado que mi mejor forma de expresión es gráficamente. Creo que hoy día el diseño gráfico es la conexión ideal entre una idea y una manifestación artística, y que cumple un rol escencial en esta cultura de lo inmediato donde si un mensaje quiere ser escuchado debe ser representado con un estilo particular y con una impronta personal de gran pregnancia. Como estudiante de diseño gráfico y como persona de muchos intereses, busco día a día estimular mi creatividad y mejorar mis herramientas con las cuales pueda plasmar mis ideales.', '2', '17');
INSERT INTO `usuarios` VALUES ('17', 'Mariana', null, 'Introzzi', null, 'Introzzi@gmail.com', 'intmarian', 'Tengo conocimientos en Artes Visuales, distintos programas de diseño, gran dominio del ingles y experiencia en ventas y atención al público.', '2', '18');
INSERT INTO `usuarios` VALUES ('18', 'Laura', 'Carmen', 'Vegani', null, 'carmensita@gmail.com', 'lAURA', 'Soy un profesional en Marketing con énfasis en marketing digital, tengo una experiencia aproximada de 12 años como Ejecutivo Comercial y la complemento con mi gusto por el conocimiento de nuevas tendencias y tengo un gusto especial por constante aprendizaje.', '2', '19');
INSERT INTO `usuarios` VALUES ('19', 'Pablo', 'Hugo', 'Soro', null, 'sorinhoPa@gmail.com', 'pshoro', 'Me defino como una persona proactiva. Me gustan los desafíos y busco el crecimiento constante. Valoro mucho las relaciones interpersonales y el buen ambiente laboral. Siempre busco poder dar lo mejor de mí y contribuir al crecimiento de la compañía en la que trabajo a base de esfuerzo diario.', '2', '14');
INSERT INTO `usuarios` VALUES ('22', 'Marian', 'Abril', 'Picto', 'Gutierrez', 'guti@gmail.com', 'gutijaja', 'Soy una apasionada de las nuevas tecnologías, la fotografía y el cambio de mentalidad para alcanzar tus metas.', '2', '15');
INSERT INTO `usuarios` VALUES ('23', 'Carmen', 'Ines', 'Bogliolo', 'Fontaina', 'fontaina@gmail.com', 'fontanet', 'Actualmente resido en Argentina, Buenos Aires donde Trabajo de Community Manager de la marca de Radios con mas historia en el país, Spica.', '2', '20');
INSERT INTO `usuarios` VALUES ('24', 'Lucia', null, 'Rodriguez', null, 'rolucia@gmail.com', 'arrozlu', 'Soy extrovertida y creativa. Abierta a nuevas propuestas y conocimientos.', '2', '14');
INSERT INTO `usuarios` VALUES ('25', 'Dan', null, 'Casoy', null, 'danca@gmail.com', 'dancaS', 'Tengo experiencia coordinando y dirigiendo equipos de trabajo de varias personas y supervisando fotógrafos, ilustradores, programadores, retocadores y creativos digitales.', '2', '22');
INSERT INTO `usuarios` VALUES ('27', 'Juan', '', 'Sito', '', 'juansitodios@gmail.com', '123', 'Soy un genio de la programación. En especial PHP.', '2', '14');
INSERT INTO `usuarios` VALUES ('30', 'Tatiana', 'Abril', 'Merlo', '', 'avissestareloco@gmail.com', 'tucup', 'Soy una chica gamer que le interesa la programacion.', '2', '17');
INSERT INTO `usuarios` VALUES ('31', 'Roberta', '', 'Lonca', '', 'roberlonca@gmail.com', '123', 'Soy aficionada del diseño desde que soy pequeña.', '2', '16');
INSERT INTO `usuarios` VALUES ('32', 'Gonzalo', '', 'Lobaisa', '', 'trascopier@ra.com', '123', 'Diseñador buscando inspiración.', '2', '18');
INSERT INTO `usuarios` VALUES ('33', 'Omar', '', 'Toyos', '', 'omar.toyos@gmail.com', '123', 'Soy un diseñador de primera clase.', '2', '14');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id_video` int(50) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` tinytext DEFAULT NULL,
  `id_trabajo` int(10) NOT NULL,
  `id_formato` int(3) NOT NULL,
  PRIMARY KEY (`id_video`) USING BTREE,
  UNIQUE KEY `unicidad_id_video` (`id_video`) USING BTREE,
  KEY `contienen2` (`id_trabajo`) USING BTREE,
  KEY `tienen2` (`id_formato`) USING BTREE,
  CONSTRAINT `contienen2` FOREIGN KEY (`id_trabajo`) REFERENCES `noticias` (`id_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tienen2` FOREIGN KEY (`id_formato`) REFERENCES `formatos` (`id_formato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('11', 'cs.mp4', 'Trailer de cs', '16', '3');
INSERT INTO `videos` VALUES ('12', 'steam-deck.mp4', 'Review de la steam deck', '15', '3');
INSERT INTO `videos` VALUES ('13', 'ubisof.mp4', 'Video ubisof E3', '19', '3');
INSERT INTO `videos` VALUES ('14', 'lolsito.mp4', 'Trailer LOL', '18', '3');
INSERT INTO `videos` VALUES ('15', 'cadena-markito.mp4', 'Cadena de markito', '22', '3');
INSERT INTO `videos` VALUES ('16', 'cod.mp4', 'Gameplay cod', '21', '3');
INSERT INTO `videos` VALUES ('17', 'robux.mp4', 'Roblox guia', '23', '3');
INSERT INTO `videos` VALUES ('18', 'f1.mp4', 'gameplay f1', '24', '3');
INSERT INTO `videos` VALUES ('19', 'dota-international.mp4', 'Trailer de TI10', '17', '3');
INSERT INTO `videos` VALUES ('20', 'barsa.mp4', 'Partida barsa rocket league', '11', '3');
