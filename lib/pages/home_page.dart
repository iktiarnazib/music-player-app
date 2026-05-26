import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/components/my_drawer.dart';
import 'package:musicapp/models/playlist_provider.dart';
import 'package:musicapp/pages/song_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final songs = ref.watch(playlistProvider).toList();
    final notifier = ref.watch(playlistProvider.notifier);
    final index = notifier.currentIndex;
    final playing = notifier.isPlaying;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text('P L A Y L I S T'), centerTitle: true),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SongPage()),
              );
              ref.read(playlistProvider.notifier).setCurrentIndex(index);
            },
            title: Text(songs[index].songName),
            subtitle: Text(songs[index].artistName),
            leading: Image.asset(
              songs[index].albumArtImagePath,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      bottomNavigationBar: (index != null || songs.isNotEmpty)
          ? GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SongPage()),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 70,
                margin: EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      child: Image.asset(songs[index!].albumArtImagePath),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Now playing...',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              songs[index].songName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(songs[index].artistName),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        notifier.playPrevious();
                      },
                      icon: Icon(Icons.skip_previous),
                    ),
                    IconButton(
                      onPressed: () {
                        notifier.playOrPause();
                      },
                      icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                    ),

                    IconButton(
                      onPressed: () => notifier.playNext(),
                      icon: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
