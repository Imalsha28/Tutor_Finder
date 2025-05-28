import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/pages/splash.dart';

import 'package:provider/provider.dart';
import 'package:project_1/providers/language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          LanguageProvider(), // <-- provide LanguageProvider globally
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tutor Finder',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            locale: languageProvider.locale,
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('si', ''), // Sinhala
              Locale('ta', ''), // Tamil
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
