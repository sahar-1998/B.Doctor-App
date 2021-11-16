import 'package:first_course_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: kBlue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/step2.png',
                height: 120,
                width: 120,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('WELCOME HERE'),
                  Text(
                    'Here is the B.Doctor App choices',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
        // child:
      ),
      body: Container(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/detail_page');
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/mm.png'),
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      'Book Appointment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/reservation_times');
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/reserve.png'),
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      'See Appointment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/additional_serv');
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/add.png'),
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      'Additional Services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/about.png'),
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      'About App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
