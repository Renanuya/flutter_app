import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.sized.height * 0.8,
            child: PageView(
              children: [
                Image.asset('assets/images/nature_computer.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
