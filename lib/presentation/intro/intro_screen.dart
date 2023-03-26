import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mausam/config/color_constant.dart';
import 'package:mausam/presentation/home/home_screen.dart';
import 'package:mausam/presentation/shared_components/sf_pro_text.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/weather.png",
              height: 200,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            const SFProText(
              text: "Discover the weather of your city.",
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            SFProText(
              text: "Get to know weather forecast of any city in this world.",
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.maxFinite,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => route.isCurrent);
                },
                child: const SFProText(
                  text: "Get Started",
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
