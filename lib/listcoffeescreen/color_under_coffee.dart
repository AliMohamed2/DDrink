import 'package:flutter/material.dart';

class ColorUnderCoffee extends StatelessWidget {
  const ColorUnderCoffee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Positioned(
        left: 20,
        right: 20,
        bottom: -size.height*0.2,
        height: size.height*0.3,

   child:const DecoratedBox(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow:[
            BoxShadow(
              color: Colors.brown,
              blurRadius: 90,
              spreadRadius:45 ,
              offset: Offset.zero,

            )
          ]
      ),
    ));
  }
}
