import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow bottom right
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            blurRadius: 15,
            offset: Offset(4, 4),
          ),

          //lighter shadow bottom left
          BoxShadow(
            color: Theme.of(context).colorScheme.tertiary,
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),
        ],
      ),

      child: Padding(padding: const EdgeInsets.all(12.0), child: child),
    );
  }
}
