import 'package:w9_practice_firebase1/model/artist/artist.dart';

import '../../model/songs/song.dart';

class ArtistDto {
  static const String genreKey = 'genre';
  static const String imageUrlKey = 'imageUrl';
  static const String nameKey = 'name';

  static Artist fromJson(Map<String, dynamic> json, String id) {
    assert(json[genreKey] is String);
    assert(json[imageUrlKey] is String);
    assert(json[nameKey] is String);

    return Artist(
      id: id,
      genre: json[genreKey],
      imageUrl: json[imageUrlKey],
      name: json[nameKey],
    );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      genreKey: artist.genre,
      imageUrlKey: artist.imageUrl,
      nameKey: artist.name,
    };
  }
}
