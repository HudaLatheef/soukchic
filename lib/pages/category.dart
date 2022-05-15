import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soukchic/pages/collection.dart';
import 'package:soukchic/pages/homepage.dart';
import 'package:soukchic/pages/trends.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Category',
                    style: GoogleFonts.alexBrush(
                        color: Colors.grey[800],
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    children: [
                      Category('assets/images/111.png', 'Clothing Collections', ),
                      Category('assets/images/112.png', 'Hair Care Collections', ),
                      Category('assets/images/113.png', 'Accessory Collections', ),
                      Category('assets/images/114.png', 'Skin Care Collections', ),
                      Category('assets/images/115.png', 'Meke Up Collections', ),
                      Category('assets/images/111.png', 'Clothing Collections', ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ) ,
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
                        'assets/images/home.svg',color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                    ),
                    Text('Home',style: TextStyle(color: Colors.grey))
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/category.svg',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Categories()),
                        );
                      },
                    ),
                    Text('Category',)
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
class Category extends StatefulWidget {
  final String imagePath, text;

  const Category(
    this.imagePath,
    this.text,
  );

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                widget.imagePath,
                          ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(widget.text,style: GoogleFonts.openSans(fontSize: 14.sp,fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                            IconButton(
                          icon: SvgPicture.asset(
                            'assets/images/arrow.svg',
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Collection()),
                            );
                          },
                        ),
                          ],
                        ),
    );
  }
}