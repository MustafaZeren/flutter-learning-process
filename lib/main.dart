import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn_project/101/list_view_builder.dart';
import 'package:flutter_learn_project/101/list_view_learn.dart';
import 'package:flutter_learn_project/101/navigation_learn.dart';
import 'package:flutter_learn_project/demos/color_demos_view.dart';
import 'package:flutter_learn_project/demos/color_life_cycle_view.dart';
import 'package:flutter_learn_project/demos/my_collections_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          tabBarTheme: const TabBarTheme(
            unselectedLabelColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          bottomAppBarTheme:
              const BottomAppBarTheme(shape: CircularNotchedRectangle()),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white),
          listTileTheme:
              const ListTileThemeData(contentPadding: EdgeInsets.zero),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          textSelectionTheme: const TextSelectionThemeData(
              selectionColor: Colors.red,
              cursorColor: Colors.green,
              selectionHandleColor: Colors.black),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              iconColor: Colors.red,
              labelStyle: TextStyle(color: Colors.lime),
              border: OutlineInputBorder(),
              floatingLabelStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.red)),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      home: const NavigationLearn(),
    );
  }
}
