import 'package:floor/floor.dart';

@entity
class Book {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int? authorId;
  final int? releaseYear;
  final String? imageUrl;
  final String summary;
  final String title;

  Book({
    this.id,
    this.authorId,
    this.releaseYear,
    this.imageUrl,
    required this.summary,
    required this.title,
  });  
}

///  TODO:
/// - Delete this and implement repository method
List<Book> books = [
  Book(
    id: 1,
    authorId: 1,
    releaseYear: 2002,
    imageUrl: null,
    summary: 'Velit sint ea minim occaecat aliqua excepteur mollit esse labore nostrud cupidatat sit. Voluptate laboris amet deserunt aliquip tempor ex id ex. Et pariatur nisi anim veniam proident Lorem velit aliquip proident consectetur cillum reprehenderit pariatur. Eu anim consectetur consectetur elit sit ad eiusmod consequat aliqua do qui eiusmod aliquip. Id ipsum occaecat nostrud duis excepteur ex non occaecat commodo do laborum deserunt excepteur enim. Commodo ipsum proident elit reprehenderit proident nostrud est officia eiusmod amet.',
    title: 'Eragon'
  ),
  Book(
    id: 2,
    authorId: 2,
    releaseYear: 1954,
    imageUrl: null,
    summary: 'Aute exercitation sunt eiusmod velit do eu elit sunt aliqua sit nisi. Culpa officia nostrud et amet enim sunt culpa magna magna non do duis. Labore Lorem consectetur qui irure ex est duis sunt id do amet anim nulla ad. Tempor laborum deserunt cupidatat magna in nisi eiusmod est. Est nisi veniam labore nisi.',
    title: 'The Lord of the Rings',
  ),
  Book(
    id: 3,
    authorId: 3,
    releaseYear: 1997,
    imageUrl: null,
    summary: 'Aute consectetur deserunt consectetur sit sit cillum magna irure esse. Aute consequat aliqua ad anim ea sunt exercitation incididunt elit enim quis. Pariatur sunt pariatur eu elit ad Lorem aliqua et voluptate deserunt deserunt fugiat duis.',
    title: 'Harry Potter and the Philosopher\'s stone',
  ),
  Book(
    id: 4,
    authorId: null,
    releaseYear: 1950,
    summary: 'Ex sit anim tempor tempor. Qui et culpa voluptate quis quis laboris proident ex commodo adipisicing fugiat. Duis magna eu occaecat elit ad irure elit enim consectetur reprehenderit exercitation laborum sint. Magna ipsum amet amet qui minim consectetur sint tempor do. Eiusmod non non sint id irure nostrud aliqua laboris enim.',
    title: 'I, Robot'
  ),
  Book(
    id: 5,
    authorId: null,
    releaseYear: 1943,
    summary: 'Laborum minim laboris ex do mollit magna commodo officia fugiat adipisicing ipsum reprehenderit nostrud. Voluptate elit labore fugiat ad. In est et et pariatur ipsum commodo adipisicing. Non incididunt laboris eu culpa ex irure elit occaecat aliqua anim. Non ad dolor cupidatat tempor esse esse nisi. Velit laborum velit nulla consectetur deserunt minim. Ex non culpa ex pariatur esse ex ut.',
    title: 'The Little Prince',
  ),
];
