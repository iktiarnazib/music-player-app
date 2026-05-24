import 'package:flutter/material.dart';
import 'package:musicapp/components/my_back_button.dart';
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              //artwork
              NeuBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //art work
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(albumArtImagePath),
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
                                  songName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(artistName),
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

              //playback controls
            ],
          ),
        ],
      ),
    );
  }
}
