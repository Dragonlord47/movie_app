import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieApp1/models/data_model.dart';
import 'package:movieApp1/operations/request_operations.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  DataModel data = null;
  @override
  void initState() {
    super.initState();
    RequestOperations request = new RequestOperations();
    request.getHourlyData();
    request.getWeather().then((response) {
      setState(() {
        data = response;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: RaisedButton(
              color: Colors.white,
              padding: EdgeInsets.all(
                  3), // sets space between the child and the raised button
              elevation: 3, // sets shadow level
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.short_text, color: Colors.black),
              onPressed: () {}),
        ),
        title: Container(
          margin: EdgeInsets.all(10),
          child: RaisedButton(
              color: Colors.white,
              padding: EdgeInsets.all(
                  3), // sets space between the raised button and the the child
              elevation: 3, // set shadow level
              shape: CircleBorder(), // gives raised button circle shape
              child: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {}),
        ),
        actions: [
          Container(
            width: 45,
            margin: EdgeInsets.all(
                10), // sets left, right, top and bottom margin to 10 pixels
            child: Container(
              decoration: BoxDecoration(
                // for styling container appearance
                borderRadius: BorderRadius.circular(
                    10), // to give the container curved edges
                color: Colors.lightBlue[200],
              ),
              child: Image.asset('assets/images/user.png'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //gives equal spacing between widgets, depending on the avialable space
                children: [
                  Column(
                    // first widget in the row
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // all widgets will be displayed on the left
                    children: [
                      Text(
                        'LAGOS,',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'NIGERIA',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          'Sunday, 27 Sep',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    // second widget in the row
                    'assets/images/map.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  // first widget in the stack
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0,
                        0), // leave a margin of 30 pixels from the top before rendering the child widget
                    child: Card(
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // gives the card curved edges
                      ),
                      child: Container(
                        width: double
                            .infinity, // occupy all available space horizontally
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[200],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Align(
                    // second widget in the stack
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .start, // elements are placed from the top
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // elements are placed to the left
                      children: [
                        // first element in the column
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // first element in the row
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 30),
                              child: Image.asset(
                                'assets/images/thunderstom.png',
                                height: 150,
                              ),
                            ),
                            // second element in the row
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 40, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data != null
                                        ? data.main.temperature.toString() +
                                            '°F'
                                        : '--',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Feels like ${data != null ? data.main.feelsLike.toString() + '°F' : '--'}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        // second element in the column
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Text(
                            data != null
                                ? data.weather.first.description.toString()
                                : '--',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // third element in the column
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Text(
                            data != null ? data.weather.first.main : '--',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),

              // holds 3 weather widget
              Container(
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // spaces the weather containers evenly
                  children: [
                    Column(
                      // code for a single weather width, containing image and text
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Image.asset('assets/images/thunderstom.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '28%',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Image.asset('assets/images/sunny.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '8km/h',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Image.asset('assets/images/night.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '64%',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Next 7 Days >',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis
                    .horizontal, // makes widget scrollable from left to right
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('12:00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    'assets/images/sunny.png',
                                    width: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('23°'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.purple[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('02:00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    'assets/images/sunny.png',
                                    width: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('23°'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('04:00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    'assets/images/sunny.png',
                                    width: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('23°'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('04:00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    'assets/images/sunny.png',
                                    width: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('23°'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('04:00'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    'assets/images/sunny.png',
                                    width: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('23°'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
