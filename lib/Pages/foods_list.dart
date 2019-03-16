import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app_test/ScopedModel/food_model.dart';
import './food_detail.dart';

class FoodsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<FoodModel>(builder: (context, child, model) {
        List<Food> list = model.getFoods;

        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final food = list[index];

                    return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white70, shape: BoxShape.rectangle),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodDetail(title: food.title,)));
                              },
                              title: Text(food.title, style: TextStyle(fontSize: 12),),
                              subtitle: Text(food.group, style: TextStyle(fontSize: 12),),
                              leading: Icon(Icons.fastfood),
                              trailing: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Text(food.price.toString() + '\$'),
                              ),
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 5.0,
                            )
                          ],
                        ));
                  }),
            ),
          ],
        );
      }),
    );
  }
}
