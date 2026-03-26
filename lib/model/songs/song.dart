class Song {
  final String id;
  final String imageUrl;
  final String title;
  final String artistId;
  final Duration duration;

  Song({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.artistId,
    required this.duration,
  });

  @override
  String toString() {
    return 'Song(id: $id,imageUrl: $imageUrl, title: $title, artist: $artistId, duration: $duration)';
  }
}
