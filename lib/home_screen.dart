import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medifly/applic_accepted.dart';
import 'package:medifly/utilities/constants.dart';
import 'package:medifly/utilities/get_single_field_firebase.dart';

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
            HospitalTextFields(hintText: 'Hospital Name', controller: name),
            HospitalTextFields(hintText: 'Location', controller: location),
            HospitalTextFields(hintText: 'Cost', controller: cost),
            HospitalTextFields(hintText: 'Categories', controller: categories),
            HospitalTextFields(hintText: 'Image link', controller: imageLink),
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
                onPressed: () async {
                  int hospitalID = await updateAndGetIdFromFirebase();
                  redirectToApplicPage(context, hospitalID);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<int> updateAndGetIdFromFirebase() async {
    int hospitalID = await getIdFromFirebase();
    await incrementFirebaseIdField(hospitalID);
    addDataToFirebaseHospitals(hospitalID);
    return hospitalID;
  }

  Future<int> getIdFromFirebase() async {
    int hospitalID =
        await FieldAccess.getSingleField('id', 'hospitalId', 'id_generator');
    return hospitalID;
  }

  Future incrementFirebaseIdField(int hospitalID) async {
    await FirebaseFirestore.instance
        .collection('id_generator')
        .doc('hospitalId')
        .update({
      'id': hospitalID + 1,
    });
  }

  void addDataToFirebaseHospitals(int hospitalID) {
    FirebaseFirestore.instance
        .collection('hospital_data')
        .doc('Mdfly$hospitalID')
        .set({
      'name': name.text,
      'location': location.text,
      'cost': cost.text,
      'categories': categories.text.split(', '),
      'image': imageLink.text,
      'password': 'Mdfly$hospitalID',
    });
  }

  void redirectToApplicPage(BuildContext context, int hospitalID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplicationSucceed(
          docid: 'Mdfly$hospitalID',
          categories: categories.text.split(', '),
          cost: cost.text,
          image: imageLink.text,
          location: location.text,
          name: name.text,
        ),
      ),
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
