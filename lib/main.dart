import 'package:currency/core/colors.dart';
import 'package:currency/core/strings.dart';
import 'package:currency/presentation/provider/data_class.dart';
import 'package:currency/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // MyApp(),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataClass()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appBarTitle,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: appBarColor,
            elevation: 0,
          ),
          primarySwatch: Colors.blue,
          backgroundColor: backgroundColor),
      home: const HomeScreen(),
    );
  }
}
