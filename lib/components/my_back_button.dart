import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  final Function() onTap;
  const MyBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
