import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w9_practice_firebase1/data/dtos/artist_dto.dart';
import 'package:w9_practice_firebase1/model/artist/artist.dart';

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {

  static final Uri baseUrl = Uri.https(
    'w9database-default-rtdb.asia-southeast1.firebasedatabase.app');
  static final Uri artistsUrl = baseUrl.replace(path: '/artists.json') ;

  @override
  Future<List<Artist>> fetchArtist() async {
    final http.Response response = await http.get(artistsUrl);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> bodyJson =json.decode(response.body);

      List<Artist> result = [];
      for (var it in bodyJson.entries){
        String id = it.key;
        Map<String, dynamic> value = it.value;
        Artist artist= ArtistDto.fromJson(value, id);
        result.add(artist);
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load artist');
    }
  }

  // @override
  // Future<Song?> fetchSongById() async {}
}
