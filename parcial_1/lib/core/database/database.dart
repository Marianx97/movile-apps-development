import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:parcial_1/datasource/daos/author_dao.dart';
import 'package:parcial_1/datasource/daos/book_dao.dart';
import 'package:parcial_1/datasource/daos/user_dao.dart';

import 'package:parcial_1/domain/author.dart';
import 'package:parcial_1/domain/book.dart';
import 'package:parcial_1/domain/user.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Author, Book, User])
abstract class AppDatabase extends FloorDatabase {
  AuthorDao get authorDao;
  BookDao get bookDao;
  UserDao get userDao;
}

Future<AppDatabase> buildDatabase() async {
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .addCallback(Callback(
        onCreate: (database, version) async {
          // Raw SQL to create initial data if needed
          await database.execute('''
            INSERT INTO Book (id, authorId, releaseYear, imageUrl, summary, title) VALUES
            (1, 1, 2002, 'https://www.penguinlibros.com/ar/2126605-thickbox_default/eragon-saga-el-legado-1.jpg', 'La historia transcurre en el ficticio territorio de Alagaêsia. El protagonista, Eragon, encuentra una especie de piedra preciosa de gran tamaño y color azul mientras está cazando en el bosque.', 'Eragon'),
            (2, 1, 2005, 'https://www.penguinlibros.com/ar/2126606/eldest-saga-el-legado-2.jpg', 'La historia continúa las aventuras del joven Eragon y de su dragona Saphira, centrándose en su viaje al reino de los elfos para la formación de Eragon como Jinete.', 'Eldest'),
            (3, 1, 2008, 'https://www.penguinlibros.com/ar/2126578-thickbox_default/brisingr-saga-el-legado-3.jpg', 'Una vida que Eragon sabe sujeta a la fuerza de las promesas sin cumplir. La primera es la que Eragon le hizo a su primo Roran: rescatar a su amada, Katrina, de las garras del rey Galbatorix. Sin embargo, éste no es más que el primero de sus compromisos.', 'Brisingr'),
            (4, 1, 2011, 'https://www.lanormallibros.com.ar/media/libros/343095bc22213f4f4b59ab6f9af9afdb.jpg', 'En Legado, la cuarta y última entrega de la popularísima Saga Legado, nos embarcamos en un viaje cargado de peligro y descubrimientos, donde el destino de toda una raza reposa sobre los hombros de un joven, Eragon. Su excepcional vínculo con un dragón y su inquebrantable determinación por enfrentarse al mal lo convierten en un campeón de la esperanza.', 'Legado'),
            (5, 1, 2023, 'https://www.penguinlibros.com/ar/3456463-thickbox_default/murtagh-ciclo-el-legado-5.jpg', 'El mundo ya no es un lugar seguro para Murtagh y su dragón, Thorn. Un rey malvado ha sido derrocado y deben enfrentar las consecuencias del papel reacio que desempeñaron en su reinado de terror. Ahora son odiados y están solos, exiliados a las afueras de la sociedad.', 'Murtagh'),
            (6, 2, 1997, 'https://static.wikia.nocookie.net/esharrypotter/images/9/9a/Harry_Potter_y_la_Piedra_Filosofal_Portada_Espa%C3%B1ol.PNG/revision/latest/scale-to-width-down/1200?cb=20151020165725', 'Harry descubre que es un mago el día de su undécimo cumpleaños y se une al Colegio Hogwarts de Magia y Hechicería. Allí, junto a sus amigos Ron y Hermione, desentraña el misterio de la piedra filosofal y enfrenta a su primer enemigo, el oscuro mago Voldemort.', 'Harry Potter y la piedra filosofal'),
            (7, 2, 1998, 'https://static.wikia.nocookie.net/esharrypotter/images/b/b6/Harry_Potter_y_la_Camara_Secreta_Portada_Espa%C3%B1ol.PNG/revision/latest/scale-to-width/360?cb=20151020165931', 'En su segundo año en Hogwarts, Harry debe enfrentarse a una antigua amenaza que reside en la Cámara de los Secretos. Los estudiantes comienzan a ser petrificados, y Harry descubre su capacidad para hablar con serpientes, lo que lo vincula con la leyenda de la Cámara.', 'Harry Potter y la camara secreta'),
            (8, 2, 1999, 'https://static.wikia.nocookie.net/esharrypotter/images/8/81/Harry_Potter_y_el_prisionero_de_Azkaban_Portada_Espa%C3%B1ol.PNG/revision/latest/scale-to-width-down/1200?cb=20151020170338', 'El tercer año de Harry en Hogwarts se ve amenazado por la fuga del prisionero Sirius Black, quien se cree que quiere matarlo. Sin embargo, Harry descubre la verdadera historia de Sirius y su conexión con su propia familia y el traidor que llevó a la muerte de sus padres.', 'Harry Potter y el prisionero de Azkaban'),
            (9, 2, 2000, 'https://static.wikia.nocookie.net/esharrypotter/images/7/7d/Harry_Potter_y_el_C%C3%A1liz_de_Fuego_Portada_Espa%C3%B1ol.PNG/revision/latest?cb=20151020170423', 'Harry participa en el peligroso Torneo de los Tres Magos después de que su nombre es misteriosamente seleccionado por el Cáliz de Fuego. Durante el torneo, Voldemort resurge, y Harry presencia su renacimiento en una lucha mortal.', 'Harry Potter y el caliz de fuego'),
            (10, 2, 2003, 'https://static.wikia.nocookie.net/esharrypotter/images/9/9d/Harry_Potter_y_la_Orden_del_F%C3%A9nix_Portada_Espa%C3%B1ol.PNG/revision/latest?cb=20151020170600', 'En su quinto año, Harry enfrenta la hostilidad del Ministerio de Magia, que se niega a creer en el regreso de Voldemort. Junto con sus amigos, forma la Orden del Fénix para luchar contra las fuerzas oscuras y se enfrenta a las terribles profecías que lo rodean.', 'Harry Potter y la orden del fénix'),
            (11, 2, 2005, 'https://static.wikia.nocookie.net/esharrypotter/images/8/8d/Harry_Potter_y_el_Misterio_del_Pr%C3%ADncipe_Portada_Espa%C3%B1ol.PNG/revision/latest?cb=20151020170658', 'Mientras el mundo mágico está en guerra, Harry descubre más sobre el pasado de Voldemort a través de las lecciones privadas con Dumbledore. Los secretos del Horrocrux, objetos en los que Voldemort ha escondido fragmentos de su alma, se revelan y marcan el camino para la batalla final.', 'Harry Potter y el príncipe mestizo'),
            (12, 2, 2007, 'https://static.wikia.nocookie.net/esharrypotter/images/5/59/Harry_Potter_y_las_Reliquias_de_la_Muerte_portada_espa%C3%B1ol.jpg/revision/latest?cb=20151001174320', 'En el último libro, Harry, Ron y Hermione abandonan Hogwarts para destruir los Horrocruxes y derrotar a Voldemort. La serie culmina en una épica batalla en Hogwarts, donde Harry enfrenta su destino y finalmente vence a Voldemort, trayendo paz al mundo mágico.', 'Harry Potter y las reliquias de la muerte'),
            (13, 3, 1937, 'https://static.wikia.nocookie.net/bibliotecadelatierramedia/images/8/88/Lelhobbit.jpg/revision/latest/scale-to-width-down/220?cb=20130725103721&path-prefix=es', 'Bilbo Bolsón, un hobbit tranquilo y sin deseos de aventuras, es reclutado por el mago Gandalf para unirse a un grupo de trece enanos liderados por Thorin Escudo de Roble. Juntos, se embarcan en una misión para recuperar el Reino de Erebor y su tesoro, custodiado por el dragón Smaug. A lo largo del viaje, Bilbo descubre su valentía y encuentra el Anillo Único, que jugará un papel crucial en la futura lucha contra Sauron.', 'El Hobbit'),
            (14, 3, 1954, 'https://static.wikia.nocookie.net/bibliotecadelatierramedia/images/7/75/Lcomunidad.jpg/revision/latest?cb=20130724112302&path-prefix=es', 'Frodo Bolsón hereda un poderoso y peligroso anillo de su tío Bilbo. Junto a un grupo de valientes compañeros, inicia una travesía desde la Comarca hasta Mordor para destruir el anillo y evitar que el malvado Sauron lo recupere y conquiste la Tierra Media.', 'El señor de los anillos: La Comunidad del Anillo'),
            (15, 3, 1954, 'https://static.wikia.nocookie.net/bibliotecadelatierramedia/images/c/c8/Ldostorres.jpg/revision/latest/scale-to-width-down/220?cb=20130724114036&path-prefix=es', 'La Comunidad se ha disuelto, y Frodo y Sam continúan su viaje hacia Mordor con la ayuda de la criatura Gollum. Mientras tanto, Aragorn, Legolas y Gimli luchan para defender Rohan y enfrentan las fuerzas de Saruman, un traidor aliado de Sauron.', 'El señor de los anillos: Las dos Torres'),
            (16, 3, 1955, 'https://static.wikia.nocookie.net/bibliotecadelatierramedia/images/5/5f/Lretorno.jpg/revision/latest/scale-to-width-down/220?cb=20130725071945&path-prefix=es', 'La batalla final por la Tierra Media se avecina. Aragorn reclama su lugar como rey y lidera la lucha contra Sauron, mientras Frodo y Sam se acercan a la montaña del destino para destruir el anillo. El destino de la Tierra Media se decide en una épica conclusión.', 'El señor de los anillos: El retorno del rey');
          ''');

          await database.execute('''
            INSERT INTO Author (id, name, biography, imageUrl) VALUES
            (1, 'Christopher Paolini', 'Nacido el 17 de noviembre de 1983 en Los Ángeles, California, Christopher Paolini es un autor estadounidense conocido por su serie de fantasía "El Legado", que comenzó con "Eragon" en 2002. Paolini escribió "Eragon" mientras aún era adolescente y el libro fue publicado inicialmente por su familia. La serie se convirtió en un éxito internacional, con cuatro libros en total. Además de escribir, Paolini es un ávido lector y apasionado de la esgrima y la historia.', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT0w7KlKEZXuQMMu0_QbJHYwEJNn7H7jX4i5DFlHF0NsGUzQ-7x'),
            (2, 'J.K. Rowling', 'Joanne Rowling, conocida como J.K. Rowling, nació el 31 de julio de 1965 en Yate, Inglaterra. Es la autora de la mundialmente famosa serie de libros "Harry Potter", que ha vendido más de 500 millones de copias y ha sido traducida a más de 80 idiomas. Rowling concibió la idea de "Harry Potter" en un tren en 1990 y publicó el primer libro, "Harry Potter y la piedra filosofal", en 1997. Además de su trabajo literario, es conocida por su filantropía y ha fundado varias organizaciones benéficas.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnBTzkiR8GVQ8BVtsb24iBWhfwghaNzo8xKBy0ffuJKQ&s'),
            (3, 'J.R.R. Tolkien', 'John Ronald Reuel Tolkien nació el 3 de enero de 1892 en Bloemfontein, Sudáfrica, y falleció el 2 de septiembre de 1973 en Bournemouth, Inglaterra. Fue un escritor, poeta, filólogo y profesor universitario, conocido por sus obras de fantasía "El Hobbit" (1937) y "El Señor de los Anillos" (1954-1955). Tolkien fue profesor de anglosajón en la Universidad de Oxford y es considerado el padre de la fantasía moderna. Su detallada construcción de mundos y lenguajes ficticios ha dejado un legado perdurable en la literatura y la cultura popular.', 'https://i0.wp.com/elanillounico.com/wp-content/uploads/2015/03/JRR-Tolkien15.jpg?fit=760%2C1076&ssl=1');
          ''');
        },
      ))
      .build();
  return database;
}
