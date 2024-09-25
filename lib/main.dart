import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Models/providers/dark_mode_provider.dart';
import 'package:to_do/Models/providers/language_provider.dart';
import 'package:to_do/Models/providers/task_provider.dart';
import 'package:to_do/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(
            create: (context) => TaskProvider()..getTasks()),
        ChangeNotifierProvider<DarkModeProvider>(
            create: (context) => DarkModeProvider()..getMode()),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider()..getLanguage(),
        ),
      ],
      child:
          Consumer<DarkModeProvider>(builder: (context, darkModeConsumer, _) {
        return Consumer<LanguageProvider>(
            builder: (context, languageConsumer, _) {
          return MaterialApp(
            locale: Locale(languageConsumer.language ?? "en"),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar'), // Arabic
              Locale('en'), // English
              Locale('es'), // Spanish
            ],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              dividerTheme: DividerThemeData(
                color: darkModeConsumer.isDark ? Colors.white : Colors.black26,
              ),
              tabBarTheme: TabBarTheme(
                  labelColor:
                      darkModeConsumer.isDark ? Colors.white : Colors.blueGrey),
              appBarTheme: const AppBarTheme(
                  centerTitle: true, backgroundColor: Colors.blue),
              drawerTheme: DrawerThemeData(
                  backgroundColor:
                      darkModeConsumer.isDark ? Colors.black : Colors.white),
              scaffoldBackgroundColor:
                  darkModeConsumer.isDark ? Colors.black : Colors.white,
              textTheme: GoogleFonts.cairoTextTheme(),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: false,
            ),
            home: const HomeScreen(),
          );
        });
      }),
    );
  }
}
