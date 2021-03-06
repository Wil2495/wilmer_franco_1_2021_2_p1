import 'package:app_dogs/app/ui/breed/controller/conection.dart';
import 'package:app_dogs/app/ui/breed/view/breed_view.dart';
import 'package:app_dogs/app/ui/breed/controller/controller_breed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BreedController>(
              create: (_) => BreedController()),
          ChangeNotifierProvider<ConnectionController>(
              create: (_) => ConnectionController()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'App Dogs',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: BreedView()));
  }
}
