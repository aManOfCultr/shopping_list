import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:shopping_list/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

Color kBrandColor = Colors.blue;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && dark != null) {
        lightColorScheme = lightDynamic.harmonized()..copyWith();
        darkColorScheme = dark.harmonized();
      } else {
        lightColorScheme = ColorScheme.fromSeed(seedColor: kBrandColor);
        darkColorScheme = ColorScheme.fromSeed(
            seedColor: kBrandColor, brightness: Brightness.dark);
      }

      return MaterialApp(
        title: 'Shopping List',
        theme: ThemeData(
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: lightColorScheme.secondaryContainer,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            backgroundColor: lightColorScheme.secondaryContainer,
            foregroundColor: lightColorScheme.onSecondaryContainer,
          )),
          appBarTheme: AppBarTheme(color: lightColorScheme.secondaryContainer),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.inversePrimary,
            foregroundColor: lightColorScheme.primary,
          )),
          iconTheme: IconThemeData(color: lightColorScheme.onSurface),
        ),

        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          scaffoldBackgroundColor: darkColorScheme.secondaryContainer,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            backgroundColor: darkColorScheme.secondaryContainer,
            foregroundColor: darkColorScheme.onSecondaryContainer,
          )),
          appBarTheme: AppBarTheme(color: darkColorScheme.secondaryContainer),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: darkColorScheme.inversePrimary,
            foregroundColor: darkColorScheme.primary,
          )),
          iconTheme: IconThemeData(color: darkColorScheme.onSurface),
        ),

        themeMode: ThemeMode.system,
        // theme: ThemeData.dark().copyWith(

        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: const Color.fromARGB(255, 147, 229, 250),
        //     brightness: Brightness.dark,
        //     surface: const Color.fromARGB(255, 42, 51, 59),
        //   ),
        //   scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
        // ),
        home: const GroceryList(),
      );
    });
  }
}
