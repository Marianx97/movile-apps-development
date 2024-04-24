class Movie {
  String title;
  String director;
  String description;
  int? _year;

  Movie({
    required this.title,
    required this.director, 
    required this.description,
  });

  void printMovie() {
    print('Title: $title');
    print('Director: $director');
    print('Description: $description');
  }
}
