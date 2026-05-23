import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/pages/home_page.dart';
import 'package:musicapp/themes/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.read(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode,
      home: HomePage(),
    );
  }
}
