import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerWidget {
  final ValueNotifier<bool> themeNotifier;
  const HomePage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Change theme
    void changeTheme() async {
      themeNotifier.value = !themeNotifier.value;
      (await SharedPreferences.getInstance())
          .setBool('theme', themeNotifier.value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Resume"),
        actions: [
          IconButton(
            onPressed: changeTheme,
            icon:
                Icon(themeNotifier.value ? Icons.light_mode : Icons.dark_mode),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
