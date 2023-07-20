import 'package:flutter/material.dart';
import 'package:reddit/constant/routes.dart';
import 'package:reddit/module/screens/home/home_screen.dart';

class RedditApp extends StatelessWidget {
  const RedditApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedditApp',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        //color for theme is red
      ),
      home: HomeScreen(),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
