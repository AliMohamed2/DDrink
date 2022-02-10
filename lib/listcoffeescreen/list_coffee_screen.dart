import 'package:drinks/bloc/coffee_bloc.dart';
import 'package:drinks/coffee/coffee.dart';
import 'package:drinks/listcoffeescreen/coffeedetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coffeeheader.dart';
import 'color_under_coffee.dart';
const _initialpage=7.0;
class ListCoffeeScreen extends StatefulWidget {
  const ListCoffeeScreen({Key? key}) : super(key: key);

  @override
  _ListCoffeeScreenState createState() => _ListCoffeeScreenState();
}

class _ListCoffeeScreenState extends State<ListCoffeeScreen> {


 Duration  _duration =Duration(milliseconds: 500);

  Widget build(BuildContext context) {
  final size=MediaQuery.of(context).size;
  final bloc= CoffeeProvider.of(context)!.bloc;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:const BackButton(color: Colors.black,)),
      body: Stack(
       
         children: [

              const ColorUnderCoffee(),
              const Positioned(
                top: 0,
                height: 100,
                left: 0,
                right: 0,
                 child: Header(),

              ),
        ValueListenableBuilder<double>(
            valueListenable: bloc!.currentpage,
            builder: (context,currentpage,_) {
              return
              Transform.scale(scale: 1.6,

                alignment: Alignment.bottomCenter,
             child:  PageView.builder(
                   onPageChanged: (value){
                     if(value<coffees.length){
                     bloc.pageTextController.animateToPage(value, duration: _duration, curve: Curves.easeOut);
                     }

                   },
                    controller: bloc.pagecoffeecontroller,
                    scrollDirection: Axis.vertical,
                    itemCount: coffees.length+1,
                      itemBuilder:(context,index){
                      if(index==0){
                      return   const SizedBox.shrink();
                      }
                      final coffee=coffees[index-1];
                      final result= currentpage-index+1;
                      final value = -0.4*result +1;
                      final opcity=value.clamp(0.0, 1.0);

                      return
                        GestureDetector(
                          onTap: (){
                         Navigator.of(context).push(
                         PageRouteBuilder(
                          transitionDuration:const Duration(milliseconds: 650),
                         pageBuilder: (context,animation,_){

                           return FadeTransition(
                                opacity: animation,
                            child:  CoffeeDetails(coffee: coffee,));


                             }));
                          },
                          child: Padding(
                             padding: const EdgeInsets.only(bottom: 20),
                              child: Transform(
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()..translate(0.0, size.height/2.6*(1-value).abs())..scale(value),

                            child: Opacity(
                              opacity: opcity,
                                child: Hero(
                                  tag: '${coffee.name}',
                                    child: Image.asset('${coffee.image}')))),
    ),
                        );
    } ,)

    );


  } )


         ],
       ),
     
    );
  }
}
