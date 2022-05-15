import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soukchic/pages/homepage.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
           designSize: const Size(325, 667),
      builder: (_) => MaterialApp(
        
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: Stack(
            children: const [
              MyHomePage(),
            ],
          ))),
    );
  }
}