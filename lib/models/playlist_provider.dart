import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'song.dart';

part 'playlist_provider.g.dart';

@riverpod
class PlaylistNotifier extends _$PlaylistNotifier {
  @override
  Set<Song> build() {
    return {
      Song(
        songName: 'love me not',
        artistName: 'Ravyn Lenae',
        albumArtImagePath: 'assets/images/lovemenot.jpg',
        audioPath: 'assets/audio/lovemenot.mp3',
      ),
      Song(
        songName: "Look On Down From The Bridge",
        artistName: "Mazzy Star",
        albumArtImagePath: 'assets/images/lookondown.jpg',
        audioPath: 'assets/audio/lookondown.mp3',
      ),
      Song(
        songName: "Dracula",
        artistName: "Tame Impala",
        albumArtImagePath: 'assets/images/dracula.jpg',
        audioPath: 'assets/audio/dracula.mp3',
      ),
    };
  }
}
