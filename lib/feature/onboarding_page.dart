import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/product/constants/image_constants.dart';
import 'package:flutter_playground/product/language/string_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.sized.dynamicHeight(0.6),
              child: PageView(
                physics: _pageViewPhysics(),
                controller: pageController,
                children: const [
                  _OnBoardingPage(
                      image: ImageConstants.onBoardingImageOne,
                      text: StringConstants.onBoardingTextOne),
                  _OnBoardingPage(
                      image: ImageConstants.onBoardingImageTwo,
                      text: StringConstants.onBoardingTextTwo),
                  _OnBoardingPage(
                      image: ImageConstants.onBoardingImageThree,
                      text: StringConstants.onBoardingTextThree),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.sized.dynamicHeight(0.05)),
              child: Column(
                children: [
                  const _EmptySpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _pageIndicator(pageController),
                    ],
                  ),
                  const _EmptySpace(),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.06),
                    width: context.sized.dynamicWidth(1),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.email),
                      label: const Text(StringConstants.continueEmail),
                    ),
                  ),
                  const _EmptySpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton.outlined(
                          onPressed: () {}, icon: const Icon(Icons.discord)),
                      IconButton.outlined(
                          onPressed: () {}, icon: const Icon(Icons.facebook)),
                    ],
                  ),
                  const _EmptySpace(),
                  const Text(StringConstants.agreeTerms,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BouncingScrollPhysics _pageViewPhysics() {
    return BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.values[1]);
  }

  SmoothPageIndicator _pageIndicator(PageController pageController) {
    return SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: const JumpingDotEffect(
            dotHeight: 8, dotWidth: 8, verticalOffset: 10, spacing: 11.0));
  }
}

class _EmptySpace extends StatelessWidget {
  const _EmptySpace();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.sized.dynamicHeight(0.02));
  }
}

class _OnBoardingPage extends StatelessWidget {
  const _OnBoardingPage({required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(image)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.sized.dynamicHeight(0.05)),
              child: _AnimationText(text: text),
            ),
          ],
        ),
      ],
    );
  }
}

class _AnimationText extends StatelessWidget {
  const _AnimationText({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 10),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.general.textScaleFactor * 40,
            color: Colors.white),
      ),
    );
  }
}
