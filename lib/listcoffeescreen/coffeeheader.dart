import 'package:drinks/bloc/coffee_bloc.dart';
import 'package:drinks/coffee/coffee.dart';
import 'package:flutter/material.dart';
class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    Duration  _duration =Duration(milliseconds: 500);

    final size=MediaQuery.of(context).size;
    final bloc= CoffeeProvider.of(context)!.bloc;
    return  TweenAnimationBuilder<double>(
      tween:Tween(begin: 1.0,end: 0.0) ,
      builder: (context,value,child){
        return Transform.translate(
            offset: Offset(0.0,-100*value),
            child:child
        );
      },
      duration: const Duration(milliseconds: 600),
      child: ValueListenableBuilder<double>(
        valueListenable: bloc!.textpage,
        builder: (context, textpage,_) {
          return Column(
            children: [
              Expanded(child: PageView.builder(
                  controller:bloc.pageTextController,
                  itemCount: coffees.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    final opacity=(1-(index -textpage).abs()).clamp(0.0, 1.0);
                    return Opacity(
                        opacity:opacity,
                        child: Hero(
                          tag: 'text_${coffees[index].name}',
                          child: Material(

                              child: Text('${coffees[index].name}',textAlign: TextAlign.center,maxLines: 2,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w800),)),
                        ));
                  }
              ),
              ),AnimatedSwitcher(duration: _duration,
                child: Text('\$${coffees[textpage.toInt()].price!.toStringAsFixed(2)}',style: const TextStyle(fontSize: 30),),
                key: Key('${coffees[textpage.toInt()].name}'),
              )
            ],
          );
        }
      ),
    );
  }
}
