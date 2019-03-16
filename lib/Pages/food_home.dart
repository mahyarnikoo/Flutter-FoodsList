import 'package:flutter/material.dart';
import 'foods_list.dart';
import './food_create.dart';
import './foods_list.dart';

class FoodHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Foods Menu'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'Create new food',
              ),
              Tab(
                text: 'Show foods list',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[FoodCreate(), FoodsList()],
        ),
      ),
    );
  }
}
