import 'package:first_course_project/widgets/out_boarding_content.dart';
import 'package:first_course_project/widgets/out_boarding_indicator.dart';
import 'package:flutter/material.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentPage < 2,
              replacement: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login_screen'),
                child: const Text(
                  'START',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A5CD0),
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () => _pageController.animateToPage(2,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut),
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A5CD0),
                  ),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 0,
              maxWidth: double.infinity,
              minHeight: 0,
              maxHeight: 500,
            ),
            child: PageView(
              controller: _pageController,
              // scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
                print('Current Page: $value');
              },
              children: [
                OutBoardingContent(
                  image: 'assets/step1.png',
                  mainText: 'Welcome to B.Doctor App',
                  subText:
                      'Access Your Doctor Any time, Any Where and book your appointment immediately',
                ),
                OutBoardingContent(
                  image: 'assets/step2.png',
                  mainText: 'Welcome to B.Doctor App',
                  subText:
                      'Access Your Doctor Any time, Any Where and book your appointment immediately',
                ),
                OutBoardingContent(
                  image: 'assets/step3.png',
                  mainText: 'Welcome to B.Doctor App',
                  subText:
                      'Access Your Doctor Any time, Any Where and book your appointment immediately',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: _currentPage == 0 ? Colors.grey : Colors.black,
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                color: _currentPage == 2 ? Colors.grey : Colors.black,
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              out_boarding_indicator(
                marginEnd: 10,
                selected: _currentPage == 0,
              ),
              out_boarding_indicator(
                marginEnd: 10,
                selected: _currentPage == 1,
              ),
              out_boarding_indicator(
                selected: _currentPage == 2,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: _currentPage == 2,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  primary: const Color(0xFF4A5CD0),
                ),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login_screen'),
                child: const Text('START'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
