import 'package:first_course_project/UserProvider.dart';
import 'package:first_course_project/constants.dart';
import 'package:first_course_project/screens/detail_page.dart';
import 'package:first_course_project/uesr.dart';
import 'package:first_course_project/widgets/date_and_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationTimes extends StatefulWidget {
  const ReservationTimes({Key? key}) : super(key: key);

  @override
  _ReservationTimesState createState() => _ReservationTimesState();
}

class _ReservationTimesState extends State<ReservationTimes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        leading: IconButton(

          onPressed: () {
            Navigator.popAndPushNamed(context, '/detail_page');
          },
          icon: const Icon(Icons.home_filled),
        ) ,
        actions: [

          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/detail_page');
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children:
              Provider.of<UserProvider>(context, listen: false).user.map((e) {
            return ListTile(
              leading: const Icon(Icons.person , color: kBlue,),
              title: Text(
                '${e.time!.hour} : ${e.time!.minute}',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                '${e.name} ',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
