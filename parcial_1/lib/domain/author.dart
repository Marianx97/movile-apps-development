import 'package:floor/floor.dart';

@entity
class Author {
  
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String biography;
  final String? imageUrl;

  Author({
    this.id,
    required this.name,
    required this.biography,
    this.imageUrl,
  });

  String books() {
    return '5';
  }
}

/// TODO:
/// - Delete this and implement repository method
List<Author> authors = [
  Author(
    id: 1,
    name: 'Christopher Paolini',
    biography: 'Exercitation ea minim elit voluptate voluptate. Non irure cillum qui velit adipisicing pariatur. Aliqua ipsum aliqua quis sit laborum pariatur veniam proident excepteur eu culpa sint fugiat reprehenderit. Sint exercitation adipisicing aliquip excepteur.',
    imageUrl: null,
  ),
  Author(
    id: 2,
    name: 'J.R.R. Tolkien',
    biography: 'Do est irure cupidatat eiusmod qui commodo. Ad labore pariatur incididunt elit adipisicing commodo id eiusmod magna. Nulla in aliqua velit eiusmod anim dolor nulla dolor adipisicing dolore magna. Et ipsum consequat occaecat officia consequat pariatur elit voluptate sit ex laboris.',
    imageUrl: null,
  ),
  Author(
    id: 3,
    name: 'J.K. Rowling',
    biography: 'Velit qui voluptate incididunt officia laboris non. Mollit cillum laboris sint sunt ex pariatur enim minim id incididunt enim mollit anim. Nostrud occaecat eu cupidatat ut adipisicing dolore do fugiat Lorem do adipisicing ea sunt eu.',
    imageUrl: null,
  ),
  Author(
    id: 4,
    name: 'George R.R. Martin',
    biography: 'Aliquip reprehenderit irure adipisicing amet aute non eu nostrud ullamco duis excepteur. Ad eu qui enim cillum est consectetur dolore enim. Consequat sunt sit elit nostrud Lorem reprehenderit id voluptate Lorem aliquip adipisicing.',
    imageUrl: null,
  )
];
