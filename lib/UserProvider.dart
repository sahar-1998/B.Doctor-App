import 'package:first_course_project/screens/detail_page.dart';
import 'package:first_course_project/uesr.dart';
import 'package:first_course_project/widgets/date_and_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  List<User> user = [];

  addToList(context){
    var name =Provider.of<NameProvider>(context , listen: false).name;
    var time = Provider.of<TimeProvider>(context , listen: false).time;
    print(" $name");
    user.add(User(name:name,time:time));
  }
}