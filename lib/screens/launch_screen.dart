import 'package:first_course_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: kBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/launch_svg.svg'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'B.Doctor',
              style: TextStyle(
                  color: kWhite,
                  fontSize: 28,
                  fontFamily: 'BalsamiqSans',
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
