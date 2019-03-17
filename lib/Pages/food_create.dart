import 'package:flutter/material.dart';
import '.././ScopedModel/food_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class FoodCreate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FoodCreate();
  }
}

class _FoodCreate extends State<FoodCreate> {
  final _group = TextEditingController();
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  FocusNode titleTextFormField = new FocusNode();
  FocusNode descriptionTextForField = new FocusNode();
  FocusNode priceTextFormField = FocusNode();

  @override
  void dispose() {
    _group.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ListView(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: TextFormField(
                  controller: _group,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      icon: Icon(Icons.group),
                      hintText: 'Group',
                      hintStyle: TextStyle(fontSize: 11, letterSpacing: 1)),
                  onSaved: (String value) {},
                  onFieldSubmitted: (String value) {
                    FocusScope.of(context).requestFocus(titleTextFormField);
                  },
                  validator: (value) {
                    return value.isEmpty ? 'Please enter the group' : null;
                  },
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: TextFormField(
                  controller: _title,
                  focusNode: titleTextFormField,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      icon: Icon(Icons.title),
                      hintText: 'Food title',
                      hintStyle: TextStyle(
                        fontSize: 11.0,
                        letterSpacing: 1,
                      )),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context)
                        .requestFocus(descriptionTextForField);
                  },
                  validator: (String value) {
                    return value.isEmpty ? 'Please enter the title' : null;
                  },
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: TextFormField(
                  controller: _description,
                  focusNode: descriptionTextForField,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        fontSize: 11.0,
                        letterSpacing: 1,
                      )),
                  onFieldSubmitted: (value) {
                    descriptionTextForField.unfocus();
                    FocusScope.of(context).requestFocus(priceTextFormField);
                  },
                  validator: (String value) {
                    return value.isEmpty
                        ? 'Please enter the description'
                        : null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: TextFormField(
                  controller: _price,
                  focusNode: priceTextFormField,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(Icons.ac_unit),
                      hintText: 'Price',
                      hintStyle: TextStyle(letterSpacing: 1, fontSize: 11)),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) {
                    _createFood();
                  },
                  validator: (String value) {
                    return value.isEmpty ? 'Please enter the perice' : null;
                  },
                ),
              ),
              Container(
                width: 200,
                child: RaisedButton(
                  child: Text('Create'),
                  shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    _createFood();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createFood() {
    if (_formKey.currentState.validate()) {
      Food food = Food(_group.value.text, _title.value.text,
          _description.value.text, double.parse(_price.text));
      FoodModel.addFood(food);

      _group.clear();
      _title.clear();
      _description.clear();
      _price.clear();

      Fluttertoast.showToast(
        msg: 'The food has been created successfully',
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 12,
      );
    }
  }
}
