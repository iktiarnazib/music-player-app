import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/components/my_back_button.dart';
import 'package:musicapp/components/neu_box.dart';
import 'package:musicapp/models/playlist_provider.dart';

class SongPage extends ConsumerWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.read(playlistProvider.notifier).currentIndex;
    final list = ref.read(playlistProvider).toList;
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
                          child: Text("list[index]."),
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
                                      "songName",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text("artistName"),
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
                          Text('0:00'),

                          //shuffle icon
                          Icon(Icons.shuffle),

                          //repeat icon
                          Icon(Icons.repeat),

                          //end time
                          Text('3:00'),
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
                        max: 100,
                        value: 50,
                        activeColor: Colors.green,
                        onChanged: (value) {},
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
                          onTap: () {},
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                      //play / pause
                      Expanded(
                        flex: 2,
                        child: NeuBox(
                          onTap: () {},
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                      //skip forward
                      Expanded(
                        child: NeuBox(
                          onTap: () {},
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
