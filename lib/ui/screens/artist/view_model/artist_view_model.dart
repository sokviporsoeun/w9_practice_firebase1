import 'package:flutter/material.dart';
import 'package:w9_practice_firebase1/data/repositories/artist/artist_repository.dart';
import 'package:w9_practice_firebase1/model/artist/artist.dart';
import '../../../utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;
  

  AsyncValue<List<Artist>> artistValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository, }) {

    // init
    _init();
  }

  void _init() async {
    fetchArtist();
  }

  void fetchSong() async {
    // 1- Loading state
    artistValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Artist> artist = await artistRepository.fetchArtist();
      artistValue = AsyncValue.success(artist);
    } catch (e) {
      // 3- Fetch is unsucessfull
      artistValue = AsyncValue.error(e);
    }
     notifyListeners();

  }

  // bool isSongPlaying(Song song) => playerState.currentSong == song;

  // void start(Song song) => playerState.start(song);
  // void stop(Song song) => playerState.stop();
}
