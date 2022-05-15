import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soukchic/pages/category.dart';
import 'package:soukchic/pages/trends.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 110,
        backgroundColor: Colors.white,
        leading: Padding(padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: const EdgeInsets.only(left: 15),
                child: SvgPicture.asset('assets/images/drawer.svg',), ),
                      SvgPicture.asset('assets/images/search.svg', ), ],
          ),
        ),
        title: SvgPicture.asset( 'assets/images/1.svg'),
        centerTitle: true,
        actions: [ SvgPicture.asset( 'assets/images/3.svg', ),
          Padding( padding: const EdgeInsets.only(left: 25, right: 15),
            child: SvgPicture.asset('assets/images/4.svg',),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Brand ambassedors',
                  style: GoogleFonts.alexBrush(
                      color: Colors.grey[800],
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Ambassedors(
                              'assets/images/011.png', 'Nicole', 'Garcia'),
                          Ambassedors(
                              'assets/images/012.png', 'Chelsen', 'Smith'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Ambassedors(
                              'assets/images/013.png', 'Georgia', 'Wilson'),
                          Ambassedors(
                              'assets/images/014.png', 'Lanze', 'Celot'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Ambassedors(
                              'assets/images/015.png', 'Jenny', 'Miller'),
                          Ambassedors(
                              'assets/images/016.png', 'Riya', 'Jhonson'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/home.svg',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                    ),
                    Text('Home')
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/category.svg',color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Categories()),
                        );
                      },
                    ),
                    Text('Category',style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/trends.svg',color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Trends()),
                        );
                      },
                    ),
                    Text('Trends',style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Ambassedors extends StatefulWidget {
  final String imagePath, text, subtitle;

  const Ambassedors(
    this.imagePath,
    this.text,
    this.subtitle,
  );
  @override
  State<Ambassedors> createState() => _AmbassedorsState();
}

class _AmbassedorsState extends State<Ambassedors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 0.39.sh,
          width: 0.42.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(
                  widget.imagePath,
                ),
                fit: BoxFit.fill,
              )),
        ),
        Column(
          children: [
            Text(
              widget.text,
              style: GoogleFonts.alexBrush(
                  color: Colors.grey[800],
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
        Text(
          widget.subtitle,
          style: GoogleFonts.roboto(
              color: Colors.grey[800],
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
