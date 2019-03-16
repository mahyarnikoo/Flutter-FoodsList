import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '.././ScopedModel/food_model.dart';

class FoodDetail extends StatelessWidget {
  String title;

  FoodDetail({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child:
            ScopedModelDescendant<FoodModel>(builder: (context, child, model) {
          Food _food = model.getFood(title);

          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text(_food.title, style: TextStyle(fontSize: 13),),
                  subtitle: Text(_food.group, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ),
                Text(
                  _food.description,
                  textAlign: TextAlign.justify,
                )
              ],
            )),
          );
        }),
      ),
    );
  }
}
