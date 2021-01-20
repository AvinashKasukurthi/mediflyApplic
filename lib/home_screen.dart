import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:medifly/utilities/cards_data.dart';

import 'package:medifly/utilities/constants.dart';

FirebaseFirestore hospitalRef = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController();
    location = TextEditingController();
    cost = TextEditingController();
    categories = TextEditingController();
    imageLink = TextEditingController();

    super.initState();
  }

  TextEditingController name;
  TextEditingController location;
  TextEditingController cost;
  TextEditingController categories;
  TextEditingController imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColorBlue,
        centerTitle: true,
        title: Text('Application'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: [
          HospitalTextFields(
            hintText: 'Hospital Name',
            controller: name,
          ),
          HospitalTextFields(
            controller: location,
            hintText: 'Location',
          ),
          HospitalTextFields(
            hintText: 'Cost',
            controller: cost,
          ),
          HospitalTextFields(
            controller: categories,
            hintText: 'Categories',
          ),
          HospitalTextFields(
            hintText: 'Image link',
            controller: imageLink,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              elevation: 3.0,
              color: kPrimaryColorBlue,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              onPressed: () {
                FirebaseFirestore.instance.collection('hospital_data').add({
                  'name': name.text,
                  'location': location.text,
                  'cost': cost.text,
                  'categories': categories.text.split(', '),
                  'image': imageLink.text,
                });
              },
            ),
          )
        ],
      )),
    );
  }
}

class HospitalTextFields extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const HospitalTextFields({
    Key key,
    this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: new Border.all(width: 1.0, color: Colors.white),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          fillColor: kCardsColor,
          filled: true,
          labelText: hintText,

          border: InputBorder.none,
          // focusColor: Colors.black,
        ),
      ),
    );
  }
}
