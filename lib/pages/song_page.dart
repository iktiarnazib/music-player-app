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

          //song duration box

          //playback controls
        ],
      ),
    );
  }
}
