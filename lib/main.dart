import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume_builder_app/view/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// State to store the theme data
    final isDarkTheme = useState(false);

    useEffect(() {
      SharedPreferences.getInstance()
          .then((value) => isDarkTheme.value = value.getBool('theme') ?? false);

      return null;
    });

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme.value
          ? ThemeData.dark()
          : ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
      home: const HomePage(),
    );
  }
}
