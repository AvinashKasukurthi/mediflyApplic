import 'package:flutter/material.dart';
import 'package:medifly/category_page.dart';
import 'package:medifly/utilities/categories_data.dart';
import 'package:medifly/utilities/constants.dart';
import 'package:medifly/utilities/department_icons.dart';
import 'package:medifly/utilities/hospitalcard.dart';
import 'package:provider/provider.dart';
import 'package:medifly/utilities/timeslots_data.dart';
import 'package:medifly/utilities/time_info.dart';

enum Days {
  today,
  tomorrow,
}

class BookingScreen extends StatefulWidget {
  final String image;
  final String amount;
  final String location;
  final String hospitalName;
  final List departments;
  final List timeList;
  static String id = 'BookingScreen';
  BookingScreen(
      {Key key,
      @required this.amount,
      @required this.image,
      @required this.location,
      @required this.hospitalName,
      @required this.departments,
      @required this.timeList})
      : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Days selectedDays = Days.tomorrow;

  DateTime dateTime;
  bool category = false;
  bool slot = false;

  @override
  Widget build(BuildContext context) {
    Size sizer = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColorBlue,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          widget.image,
                        ),
                        ListTile(
                          title: Text(
                            widget.hospitalName,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.location}',
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          trailing: Text(
                            '\u{20B9} ${widget.amount}',
                            style: TextStyle(
                              color: kRedButton,
                              fontSize: 25,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesWidget(
                              cardDepartments: widget.departments,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Center(
                          child: Provider.of<CategoryData>(context).clicked
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'images/${departmentIcons[Provider.of<CategoryData>(context).category]}'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        Provider.of<CategoryData>(context)
                                            .category,
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  "Select Category",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kCardsColor,
                        ),
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate:
                                    DateTime.now().add(Duration(days: 1)),
                                firstDate:
                                    DateTime.now().add(Duration(days: 1)),
                                lastDate: DateTime.now().add(Duration(days: 7)))
                            .then((date) {
                          setState(() {
                            dateTime = date;
                            print(dateTime);
                          });
                        });
                      },
                      child: Container(
                        child: Center(
                          child: dateTime == null
                              ? Text(
                                  'Select Date',
                                  style: TextStyle(fontSize: 20.0),
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Booking Date',
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Row(
                                                children: [
                                                  Icon(Icons.today,
                                                      color: kPrimaryColorBlue),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Day: ${dateTime.day}',
                                                        style: TextStyle(
                                                            fontSize: 20.0),
                                                      ),
                                                      Text(
                                                          'Year: ${dateTime.year}'),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Center(
                                              child: Row(
                                                children: [
                                                  Icon(Icons.calendar_today,
                                                      color: kPrimaryColorBlue),
                                                  Text(
                                                    'Month: ${dateTime.month}',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kCardsColor,
                        ),
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Timewidget(
                              hospitalname: widget.hospitalName,
                              timeList: widget.timeList,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Center(
                          child: Provider.of<SlotData>(context).clicked
                              ? Text(
                                  Provider.of<SlotData>(context).slot,
                                  style: TextStyle(fontSize: 20.0),
                                )
                              : Text(
                                  'Select Time',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: kCardsColor,
                        ),
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {},
              color: kRedButton,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Buy Now',
                        style: kMainText.copyWith(
                            color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '₹ ${widget.amount}',
                        style: kMainText.copyWith(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
