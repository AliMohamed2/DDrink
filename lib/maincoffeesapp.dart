import 'package:drinks/bloc/coffee_bloc.dart';
import 'package:drinks/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
class MaincoffeeApp extends StatefulWidget {
  const MaincoffeeApp({Key? key}) : super(key: key);

  @override
  _MaincoffeeAppState createState() => _MaincoffeeAppState();
}

class _MaincoffeeAppState extends State<MaincoffeeApp> {
  final bloc= CoffeeBloc();
  @override
  void initState() {
   bloc.init();
    super.initState();
  }
  @override
  void dispose() {
   bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.light(), child: CoffeeProvider(
      bloc: bloc,
      child: MaterialApp(home: HomeScreen(),
      )
    ));
  }
}
