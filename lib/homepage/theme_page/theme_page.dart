import 'package:assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Theme"),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: const Text("Dark Theme"),
            trailing: Switch(
              value: isDarkTheme,
              onChanged: (value) {
                ref.read(themeProvider.notifier).state = value;
                final settingsBox = Hive.box('settings');
                settingsBox.put('isDarkTheme', value);
              },
            ),
          ),
        ),
      ),
    );
  }
}
