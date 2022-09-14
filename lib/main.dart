import 'package:flutter/material.dart';
import 'package:practice_api/page/copy_page.dart';
import 'package:practice_api/page/home_page.dart';
import 'package:practice_api/provider/person_provider.dart';
import 'package:practice_api/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'page/new_home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PersonProvider()),
    ChangeNotifierProvider(create: (context) => UsersProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
