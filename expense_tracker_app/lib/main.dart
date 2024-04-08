import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.greenAccent);
var kColorDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, // ColorScheme.fromseedはデフォルトでlightに最適化されている
  seedColor: const Color.fromARGB(255, 20, 123, 152),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kColorDarkScheme,
      cardTheme: CardTheme(
          color: kColorDarkScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorDarkScheme.primaryContainer),
      ),
    ),
    theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 65, 197, 171),
            foregroundColor: Color.fromARGB(255, 255, 255, 255)),
        cardTheme: CardTheme(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: // titleLargeはappBarテキストに反映される
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 16))),
    // themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
