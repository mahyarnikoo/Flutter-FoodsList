import 'package:scoped_model/scoped_model.dart';

class Food {
  String group;
  String title;
  String description;
  double price;

  Food(this.group, this.title, this.description, this.price);
}

class FoodModel extends Model {
  static List<Food> _foods = [];

  static void addFood(Food food) {
    _foods.add(food);
  }

  Food getFood(String title) {
    return _foods.firstWhere((food) => food.title == title);
  }

  List<Food> get getFoods {
    return _foods;
  }
}
