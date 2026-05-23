import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/components/my_drawer.dart';
import 'package:musicapp/models/playlist_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final songs = ref.read(playlistProvider).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text('P L A Y L I S T'), centerTitle: true),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(songs[index].artistName),
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
    );
  }
}
