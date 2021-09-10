import 'package:flutter/material.dart';
import 'package:password_generator/screens/main_screen.dart';
import 'package:password_generator/utils/pass_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<PassProvider>(
      create: (context) => PassProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff050f2e),
          scaffoldBackgroundColor: Color(0xff050f2e),
        ),
        home: Scaffold(
          body: PassGen(),
        ));
  }
}
