import 'package:assignment/custom_theme/custom_theme.dart';
import 'package:assignment/homepage/homepage.dart';
import 'package:assignment/homepage/model/hive_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final themeProvider = StateProvider<bool>((ref) {
  final settingsBox = Hive.box('settings');
  return settingsBox.get('isDarkTheme', defaultValue: false) as bool;
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<HiveData>(HiveDataAdapter());
  await Hive.openBox<HiveData>("openBox");
    await Hive.openBox('settings');

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
       theme: isDarkTheme ? CustomTheme.darkTheme() : CustomTheme.lightTheme(),

        home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}