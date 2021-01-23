import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Container(
          child: Column(
            children: [Text(location), Text(name)],
          ),
        ),
      ),
    );
  }
}
