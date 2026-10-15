import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow[600],
        scaffoldBackgroundColor: Colors.yellow[200],

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[600],
          elevation: 0,
        ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow[600],
        ),

        dialogTheme: DialogThemeData(
          backgroundColor: Colors.yellow[300],
        ),
      ),
      home: const HomePage(),
    );
  }
}
