import 'package:cardapio_digital_mobile/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardapio digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 59, 223)),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 30,
            )),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
