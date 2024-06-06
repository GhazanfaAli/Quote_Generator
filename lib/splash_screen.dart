import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:random_quote_generator/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAnimationLoaded = false;
  bool _isTimerFinished = false;

  @override
  void initState() {
    super.initState();
    // Start the timer
    Timer(Duration(seconds: 5), () {
      _isTimerFinished = true;
      _navigateIfReady();
    });
  }

  void _navigateIfReady() {
    if (_isTimerFinished && _isAnimationLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Lottie.network(
              'https://lottie.host/577a7ad6-fc1c-491d-a009-35163abe3f47/bs3gwuLeIm.json',
              onLoaded: (composition) {
                setState(() {
                  _isAnimationLoaded = true;
                });
                _navigateIfReady();
              },

              frameBuilder: (context, child, composition) {
                if (composition == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return child;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
