import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/components/my_back_button.dart';
import 'package:musicapp/components/neu_box.dart';
import 'package:musicapp/models/playlist_provider.dart';

class SongPage extends ConsumerWidget {
  const SongPage({super.key});

  String _formatDuration(Duration duration) {
    final minute = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minute:$seconds";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(playlistProvider);
    final notifier = ref.read(playlistProvider.notifier);
    final songs = ref.watch(playlistProvider).toList();
    final currentSong = songs[notifier.currentIndex!];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //appbar
          SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //back button
                MyBackButton(onTap: () => Navigator.pop(context)),
                //page title
                Expanded(
                  child: Center(
                    child: Text(
                      'S O N G S  P A G E',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                //menu button
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.menu),
                  ),
                ),
              ],
            ),
          ),
          //album artwork
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //artwork
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: NeuBox(
                    onTap: null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //art work
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(currentSong.albumArtImagePath),
                        ),
                        //song and artist name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song name and artist
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentSong.songName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(currentSong.artistName),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //song and artist name and icon
                  ),
                ),
                const SizedBox(height: 25),

                //song duration box
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //start time
                          Text(_formatDuration(notifier.currentDuration)),

                          //shuffle icon
                          Icon(Icons.shuffle),

                          //repeat icon
                          Icon(Icons.repeat),

                          //end time
                          Text(_formatDuration(notifier.totalDuration)),
                        ],

                        //slider
                      ),
                    ),
                    //song duration progress
                    //slider
                    SliderTheme(
                      data: SliderTheme.of(
                        context,
                      ).copyWith(thumbShape: SliderComponentShape.noThumb),
                      child: Slider(
                        min: 0,
                        max: notifier.totalDuration.inSeconds.toDouble().clamp(
                          1,
                          double.infinity,
                        ),
                        value: notifier.currentDuration.inSeconds
                            .toDouble()
                            .clamp(
                              0,
                              notifier.totalDuration.inSeconds.toDouble(),
                            ),
                        activeColor: Colors.green,
                        onChanged: (value) {
                          notifier.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //playback controls
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      //skip previous
                      Expanded(
                        child: NeuBox(
                          onTap: () {
                            notifier.playPrevious();
                          },
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                      //play / pause
                      Expanded(
                        flex: 2,
                        child: NeuBox(
                          onTap: () {
                            notifier.playOrPause();
                          },
                          child: Icon(
                            notifier.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                        ),
                      ),
                      //skip forward
                      Expanded(
                        child: NeuBox(
                          onTap: () {
                            notifier.playNext();
                          },
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
