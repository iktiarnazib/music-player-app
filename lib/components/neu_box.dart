import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //bottom right shadow
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
            blurRadius: 15,
            offset: Offset(4, 4), //bottom right
          ),

          //top left shadow
          BoxShadow(
            color: Theme.of(context).colorScheme.tertiary,
            blurRadius: 15,
            offset: Offset(-4, -4), //top left
          ),
        ],
      ),

      child: Padding(padding: const EdgeInsets.all(12.0), child: child),
    );
  }
}
