import 'package:drinks/bloc/coffee_bloc.dart';
import 'package:flutter/material.dart';

import 'homescreen/homescreen.dart';
import 'listcoffeescreen/list_coffee_screen.dart';
import 'maincoffeesapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home:
      MaincoffeeApp()
    );
  }
}

