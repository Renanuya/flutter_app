import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/feature/onboarding_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff1B1C24),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
          iconColor: MaterialStateProperty.all(
            const Color(0xff2976EA),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 65, vertical: 18),
          ),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff2976EA),
              ),
              foregroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(15)),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
    );
  }
}
