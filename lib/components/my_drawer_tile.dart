import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const MyDrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Icon(
          icon,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(title, overflow: TextOverflow.ellipsis),
    );
  }
}
