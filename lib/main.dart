import 'package:currency/core/colors.dart';
import 'package:currency/core/strings.dart';
import 'package:currency/doman/repositories/currency_repository_impl.dart';
import 'package:currency/presentation/provider/home_provider.dart';
import 'package:currency/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasources/remote/currency_datasource_impl.dart';
import 'doman/usecases/currency_use_case_impl.dart';

void main() {
  CurrencyUseCaseImpl data =
      CurrencyUseCaseImpl(CurrencyRepositoryImpl(CurrencyDataSourceImpl()));
  runApp(
    // MyApp(),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageViewModel(data)),
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
