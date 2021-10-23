import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Dogs',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const Text("Inicio de app"));
  }
}
