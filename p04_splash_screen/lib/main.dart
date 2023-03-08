import 'package:flutter/material.dart';

void main() {
  runApp(
      SplashScreenApp()
  );
}

class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF99231),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/logo.png'),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}