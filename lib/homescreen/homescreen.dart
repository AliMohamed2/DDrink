import 'package:drinks/coffee/coffee.dart';
import 'package:drinks/listcoffeescreen/list_coffee_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details){

          if(details.primaryDelta! < -40){
             Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration:const Duration(milliseconds: 650),
                  pageBuilder: (context,animation,_){

                return FadeTransition(

                    opacity: animation,
                child: const ListCoffeeScreen());
              }
              )
             );
          }
        },
        child: Stack(
          children: [
            const SizedBox.expand(
              child:DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffA89276),
                      Colors.white
                    ]
                  )
                ),
              ),
            ),
            Positioned(
                height:size.height*0.2 ,
                bottom: 0,
                left: 0,
                right: 0,
                child: Hero(
                  tag: '${coffees[1].name}',
                  child: Image.asset('${coffees[1].image}',fit: BoxFit.cover,),
                )),
            Positioned(
              height:size.height*0.6 ,
                top: size.height*0.1,
                left: 0,
                right: 0,
                child: Hero(
              tag:'${coffees[6].name}',
              child: Image.asset('${coffees[6].image}'),
            )),


            Positioned(
                height:size.height*0.7 ,

               bottom:-size.height*.1,
                left: 0,
                right: 0,
                 child: Hero(
                  tag: '${coffees[7].name}',
                  child: Image.asset('${coffees[7].image}',fit: BoxFit.cover,),
                )),

             Positioned(
                height:size.height ,
                bottom: -size.height*0.9,
                left: 0,
                right: 0,
                child: Hero(
                  tag: '${coffees[8].name}',
                  child: Image.asset('${coffees[8].image}',fit: BoxFit.cover,),
                )),
            Positioned(
              height: 140,
                left: 0,
                right: 0,
                bottom: size.height*.25,
                child: Image.asset('images/logo.png'))
          ],
        ),
      ),
    );
  }
}


