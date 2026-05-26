import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'song.dart';

part 'playlist_provider.g.dart';

@riverpod
class PlaylistNotifier extends _$PlaylistNotifier {
  //guard to run it only once when initialized
  bool _listenersRegistered = false;
  @override
  Set<Song> build() {
    //dispose when removed from memory
    ref.onDispose(() {
      _audioPlayer.dispose();
    });

    //after first run '_listenersRegistered' becomes false
    if (!_listenersRegistered) {
      _listenersRegistered =
          true; //making it false so it doesn't run again using true.
      listenDuration();
    }
    return {
      Song(
        songName: 'Love Me Not',
        artistName: 'Ravyn Lenae',
        albumArtImagePath: 'assets/images/lovemenot.jpg',
        audioPath: 'audio/lovemenot.mp3',
      ),
      Song(
        songName: "Look On Down From The Bridge",
        artistName: "Mazzy Star",
        albumArtImagePath: 'assets/images/lookondown.jpg',
        audioPath: 'audio/lookondown.mp3',
      ),
      Song(
        songName: "Dracula",
        artistName: "Tame Impala",
        albumArtImagePath: 'assets/images/dracula.jpg',
        audioPath: 'audio/dracula.mp3',
      ),
    };
  }

  //current index
  int? currentIndex = 0;

  //setting new current Index
  void setCurrentIndex(int index) async {
    currentIndex = index;
    debugPrint("$currentIndex");
    await play();
  }

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //Durations
  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;

  //playback state
  bool isPlaying = false;

  //
  //current playing path
  String? currentPlayingPath;
  Future<void> play() async {
    //set the songs to list
    final song = state.toList();

    if (currentIndex == null || song.isEmpty) {
      debugPrint('There is error in play method');
      return;
    }
    final newPath = song[currentIndex!].audioPath;

    if (currentPlayingPath != newPath) {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(newPath));
      currentPlayingPath = newPath;
    } else {
      await _audioPlayer.resume();
    }
    isPlaying = true;
    ref.notifyListeners();
  }

  //pause
  Future<void> pause() async {
    await _audioPlayer.pause();
    isPlaying = false;
    ref.notifyListeners();
  }

  //play or pause
  Future<void> playOrPause() async {
    if (isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  //seek position
  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next
  Future<void> playNext() async {
    final song = state.toList();
    if (currentIndex == null) {
      debugPrint('Current index in null');
      return;
    }
    currentIndex = (currentIndex! < song.length - 1) ? currentIndex! + 1 : 0;

    await play();
  }

  //play previous song
  Future<void> playPrevious() async {
    if (currentDuration.inSeconds > 2) {
      await seek(Duration.zero);
      return;
    }

    if (currentIndex == null) {
      debugPrint('Current index is currently null');
      return;
    }

    currentIndex = (currentIndex! > 0) ? (currentIndex! - 1) : state.length - 1;

    await play();
  }

  //listen to duration (private, called once in build)

  void listenDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      totalDuration = newDuration; //set new songs duration.
      ref.notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      currentDuration = newPosition; //set new position changed duration.
      ref.notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      playNext(); //on end play next song.
    });
  }
}
