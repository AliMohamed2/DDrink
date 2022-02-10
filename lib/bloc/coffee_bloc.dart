import 'package:flutter/material.dart';
const _initialpage=8.0;
class CoffeeBloc {
  final pagecoffeecontroller=PageController(
    viewportFraction: .35,
    initialPage: _initialpage.toInt(),
  );
  final pageTextController=PageController(
    initialPage: _initialpage.toInt(),
  );
  final  textpage= ValueNotifier<double> (_initialpage);
  final currentpage= ValueNotifier<double> (_initialpage);
  void _coffeelistiner(){currentpage.value =pagecoffeecontroller.page!;}
  void _textlistener(){textpage.value=pageTextController.page!;}
  void init() {
    pagecoffeecontroller.addListener(_coffeelistiner);
    pageTextController.addListener(_textlistener);

  }
  @override
  void dispose() {
    pagecoffeecontroller.removeListener(_coffeelistiner);
    pageTextController.removeListener(_textlistener);
    pageTextController.dispose();
    pagecoffeecontroller.dispose();
  }


}


class CoffeeProvider extends InheritedWidget{
  final CoffeeBloc? bloc;
  CoffeeProvider({ required this.bloc,required Widget child}):super(child: child);
  static CoffeeProvider? of(BuildContext context)=>context.findAncestorWidgetOfExactType<CoffeeProvider>();
  @override
  bool updateShouldNotify(covariant CoffeeProvider oldWidget) =>false;



}