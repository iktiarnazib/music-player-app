import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'song.dart';

part 'playlist_provider.g.dart';

@riverpod
class PlaylistNotifier extends _$PlaylistNotifier {
  @override
  Set<Song> build() {
    return {
      Song(
        songName: 'Love Me Not',
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

  //current index
  int? currentIndex = 0;

  //A U D I O P L A Y E R

  //Audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration
  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;

  //constructor

  //initially not playing
  bool isPlaying = false;

  //play the song
  void play() async {}

  //pause current song

  //play or pause

  //seek a specific position in the current song

  //play next song

  //play previous song

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newduration) {
      totalDuration = newduration;
      ref.notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      currentDuration = newPosition;
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {});

    //notifying provider
  }

  //dispose audio player
}
