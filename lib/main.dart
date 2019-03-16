import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ScopedModel/food_model.dart';
import 'Pages/foods_list.dart';
import 'Pages/food_home.dart';
import 'Pages/food_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<FoodModel>(
      model: FoodModel(),
      child: MaterialApp(
        title: 'Foods Menu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FoodHome(),
        routes: <String, WidgetBuilder>{

          '/detail' : (BuildContext context) => new FoodDetail(title: "",)

        },
      ),
    );
  }
}
