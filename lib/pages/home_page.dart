import 'package:flutter/material.dart';
import 'package:musicapp/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text('P L A Y L I S T'), centerTitle: true),
      body: Column(children: [

        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
