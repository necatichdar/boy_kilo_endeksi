import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, 'home_screen');
    });
  }

  String imgUrl =
      "https://images.pexels.com/photos/1552101/pexels-photo-1552101.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        imgUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
