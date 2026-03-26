import 'package:w9_practice_firebase1/model/artist/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtist();
  
}
