import 'package:first_course_project/UserProvider.dart';
import 'package:first_course_project/screens/about.dart';
import 'package:first_course_project/screens/additional_serv.dart';
import 'package:first_course_project/screens/detail_page.dart';
import 'package:first_course_project/screens/main_screen.dart';
import 'package:first_course_project/screens/reservation_times.dart';
import 'package:first_course_project/widgets/date_and_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/launch_screen.dart';
import 'screens/login_screen.dart';
import 'screens/out_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimeProvider>(
          create: (context) => TimeProvider(),
        ),
        ChangeNotifierProvider<NameProvider>(
          create: (context) => NameProvider(),
        ),
        ChangeNotifierProvider<AgeProvider>(
          create: (context) => AgeProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen': (context) => LaunchScreen(),
          '/out_boarding_screen': (context) => OutBoardingScreen(),
          '/login_screen': (context) => LoginScreen(),
          '/main_screen': (context) => MainScreen(),
          '/detail_page': (context) => DetailPage(),
          '/reservation_times': (context) => ReservationTimes(),
          '/additional_serv': (context) => AdditionalServ(),
          '/about': (context) => About(),
        },
      ),
    );
  }
}
