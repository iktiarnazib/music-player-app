import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/themes/dark_mode.dart';
import 'package:musicapp/themes/light_mode.dart';
import 'package:musicapp/themes/theme_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  void themeToggle(bool isDark) {
    if (isDark) {
      //toggle from dark to light
      ref.read(themeProvider.notifier).state = lightMode;
    } else {
      //toggle to dark
      ref.read(themeProvider.notifier).state = darkMode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.read(themeProvider) == darkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text('S E T T I N G S', overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //switch for darkmode or light mode
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.secondary,
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: isDark,
                onChanged: (value) => themeToggle(isDark),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
