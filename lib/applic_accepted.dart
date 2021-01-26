import 'package:flutter/material.dart';
import 'package:medifly/utilities/constants.dart';

class ApplicationSucceed extends StatelessWidget {
  static String id = 'applic';
  final String name;
  final String location;
  final String image;
  final String cost;
  final String docid;
  final List<String> categories;
  ApplicationSucceed({
    // @required
    this.docid,
    @required this.name,
    @required this.categories,
    @required this.cost,
    @required this.location,
    @required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorBlue,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              HospitalNameDisplay(name: name),
              DocIdCostId(docid: docid, cost: cost),
            ],
          ),
        ),
      ),
    );
  }
}

class DocIdCostId extends StatelessWidget {
  const DocIdCostId({
    Key key,
    @required this.docid,
    @required this.cost,
  }) : super(key: key);

  final String docid;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: kCardsColor,
          child: Column(
            children: [
              BiInformationRow(docid: docid, infoName: 'Document ID'),
              BiInformationRow(docid: cost, infoName: 'Cost'),
            ],
          )),
    );
  }
}

class BiInformationRow extends StatelessWidget {
  const BiInformationRow({
    Key key,
    @required this.docid,
    @required this.infoName,
  }) : super(key: key);

  final String docid;
  final String infoName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DisplayTextInApplic(color: Colors.black, title: '$infoName'),
          DisplayTextInApplic(color: Colors.black, title: '->'),
          DisplayTextInApplic(color: Colors.black, title: '$docid'),
        ],
      ),
    );
  }
}

class HospitalNameDisplay extends StatelessWidget {
  const HospitalNameDisplay({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColorBlue,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: DisplayTextInApplic(
            title: name,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DisplayTextInApplic extends StatelessWidget {
  final String title;
  final Color color;

  DisplayTextInApplic({
    Key key,
    @required this.color,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 20.0),
    );
  }
}
