import 'package:flutter/material.dart';
import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
    required this.artistName,   //add when i do part3
    required this.artistGenre,  // 
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;
  final String artistName;   // 
  final String artistGenre;  // 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(song.imageUrl),
          ),
          title: Text(song.title),
          subtitle: Text(                              // 
            '$artistName · $artistGenre',             // 
            style: TextStyle(fontSize: 12, color: Colors.grey),  // 
          ),                                           // 
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}