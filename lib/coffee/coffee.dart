import 'dart:math';

class Coffee{
  String? name;
  String? image;
  double? price;

  Coffee({required this.name,required  this.image,required this.price});

}


double _rangePrice(Random price,num start, num end)=> (price.nextDouble()*(end-start)+price.nextDouble());

final random =Random();
final coffees=List.generate(_names.length, (index) => Coffee(name: _names[index], image: 'images/${index+1}.png', price:_rangePrice(random, 10, 30)));



final _names=[
  'Caramel Macchiato',
  '  Caramel Cold Drink',
  ' Iced Coffe Mocha',
  ' Caramelized Pecan Latte',
  ' Toffee Nut Latte',
  ' Capuchino',
  ' Toffee Nut Iced Latte',
  'Americano',
  'Vietnamese-Style Iced Coffee',
  ' Black Tea Latte',
  ' Classic Irish Coffee',
  'Toffee Nut Crunch Latte'
];
