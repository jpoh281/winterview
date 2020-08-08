import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:winterview/blocs/bloc_observer.dart';

import 'package:winterview/screens/home_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.transparent,
          elevation: 0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black87,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black87),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
