    import '../../model/songs/song.dart';

class SongDto {
  static const String imageUrlKey = 'imageUrl';
  static const String titleKey = 'title';
  static const String artistKey = 'artistId';
  static const String durationKey = 'duration';   // in ms

  static Song fromJson(Map<String, dynamic> json, String id) {
    assert(json[imageUrlKey] is String);
    assert(json[titleKey] is String);
    assert(json[artistKey] is String);
    assert(json[durationKey] is int);

    return Song(
      id: id,
      imageUrl: json[imageUrlKey],
      title: json[titleKey],
      artistId: json[artistKey],
      duration: Duration(milliseconds: json[durationKey]),
    );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Song song) {
    return {
      imageUrlKey: song.id,
      titleKey: song.title,
      artistKey: song.artistId,
      durationKey: song.duration.inMilliseconds,
    };
  }
}
