import 'package:flutter/material.dart';
import 'package:musicapp/components/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void onSettings() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Icon(
              Icons.favorite_border,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          //space
          SizedBox(height: 10),
          //home
          MyDrawerTile(
            title: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //settings tile
          MyDrawerTile(
            title: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () => onSettings(),
          ),
        ],
      ),
    );
  }
}
