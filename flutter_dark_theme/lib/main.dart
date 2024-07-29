import 'package:flutter/material.dart';
import 'package:flutter_dark_theme/provider/provider.dart';
import 'package:flutter_dark_theme/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>DarkThemeProvider()..init(),

      child: Consumer<DarkThemeProvider>(
        builder: (context, provider, child) => MaterialApp(
          title: 'Flutter Demo',
          themeMode: provider.isDark?ThemeMode.dark:ThemeMode.light,
          darkTheme: provider.isDark?provider.darkTheme:provider.lightTheme,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(),
        ),
      ),
    );
  }
}


