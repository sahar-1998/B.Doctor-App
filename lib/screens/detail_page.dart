import 'dart:ui';
import 'package:first_course_project/UserProvider.dart';
import 'package:first_course_project/constants.dart';
import 'package:first_course_project/widgets/bar_widget.dart';
import 'package:first_course_project/widgets/date_and_time.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {


  late TextEditingController _nameTextController;
  late TextEditingController _ageTextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _ageTextController = TextEditingController();

  }

  nameListener(){
    print('current Name : $_nameTextController');
  }

  ageListener(){
    print('current Age : $_ageTextController');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _ageTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBlue,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/main_screen');
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: const Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              decoration: const BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: WidgetBar(),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: _nameTextController,
                // textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // fillColor: kBlue,
                  // filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Enter Your Name',
                ),
                onChanged: (name) {

                  print('First text field: $name');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: TextField(
                controller:  _ageTextController,
                // textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Enter Your Age',
                ),

                onChanged: (age) {
                  print('First text field: $age');
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child:  DateAndTime(),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  primary: kpink,
                ),
                onPressed: () {
                 var name =  _nameTextController.text;
                  Provider.of<NameProvider>(context , listen: false).NameFunction(name);
                  Provider.of<UserProvider>(context , listen: false).addToList(context);
                  // Navigator.pushReplacementNamed(context, '');
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      ' See the Reservations ',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: kBlue),
                    ),
                    IconButton(
                      onPressed: () {
                        if (_nameTextController.text.isNotEmpty &&
                            _ageTextController.text.isNotEmpty) {
                          Navigator.pushReplacementNamed(
                              context, '/reservation_times');
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: kBlue,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class NameProvider extends ChangeNotifier {
  String name = 'Sahar';

  NameFunction(String name) {
    this.name = name;
  }
}


class AgeProvider extends ChangeNotifier {
  String age = '00';

  AgeFunction(String name) {
    this.age = name;
  }
}