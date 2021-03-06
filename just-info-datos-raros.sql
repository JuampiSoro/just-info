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
INSERT INTO `noticias` VALUES ('11', 'El FC Barcelona volver?? a Rocket League fichando a White Demons', 'El conjunto azulgrana volver?? a apostar fuerte por Rocket League, uno de sus t??tulos insignia en los esports, firmando a uno de los equipos espa??oles con m??s proyecci??n y que m??s han sorprendido en la ??ltima RLCS X.', 'Aunque parezca que fue hace mucho, un 4 de abril de 2019 se confirm?? una de las mayores noticias para la comunidad espa??ola de Rocket League, y es que el FC Barcelona entraba de lleno en el t??tulo de Psyonix firmando un roster de ensue??o.\r\n\r\nEn aquel entonces, la plantilla formada por Bluey, Deevo y Alpha54 ten??an un gran futuro europeo, y lograron no solo un subcampeonato europeo en la RLCS 7, sino tambi??n ir a los mundiales de esta temporada.\r\n\r\nCon el tiempo, el Bar??a logr?? una ESL Masters espa??ola y seguir aumentando su historial en Rocket League, volviendo a hacer un top 4 europeo en marzo de 2020 con Deevo, Flakes y Ronaky, volvi??ndose a meter en un mundial que nunca se lleg?? a disputar.\r\nSin embargo, el Bar??a abandon?? Rocket League el pasado 19 de abril despidiendo a Nachitow, Fredi y Tahz de la organizaci??n, y confirmando que dejaban el juego hasta ahora, que vuelven por la puerta grande.\r\nSeg??n ha podido saber este medio, y confirmando distintas fuentes, el FC Barcelona tiene un principio de acuerdo con White Demons, equipo espa??ol formado el 1 de noviembre de 2020 y que, desde entonces, ha logrado 25.000??? en ganancias.\r\nWhite Demons ha sido una de las grandes revelaciones de la RLCS X desde el split de invierno, consiguiendo un top  4 en el primer regional de primavera, as?? como lograr ganar torneos de menor categor??a como la Elemental Series 2 o las finales de The Field.\r\nAdem??s, White Demons logr?? meterse entre los 10 mejores equipos del split de primavera accediendo al Major, y aunque cayeron en grupos, confirmaron que la siguiente temporada tienen mucho que decir.\r\ncrr es una de las joyas europeas, considerado uno de los mejores bubble player del momento con una ambici??n admirable. Dorito es el compa??ero perfecto de crr, con una proyecci??n abismal y un juego coral envidiable. \r\n\r\nJunto a ellos est?? Tigreee, el jugador m??s experimentado y que entr?? para sustituir a Ghostfire en el roster; con el cambio, White Demons mejor?? mucho y consigui?? colarse en el top 8 de Europa. Braan., por su parte, ha demostrado dotes de m??nager y coach para hacer un equipo del que ya se habla en todo el continente.', '13', '2020-10-25');
INSERT INTO `noticias` VALUES ('15', 'Steam Deck vs. PS5: comparaci??n gr??fica y de procesamiento de las consolas', 'Steam Deck tom?? por sorpresa a todos los gamers. Pocos se imaginaban que a mitad de 2021, Nintendo presentar?? una versi??n nueva de la Nintendo Switch con pantalla OLED; mientras que Valve trabaja en un aparato port??til que cuenta con muchas similitudes con la Switch en tanto hardware: Steam Deck.', 'Esta ??ltima es una consola de m??s de 700 gramos que tiene en su interior un peque??o ordenador. El objetivo de Valve es que puedas correr la gran mayor??a de t??tulos de Steam sin comprometer la duraci??n de bater??a ni el rendimiento gr??fico.\r\n\r\nEn los primeros an??lisis del medio IGN vemos que tambi??n contar?? con un dock para conectarlo a monitores, pero que se vender?? por separado. Adem??s de correr con el sistema operativo Steam OS, tambi??n se podr?? instalar Windows.\r\n\r\n\r\nComo es de esperarse, se ha realizado una comparaci??n con la nueva generaci??n de consolas (PS5 y Xbox Series X). Algunos especialistas estiman que la consola port??til tendr?? una GPU tan r??pida como la PS4 original.\r\n\r\nAl estar limitada la resoluci??n de 1280x800p, el GPU podr?? correr casi cualquier juego. No obstante, el procesador (CPU) ser??a solo la mitad de potente que una Xbox Series X o una PS5.\r\n\r\nEn cuanto a memoria RAM, cuenta con 16GB al igual que la PS5, cuatro veces m??s que Nintendo Switch.', '14', '2020-10-27');
INSERT INTO `noticias` VALUES ('16', 'Las cuentas gratuitas de CS:GO no podr??n jugar m??s clasificatorias', 'La ??ltima actualizaci??n de CS:GO es, posiblemente, de las m??s importantes de los ??ltimos tiempos. Valve va a quitar la posibilidad de jugar clasificatorias a las cuentas gratuitas y les obligar??n a pagar para ello.', 'Hace un tiempo, CS:GO tom?? un rumbo que para muchos jugadores veteranos del shooter m??s popular de la historia era err??neo, y el tiempo parece que ha dado la raz??n a estas opiniones.\r\n\r\nValve hizo gratuito su juego, y con tiempo de juego pod??as disfrutar de las clasificatorias de CS:GO, algo que provoc?? que se llenara de hackers, gente t??xica y personas que no le importaba ganar o perder.\r\nSin embargo, a partir de ya, todas las cuentas gratuitas de CS:GO no podr??n competir en clasificatorias y tendr??n que actualizar su estado a prime para poder hacerlo.\r\nEs decir, que todos los nuevos jugadores de CS:GO podr??n disfrutar del juego como todo el mundo, pero sin la posibilidad de subir de nivel o jugar competitivas contra otros jugadores del mismo nivel de habilidad.\r\n\r\nEl objetivo de Valve es acabar con los hackers en las partidas y garantizar que, si juegas clasificatorias, has pagado por el juego, y si usas cualquier tipo de hack o exploit te expones a una suspensi??n permanente.\r\nEso s??, los jugadores prime que ya hab??an subido al m??nimo de nivel necesario se supone que podr??n jugar clasificatorias aun as??, por lo que se aplicar?? a cuentas nuevas a partir de ahora.', '13', '2020-11-02');
INSERT INTO `noticias` VALUES ('17', 'The International 10 cambia de sede: Suecia no considera deporte a los esports', 'como consecuencia de algunas restricciones sanitarias impuestas por el gobierno de Suecia, a ra??z de la pandemia por COVID-19 y algunos rebrotes, The International 10, el Mundial de Dota 2, que reparte 40 millones de d??lares en premios, no podr?? realizarse en ese pa??s como estaba estipulado, primero en 2020 y ahora en 2021.', 'Mediante un extenso comunicado, Valve, desarrolladora del MOBA, indic?? que la ??nica posibilidad que ten??a para llevar adelante el Mundial era que la Federaci??n Sueca de Deportes reconociera a los deportes electr??nicos como deporte y as?? contar con el permiso que s?? tienen actividades de elite como el f??tbol, por ejemplo.\r\n\r\nEsto no s??lo se traduce en la imposibilidad de llevar a delante un evento presencial con p??blico, sino tambi??n en las negativas que recibir??an algunos jugadores que no forman parte de la Uni??n Europea a la hora de pedir una visa para ingresar al pa??s. De esta manera, The International deber?? buscar nueva sede. ??Se suspender???\r\nComenzamos a trabajar con Suecia en 2019 para poner todo en marcha para mantener el TI10 all?? en 2020. Cuando la pandemia global requiri?? un aplazamiento, duplicamos nuestros esfuerzos para trabajar en conjunto con los funcionarios de all?? para asegurarnos de que les proporcion??ramos todo lo que necesitaban para que se haga de este un evento seguro y exitoso para todos.\r\n\r\nEn el transcurso del a??o pasado, Stockholm Live y Visit Stockholm continuaron asegur??ndonos en nuestras comunicaciones regulares y constantes que The International - Dota 2 Championships calificaba para las mismas exenciones que otros eventos deportivos de ??lite recibieron all??. Sin embargo, a pesar de las garant??as anteriores, nos informaron hace dos semanas que la Federaci??n Sueca de Deportes acababa de votar para no aceptar los deportes electr??nicos en la federaci??n deportiva.\r\n\r\nEn reuniones posteriores (e inmediatas) con la Federaci??n Sueca de Esports (SESF) y Visit Stockholm, descubrimos que nuestra ??nica opci??n restante era pedirle al Ministro del Interior de Suecia que reclasificara The International - Dota 2 Championships como un evento deportivo de ??lite. Nuestra solicitud fue denegada de inmediato.\r\n\r\nDado que el Ministro del Interior no reconoci?? The International - Dota 2 Championships como un evento deportivo de ??lite, se le negar??a a cualquiera que intente obtener una visa para viajar a Suecia para TI10 (incluidos jugadores, talentos y personal). La ausencia de este reconocimiento oficial tambi??n significa que los agentes fronterizos individuales tomar??an decisiones sobre la entrada para aquellos que viajen al evento desde pa??ses fuera de la UE que normalmente no necesitan una visa para ingresar a Suecia.\r\nPresentamos una apelaci??n directamente ante el gobierno sueco el 9 de junio, pero no pudieron brindar asistencia. El 14 de junio seguimos pidi??ndoles que reconsideraran y hasta ahora no han podido ofrecer una resoluci??n. Como resultado, y a la luz de la situaci??n pol??tica actual en Suecia, hemos comenzado a buscar posibles alternativas en otros lugares de Europa para albergar el evento este a??o, en caso de que el gobierno sueco no pueda acomodar el Campeonato Internacional - Dota 2 como estaba planeado. Confiamos en que, en cualquier caso, tendremos una soluci??n que nos permita realizar el TI10 en Europa este a??o y que podremos anunciar un plan actualizado en un futuro muy pr??ximo.\r\n\r\nSeguimos comprometidos con albergar a The International este a??o de una manera que sea segura para todos los involucrados y que celebre adecuadamente a los jugadores y fan??ticos de Dota 2. Comunicaremos lo que averig??emos tan pronto como podamos. Mientras tanto, los clasificatorios de TI todav??a se llevar??n a cabo en las fechas programadas originalmente a partir del 23 de junio. Y m??s adelante esta semana, llegar?? el nuevo evento de verano Nemestice.\r\n\r\nEste fue el comunicado con el que Valve intent?? calmar las aguas pues confirm?? que har??n todo lo necesario para que el mundial de Dota 2 se lleva a cabo este a??o en Suecia. Por el momento, esta es toda la informaci??n que se tiene al respecto sobre este importante evento.', '14', '2020-11-09');
INSERT INTO `noticias` VALUES ('18', 'Uno de los grandes de Europa en LEC se quedar?? fuera de Worlds 2021', 'La LEC no llevar?? 4 representantes al mundial de 2021 de LoL como pas?? en Worlds 2020 al perder la plaza que otorgaba el MSI, por lo que uno de los grandes se quedar?? fuera de esta cita.', 'La temporada 2020 fue hist??rica para Europa, y no solo por la trayectoria que llevaban los equipos de LEC (dos finales del mundo consecutivas y un MSI ganado) sino por la representaci??n de la regi??n en Worlds.\r\n\r\nLos mundiales del a??o pasado fueron los ??nicos en la historia en los que Europa llev?? 4 representantes de la LEC: G2 Esports, Fnatic, Rogue y MAD Lions, aunque solo 3 disputaron la fase de grupos tras la debacle de los leones.\r\nSin embargo, tras la derrota de MAD Lions en el MSI frente a DAMWON KIA en semifinales (2-3), Europa ha perdido la 4?? plaza que se otorgaba en este campeonato, volviendo a la normalidad de llevar 3 representantes de la regi??n.\r\n\r\nDe hecho, ser??n China y Corea del Sur (LPL y LCK) los que llevar??n 4 representantes al ser consideradas las ligas punteras del mundo, por lo que ser?? todav??a m??s dif??cil traer la Copa del Invocador a nuestra regi??n.\r\nSin embargo, todo puede ocurrir todav??a, porque el split de Fnatic y Misfits en verano est?? siendo muy bueno y podr??an ser la gran sorpresa en playoffs si acaban entrando, pero uno se quedar?? fuera de Worlds.\r\n\r\nEs decir, que puede ser que G2 Esports, Rogue, MAD Lions o Fnatic no acudan a Worlds 2021 si no se dan sus resultados, y que incluso dos de ellos se queden fuera si Misfits da la campanada al final.\r\nTodav??a queda mucha LEC por delante y en los pr??ximos meses conoceremos a los equipos que ir??n al mundial, pero ser?? interesante comprobar cual de los \'grandes\' no va a la cita m??s importante del mundo de LoL.', '14', '2020-10-27');
INSERT INTO `noticias` VALUES ('19', 'Ubisoft, denunciada de nuevo por \"acoso institucional\" ante la corte francesa', 'El sindicato Solidaires Informatique y antiguos miembros de la compa????a gala han presentado una nueva denuncia por los casos de abusos y acoso sexual.', 'El retraso de algunos de sus pr??ximos lanzamientos como Riders Republic o el spin off Rainbow Six Extraction parece ser el menor de los problemas para Ubisoft. Ya el anuncio de Assassin\'s Creed Infinity desvel?? problemas a nivel interno en la compa????a gala debido a las acusaciones por acoso y abuso, un fantasma que parece no abandonar a la empresa que comanda Yves Guillemot. As??, hemos podido saber que Ubisoft y el propio Guillemot han sido denunciados ante la Corte Francesa por \"acoso institucional\", y es que seg??n una encuesta publicada hace unos meses, 1 de cada 4 empleados de Ubisoft ha sufrido o sido testigo de alg??n tipo de abuso.\r\nEsta denuncia fue presentada el d??a de ayer en la corte criminal de Bobigny, asistiendo miembros del sindicato franc??s Solidaires Informatique y dos antiguos empleados de Ubisoft. \"La denuncia apunta a Ubisoft como entidad legal por acoso institucional, por mantener y reforzar un sistema donde el acoso sexual se tolera, ya que es m??s rentable para la empresa mantener a acosadores que proteger a sus empleados\", escribieron en Twitter desde el sindicato.\r\nLa denuncia apunta tambi??n directamente a algunos nombres propios de algunos ex directivos de Ubisoft, pero tambi??n de otros que a??n forman parte de la plantilla de la compa????a, tales como el director creativo Serge Hascoet o el Vicepresidente Tommy Fran??ois, quienes renunciaron a su puesto durante el verano de 2020.\r\n\r\n\"Cualquier empleado que haya alegado sufrir o ser testigo de esto y contin??a en Ubisoft ha visto como su caso ha sido rigurosamente revisado por una tercera compa????a, habi??ndose tomado las acciones pertinentes\", se dijo hace unos d??as desde Ubisoft en el medio Bloomberg. \"Empleados que hayan sido investigados no permanecer??n en Ubisoft si los resultados son esclarecedores\".\r\n\r\nDe esta forma, aunque hace ya mucho tiempo que Yves Guillemot anunciara que se ven??an cambios profundos a nivel interno tras estas acusaciones, parece ser que los problemas en este sentido est??n lejos de terminar.', '13', '2020-11-08');
INSERT INTO `noticias` VALUES ('21', 'Call of Duty: Mobile - Diversi??n explosiva en la palma de la mano', 'Hace poco, Red Bull Gaming tuvo la oportunidad de entrevistar al equipo de Call of Duty: Mobile sobre la diferencia entre su versi??n, Call of Duty Honey I Shrunk the Conflict???, de sus hermanos mayores', 'Jugadores incondicionales. Es decir, la fraternidad de jugadores que confraterniza ??ntimamente con las plataformas de sobremesa y consola tiende a tener la abeja detr??s de la oreja cuando se trata de juegos m??viles. A menudo con raz??n. Especialmente cuando se percibe que un lanzamiento para dispositivos m??viles no es m??s que el aprovechamiento de un concepto de ??xito comercializado para un p??blico m??s amplio que realmente no tiene la misma inversi??n en su preciada IP. Los jugadores ac??rrimos se muestran extra??os ante este tipo de cosas: la propiedad de una marca.\r\nPero a veces todo sale bien.\r\nEl mundo de la estrategia ha tenido una buena cantidad de ??xitos con juegos como Civilization y, m??s recientemente, Frostpunk. Y todos sabemos que ese peque??o t??tulo de Hearthstone es m??s que una excepci??n a la regla. Aunque nos consideramos igual que los jugadores m??s incondicionales de los que hablamos aqu??, no nos gusta juzgar cuando se trata del nombre m??s importante en los juegos, Call of Duty, que tiene una versi??n para m??viles. Estamos contentos porque no nos hemos dejado llevar por la arrogancia.\r\nHace poco tuvimos la oportunidad de charlar con el equipo que est?? detr??s de la versi??n m??vil del juego. Mira lo que tienen que decir a continuaci??n.\r\nRed Bull: El nombre \"Call of Duty\" conlleva una gran responsabilidad y mucha gente duda en jugar a un t??tulo triple A en un dispositivo m??vil por miedo a una experiencia inferior, ??puedes decirnos si CoD Mobile, adem??s de jugable, es tambi??n desafiante y divertido?\r\nEquipo de Call of Duty: Mobile: Lo que hace que Call of Duty: Mobile sea ??nico es que re??ne los mapas que m??s gustan, los modos competitivos, los personajes conocidos y las armas emblem??ticas de esta hist??rica franquicia, incluyendo Black Ops y Modern Warfare, a la vez que ofrece nuevos contenidos y experiencias para que los fans los exploren.\r\nEn su esencia, Call of Duty: Mobile es tan visceral y lleno de acci??n como se espera de una experiencia de Call of Duty, pero hemos hecho importantes personalizaciones a algunos de los sistemas favoritos de los fans desde la experiencia de consola/PC para que sea m??s adaptable a la forma en que los jugadores de m??viles prefieren jugar. Cuando los jugadores tienen el juego en sus manos por primera vez, se sorprenden de que sea un juego de Call of Duty de principio a fin, pero adaptado a los dispositivos m??viles.\r\nRed Bull: Al decir esto, ??c??mo ha cambiado la plataforma m??vil la direcci??n del dise??o de un juego que se considera que sigue unos ritmos de juego y unas caracter??sticas bastante importantes? ??Ha habido algo en el desarrollo de la serie para m??viles (fuera de la movilidad) que destaque como revelaci??n frente a las versiones de PC y consola?\r\nEquipo de Call of Duty: Mobile: Aparte de la movilidad y los cambios en el factor de forma, la frecuencia y la composici??n de las temporadas es diferente entre plataformas. Para el equipo de Call of Duty: Mobile, las temporadas son un marco clave en la forma de empaquetar y entregar nuevos mapas, modos, cosm??ticos y nuevos elementos funcionales. La mayor??a de los juegos de consola y PC tienen temporadas de entre 2 y 4 meses, y eso funciona muy bien para su p??blico.\r\n\r\nEn los m??viles, hemos descubierto que los jugadores prefieren temporadas m??s cortas y tem??ticas. Por ejemplo, con el lanzamiento de la cuarta temporada en mayo, el contenido no solo estaba repleto de nuestro evento 80s Action Heroes, sino que la temporada tambi??n tiene una est??tica del Salvaje Oeste. Tenemos un evento llamado \"High Noon Chase\" que permite a los jugadores formar un pelot??n para perseguir una diligencia llena de ladrones de bancos para desbloquear nodos, ganar XP y recompensas tem??ticas por el camino.\r\nEste evento ya est?? disponible desde el 12 de junio y te da una idea de c??mo estamos enfocando nuestro contenido para los fans. Es diferente de lo que se puede hacer en un juego de consola/PC, donde la historia es un poco m??s ??gil. Hemos trabajado mucho en la planificaci??n de un itinerario a lo largo del a??o que creemos que va a gustar a los jugadores. Pronto ver??is algunos ejemplos de nuevas y mayores ideas en torno a nuestro contenido estacional.', '14', '2020-10-25');
INSERT INTO `noticias` VALUES ('22', 'La cadena de Markito: los streamers se unieron contra el coronavirus', 'En un directo de Twitch que fue retransmitido por otros streamers, Markito Navaja alent?? la campa??a de vacunaci??n y el cuidado contra el coronavirus.', 'Consciente de la importancia y la repercusi??n que tienen los streamers hoy en d??a, el Gobierno Nacional se uni?? a algunos de los creadores de contenido m??s reconocidos del pa??s para brindar un mensaje conjunto para alentar la campa??a de vacunaci??n y los cuidados contra el COVID. Markito Navaja protagoniz?? \"La cadena de Markito\" en Twitch, a la que se sumaron otros streamers como Facu Banzas, Aylu Lopez, Sofi Carmona, Momo y Pedro P??rez Disalvo.\r\n\r\nEn las ??ltimas horas, el popular streamer Markito Navaja hab??a anticipado en sus redes sociales que este viernes a las 18 iba a prender la transmisi??n de Twitch para realizar un anuncio muy importante y que lo har??a representando a toda la comunidad de Twitch Argentina. Otros creadores de contenido argentinos se sumaron al mensaje de \"La cadena de Markito\" y tambi??n retransmitieron el mismo desde sus propias cuentas.\r\nEl directo de Markito comenz?? tal como si fuera una cadena nacional, con el himno e im??genes de todo el pa??s. A pesar de la formalidad del fondo y su vestimenta, el streamer asegur?? que se trataba de un \"stream como los de siempre\", aunque algo m??s corto ya que dur?? un poco m??s de 20 minutos. Aunque se lo ve??a un poco nervioso, Markito se mostr?? muy seguro en su mensaje enfocado en alentar la campa??a de vacunaci??n contra el COVID encabezada por el Gobierno Nacional.\r\n\r\nMientras otros importantes creadores de contenido como Facu Banzas, Aylu Lopez y Momo retransmit??an el mensaje de Markito, el streamer le habl?? directamente a su p??blico para generar consciencia en los cuidados que hay que tener frente a la pandemia. Adem??s, les pidi?? que se vacunaran y que ayuden a la gente mayor a inscribirse en la campa??a de vacunaci??n, con el objetivo de que una importante baja en los contagios del coronavirus permita volver a la \"normalidad\".\r\nTal como asegur?? Markito en diversos momentos de la transmisi??n, la misma fue un hecho hist??rico tanto para ??l como para toda la comunidad de streamers argentinos. \"Lo del stream de hoy me llena de orgullo y aunque me van a ver a mi solo, quiero que sepan que estoy representado a la comunidad, a todos los streamers argentinos del mas grande al mas chico, estamos logrando cosas incre??bles\", comparti?? en Twitter unas horas antes de que iniciara la transmisi??n en Twitch.\r\n\r\n\"El mensaje es claro amigos, seguir cuid??ndonos, anot??ndonos para las vacunas y ayudando a los m??s grandes para que se anoten y vacunen, estoy orgulloso de que nos hayan elegido para esto\", escribi?? Markito en Twitter solo unos minutos despu??s de apagar el directo. De esta forma, la comunidad de Twitch Argentina se sum?? al pedido de cuidado y concientizaci??n frente al coronavirus.', '13', '2020-11-12');
INSERT INTO `noticias` VALUES ('23', 'C??mo comerciar en Roblox: gu??a para hacer intercambios con otros jugadores', 'Te damos todos los requisitos necesarios y todos los pasos requeridos para que puedas hacer intercambios comerciales en Roblox.', 'Roblox es una de las licencias m??s populares en el mundo del videojuego, y si bien est?? dirigida m??s al p??blico joven, lo cierto es que est?? empezando a mover una considerable cantidad de dinero, y si quieres introducirte a este mundo que ahora mismo es mucho m??s popular, deber??as conocer su sistema de comercio.\r\nSi bien Roblox es un mundo enorme, lo cierto es que quiz??s no sea del todo claro a la hora de explicar ciertos aspectos como el de comerciar con otros jugadores, una caracter??stica que no es gratuita, pero que podr??as sacar gran provecho si sabes utilizarla al m??ximo.\r\n\r\nVamos a darte todos los pasos para que puedas desbloquear la caracter??stica del intercambio o el comercio en Roblox, e igualmente todos los pasos para enviar una oferta a otro jugador e incluso aceptar o rechazar alguna que hayas recibido.\r\nLo primero de todo, para poder tener desbloqueada la caracter??stica del intercambio comercial en Roblox debes contar con una cuenta de pago, y van desde los 4,99 ??? al mes a los 20,99 ??? al mes. Al suscribirte a Roblox Premium, recibir??s un estipendio mensual de Robux y un bonus del 10 % en la compra de esta moneda.\r\nUna vez que seas miembro de Roblox premium, debes habilitar esta caracter??stica del comercio. Para activarla debes irte a la p??gina de inicio de la configuraci??n de tu cuenta de Roblox, y seleccionar el bot??n de ???configuraci??n??? que est?? situado en la esquina superior derecha de la interfaz.\r\n\r\nUna vez que lo pulses, debes irte a privacidad, y una vez dentro localizar una opci??n que nos va a permitir elegir con quien comerciar, haci??ndose a trav??s de un men?? desplegable.\r\nPodr??s saber el estado de esta transacci??n simplemente accediendo a la p??gina de intercambio de tu cuenta de Roblox, y en concreto yendo al men?? desplegable donde te aparecer??n todas las que est??n pendientes, tanto las entrantes como las salientes.\r\n\r\nSi pulsas sobre cada una de estas ofertas pendientes, podr??s aceptarlas, rechazarla o incluso realizar una contraoferta.\r\n\r\nComo ves, ahora explicado parece mucho m??s sencillo comerciar en Roblox.', '14', '2020-10-28');
INSERT INTO `noticias` VALUES ('24', 'An??lisis F1 2021, el juego m??s completo para disfrutar del Gran Circo', 'Cr??tica de F1 2021, el famoso juego de conducci??n que llega con cambios jugables evidentes y m??s modos de juego para darnos la experiencia m??s completa posible.', 'La F??rmula 1 nos est?? dejando con una de las temporadas m??s interesantes de los ??ltimos a??os en la que Red Bull est?? compitiendo de t?? a t?? con Mercedes y en la que la zona media de la parrilla est?? apretada, muy apretada, con equipos como Ferrari, McLaren o Alpine disput??ndose los puntos en cada carrera y con Fernando Alonso y Carlos Sainz, pilotos de Espa??a, ofreci??ndonos un gran espect??culo en muchos Grandes Premios.\r\nAhora a la gran expectaci??n que ha provocado la competici??n durante este a??o hay que sumarle el lanzamiento de F1 2021, el juego a caballo entre el arcade y la simulaci??n de Codemasters y EA Sports que ya hemos podido probar para traeros su an??lisis y contaros lo que nos ha parecido, las mejoras m??s evidentes en jugabilidad con respecto a la entrega del 2020 y, por supuesto, los nuevos modos de juego que tienen a Braking Point como principal novedad de esta entrega.\r\nVamos a comenzar este an??lisis escribiendo, precisamente, sobre Braking Point, un nuevo modo historia del que ya os hemos hablado con anterioridad que est?? protagonizado por Aiden Jackson, un prometedor piloto del que tomamos el control desde su ??ltima carrera en la F2 hasta sus dos primeras temporadas en la F??rmula 1 en las que comprobar?? de primera mano la dureza del Gran Circo.\r\nTal y como os contamos en nuestras impresiones, este modo nos permite disfrutar de carreras un tanto diferentes con distintos objetivos que van desde quedar en los puntos hasta superar a nuestro compa??ero de equipo pasando por adelantar a los coches de la escuder??a rival, renunciando a los entrenamientos o a la clasificaci??n para centrarse en el punto ??lgido de los Grandes Premios disputando a veces carreras completas y en otras ocasiones comenzando el GP a partir de una determinada vuelta.\r\nLa experiencia con Braking Point en l??neas generales ha sido bastante positiva y da algo de frescura a F1 2021 con un modo historia interesante como punto de partida para mejorarlo durante los pr??ximos a??os en los que esperamos que haya una mayor profundidad ofreciendo m??s objetivos diferentes, dando peso a la decisi??n del piloto en el desarrollo del coche y ofreciendo una historia m??s atractiva que la de este debut. Como decimos las sensaciones son buenas y hemos disfrutado durante toda la campa??a de unas 6 u 8 horas de duraci??n, pero se nota que es un modo que acaba de aterrizar y que llega como base para hacerlo crecer en pr??ximas entregas.\r\nLos otros dos modos estrella para un jugador son Mi Equipo y Piloto, que llegan tambi??n con algunos cambios interesantes que van a agradar a los jugadores de la saga. Los m??s evidentes son un nuevo sistema de I+D m??s completo e intuitivo para mejorar las piezas de nuestro monoplaza a lo largo de la temporada, as?? como una nueva forma de afrontar los entrenamientos libres para hacerlos menos pesados y m??s \"disfrutables\" para los jugadores. De hecho, incluso podemos hacer frente a los libres de forma autom??tica, ganando menos puntos de desarrollo que si los realizamos de forma manual.\r\nM??s all?? de esto sin duda el mayor atractivo que encontramos es la posibilidad de jugar a la Carrera en modo \"dobles\" a trav??s de internet, pudiendo disfrutar con un amigo de este modo a trav??s de internet de una forma ??nica, siendo parte de la misma escuder??a para trabajar juntos de cara al mundial de constructores o competir como rivales intentando quedar m??s arriba que el otro en la clasificaci??n de pilotos.\r\nPasemos ahora a hablar del modo multijugador en el que no vemos demasiados cambios pudiendo disputar carreras r??pidas informales (con modos para principiantes y expertos), clasificatorias, ligas, eventos semanales y grandes premios personalizados, as?? como torneos de esports que tienen su propio apartado dentro del juego. Adem??s, como a??os anteriores contaremos con un sistema de rango y progresiones y un \"pase de temporada\" para obtener diferentes objetos cosm??ticos.\r\nCon el rendimiento del modo online estamos muy satisfechos, con pocos tiempos de espera en PC y sin encontrarnos con lagazos o ralentizaciones, pudiendo disfrutar de una experiencia similar de conducci??n a la que tenemos en solitario. El principal problema, sobre todo hasta que obtenemos rango, ser?? la de esquivar a los jugadores m??s noveles o con una conducci??n m??s temeraria.\r\nYa en la pista vemos algunos cambios evidentes en la jugabilidad sobre todo en lo que a las f??sicas del coche se refiere, haciendo hincapi?? en la frenada m??s realista que en la edici??n anterior y en el comportamiento del coche cuando vamos a gran velocidad, siendo m??s dif??cil que en otras ediciones ser precisos en las curvas si vamos pasados de velocidad o si no cogemos una buena trazada.\r\n\r\nQuiz??s lo m??s obvio mientras jugamos lo encontramos en los pianos, que desestabilizan mucho m??s el coche que en a??os anteriores castigando a aquellos jugadores que los usan en exceso o que se \"comen\" parte de la curva utiliz??ndolos, encontrando un ejemplo evidente la chicane del Circuit de Barcelona-Catalunya que antes se pod??a recortar de forma evidente pisando incluso el reborde amarillo sin perder tiempo y que ahora \"escupe\" a nuestro monoplaza perdiendo el control de forma evidente. Otro ejemplo gr??fico lo pod??is ver en el peque??o v??deo que os dejamos aqu?? abajo en el que perdemos el control del F1 tras pisar uno de los pianos de Spa-Francorchamps:\r\nLa IA tambi??n ha mejorado, sobre todo a la hora de cerrar bien la puerta en los adelantamientos, con algunos pilotos como Carlos Sainz siendo muy dif??ciles de superar en carrera. Adem??s, nuestros rivales nos presionan mejor cuando nos tienen que adelantar castigando cualquier fallo o curva mal tomada para superarnos si est??n lo suficientemente cerca. Aun as??, en ocasiones notamos como los pilotos en posiciones intermedias a veces van m??s lentos justo hasta que los superamos, momento en el que empiezan a apretar, o al menos eso es lo que hemos notado con la Dificultad 72 con la que hemos \"competido\" en los distintos modos de juego.', '13', '2020-11-14');

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
INSERT INTO `rubros` VALUES ('19', 'Gu??as');
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
INSERT INTO `usuarios` VALUES ('13', 'Juan', 'Pablo', 'Soro', 'Lovece', 'sorojuanpablo@gmail.com', 'juampitito', 'Soy dise??ador gr??fico egresado de la UBA, mi orientaci??n como dise??ador es principalmente en dise??o impreso y packaging aunque tengo experiencia en otras ??reas del dise??o. Cuento con\nexperiencia en el manejo de equipos creativos, y tengo disposici??n a aprender nuevas t??cnicas y tendencias en el ??rea del dise??o.', '1', '14');
INSERT INTO `usuarios` VALUES ('14', 'Gonzalo', 'Nahuel', 'Rodriguez', null, 'gonzalito@gmail.com', 'gonsalito', 'Licenciado en dise??o gr??fico y comunicaci??n visual, especializado en dise??o digital e interactivo. Maquetador Front End, con amplios conocimientos y experiencia en HTML, CSS y Javascript.', '1', '14');
INSERT INTO `usuarios` VALUES ('15', 'Tatiana', null, 'Messi', null, 'messi@tati.com', 'tatibts', 'Trabajo en tareas como futura dise??adora gr??fica hace 4 a??os. Me entusiasma desarrollarme en los procesos desde el marketing digital, branding, hasta la producci??n de una editorial, donde la imaginaci??n es mi herramienta principal; Que profesionales me ayuden a formarme con su experiencia y conocimiento. Mi esp??ritu positivo y mi disciplina me permitir??n lograr mis metas y alcanzar mi objetivo especifico.', '2', '15');
INSERT INTO `usuarios` VALUES ('16', 'Jorge', null, 'Selen', null, 'jorgitoselen@gmail.com', 'selenj', 'Desde mi infancia hasta hoy d??a he encontrado que mi mejor forma de expresi??n es gr??ficamente. Creo que hoy d??a el dise??o gr??fico es la conexi??n ideal entre una idea y una manifestaci??n art??stica, y que cumple un rol escencial en esta cultura de lo inmediato donde si un mensaje quiere ser escuchado debe ser representado con un estilo particular y con una impronta personal de gran pregnancia. Como estudiante de dise??o gr??fico y como persona de muchos intereses, busco d??a a d??a estimular mi creatividad y mejorar mis herramientas con las cuales pueda plasmar mis ideales.', '2', '17');
INSERT INTO `usuarios` VALUES ('17', 'Mariana', null, 'Introzzi', null, 'Introzzi@gmail.com', 'intmarian', 'Tengo conocimientos en Artes Visuales, distintos programas de dise??o, gran dominio del ingles y experiencia en ventas y atenci??n al p??blico.', '2', '18');
INSERT INTO `usuarios` VALUES ('18', 'Laura', 'Carmen', 'Vegani', null, 'carmensita@gmail.com', 'lAURA', 'Soy un profesional en Marketing con ??nfasis en marketing digital, tengo una experiencia aproximada de 12 a??os como Ejecutivo Comercial y la complemento con mi gusto por el conocimiento de nuevas tendencias y tengo un gusto especial por constante aprendizaje.', '2', '19');
INSERT INTO `usuarios` VALUES ('19', 'Pablo', 'Hugo', 'Soro', null, 'sorinhoPa@gmail.com', 'pshoro', 'Me defino como una persona proactiva. Me gustan los desaf??os y busco el crecimiento constante. Valoro mucho las relaciones interpersonales y el buen ambiente laboral. Siempre busco poder dar lo mejor de m?? y contribuir al crecimiento de la compa????a en la que trabajo a base de esfuerzo diario.', '2', '14');
INSERT INTO `usuarios` VALUES ('22', 'Marian', 'Abril', 'Picto', 'Gutierrez', 'guti@gmail.com', 'gutijaja', 'Soy una apasionada de las nuevas tecnolog??as, la fotograf??a y el cambio de mentalidad para alcanzar tus metas.', '2', '15');
INSERT INTO `usuarios` VALUES ('23', 'Carmen', 'Ines', 'Bogliolo', 'Fontaina', 'fontaina@gmail.com', 'fontanet', 'Actualmente resido en Argentina, Buenos Aires donde Trabajo de Community Manager de la marca de Radios con mas historia en el pa??s, Spica.', '2', '20');
INSERT INTO `usuarios` VALUES ('24', 'Lucia', null, 'Rodriguez', null, 'rolucia@gmail.com', 'arrozlu', 'Soy extrovertida y creativa. Abierta a nuevas propuestas y conocimientos.', '2', '14');
INSERT INTO `usuarios` VALUES ('25', 'Dan', null, 'Casoy', null, 'danca@gmail.com', 'dancaS', 'Tengo experiencia coordinando y dirigiendo equipos de trabajo de varias personas y supervisando fot??grafos, ilustradores, programadores, retocadores y creativos digitales.', '2', '22');
INSERT INTO `usuarios` VALUES ('27', 'Juan', '', 'Sito', '', 'juansitodios@gmail.com', '123', 'Soy un genio de la programaci??n. En especial PHP.', '2', '14');
INSERT INTO `usuarios` VALUES ('30', 'Tatiana', 'Abril', 'Merlo', '', 'avissestareloco@gmail.com', 'tucup', 'Soy una chica gamer que le interesa la programacion.', '2', '17');
INSERT INTO `usuarios` VALUES ('31', 'Roberta', '', 'Lonca', '', 'roberlonca@gmail.com', '123', 'Soy aficionada del dise??o desde que soy peque??a.', '2', '16');
INSERT INTO `usuarios` VALUES ('32', 'Gonzalo', '', 'Lobaisa', '', 'trascopier@ra.com', '123', 'Dise??ador buscando inspiraci??n.', '2', '18');
INSERT INTO `usuarios` VALUES ('33', 'Omar', '', 'Toyos', '', 'omar.toyos@gmail.com', '123', 'Soy un dise??ador de primera clase.', '2', '14');

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
