import 'package:flutter/material.dart';
import 'package:w9_practice_firebase1/data/repositories/artist/artist_repository.dart';
import 'package:w9_practice_firebase1/model/artist/artist.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  final ArtistRepository artistRepository;

AsyncValue<List<Map<String, dynamic>>> songsValue = AsyncValue.loading();

  LibraryViewModel({required this.songRepository, required this.playerState, required this.artistRepository}) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Song> songs = await songRepository.fetchSongs();
      List<Artist> artists = await artistRepository.fetchArtist();

      // 2- Join songs with artist info
      List<Map<String, dynamic>> songsWithArtist = songs.map((song) {
        Artist artist = artists.firstWhere(
          (a) => a.id == song.artistId,
          orElse: () => Artist(
            id: '',
            name: 'Unknown',
            genre: 'Unknown',
            imageUrl: '',
          ),
        );
        return {
          'song': song,
          'artistName': artist.name,
          'artistGenre': artist.genre,
        };
      }).toList();

      songsValue = AsyncValue.success(songsWithArtist);
    } catch (e) {
      // 3- Fetch is unsucessfull
      songsValue = AsyncValue.error(e);
    }
     notifyListeners();

  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
