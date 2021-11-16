import 'package:flutter/material.dart';

class OutBoardingContent extends StatelessWidget {
  final String image;
  String mainText;
  String subText;

  //final Color pageColor;

  OutBoardingContent({
    required this.image, required this.mainText, required this.subText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // padding: EdgeInsets.symmetric(horizontal: 10)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(height: 10),
        Text(
          mainText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'BalsamiqSans',
            fontWeight: FontWeight.w900,
          ),
        ),
          Text(
          subText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'BalsamiqSans',
          ),
        ),
      ],
    );
  }
}
