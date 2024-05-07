// Aquí se simula la obtención de información de películas.

import 'package:challenge_3/domain/movie.dart';

final List<Movie> movies = [
  Movie(
    id: '1',
    title: 'The shawshank Redemption',
    director: 'Frank Darabont',
    year: 1994,
    posterUrl: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uRRTV7p6l2ivtODWJVVAMRrwTn2.jpg',
  ),
  Movie(
    id: '2',
    title: 'The Godfather',
    director: 'Francis Ford Coppola',
    year: 1972,
    posterUrl: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/5HlLUsmsv60cZVTzVns9ICZD6zU.jpg',
  ),
  Movie(
    id: '3',
    title: 'The Dark Knight',
    director: 'Christopher Nolan',
    year: 2008,
    posterUrl: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8QDQExnfNFOtabLDKqfDQuHDsIg.jpg',
  ),
  Movie(
    id: '4',
    title: 'Godzilla Minus One',
    director: 'Takashi Yamazaki',
    year: 2023,
    posterUrl: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
  ),
];
