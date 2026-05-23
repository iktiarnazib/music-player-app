import 'package:flutter/material.dart';
import 'package:musicapp/components/neu_box.dart';

class SongPage extends StatelessWidget {
  final String songName;
  final String artistName;
  final String albumArtImagePath;
  final String audioPath;
  const SongPage({
    super.key,
    required this.songName,
    required this.artistName,
    required this.albumArtImagePath,
    required this.audioPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(children: []),
    );
  }
}
