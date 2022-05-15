import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soukchic/pages/category.dart';
import 'package:soukchic/pages/homepage.dart';
import 'package:soukchic/pages/trends.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text(
          'Clothing Collections',
          style: GoogleFonts.openSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 0.75.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 30,
                      color: Color(0xFFDADADA).withOpacity(0.15),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tops',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              Text('View all'),
                              Icon(Icons.arrow_forward),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Item('assets/images/001.png', 'Jackets'),
                                Item('assets/images/002.png', 'Tank Tops'),
                                Item('assets/images/003.png', 'Halter Tops'),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Item('assets/images/004.png', 'Bodysuits'),
                                Item('assets/images/005.png', 'Sweaters'),
                                Item('assets/images/006.png', 'Rompers'),

                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Item('assets/images/007.png', 'Sweat shirts'),
                              Item('assets/images/008.png', 'Blazers'),
                              Item('assets/images/009.png', 'Waist coats'),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 0.75.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 30,
                      color: Color(0xFFDADADA).withOpacity(0.15),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dresses',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              Text('View all'),
                              Icon(Icons.arrow_forward),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Item('assets/images/001.png', 'Jackets'),
                                Item('assets/images/002.png', 'Tank Tops'),
                                Item('assets/images/003.png', 'Halter Tops'),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Item('assets/images/004.png', 'Bodysuits'),
                                Item('assets/images/005.png', 'Sweaters'),
                                Item('assets/images/006.png', 'Rompers'),

                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Item('assets/images/007.png', 'Sweat shirts'),
                              Item('assets/images/008.png', 'Blazers'),
                              Item('assets/images/009.png', 'Waist coats'),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
                  ],
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

class Item extends StatefulWidget {
 final String imagePath, text;

  const Item(
    this.imagePath,
    this.text,
  );
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.19.sh,
      width: 0.17.sw,
      child: Column(
                                  children: [
                                    Image.asset(widget.imagePath),
                                    Text(widget.text),
                                  ],
                                ),
    );
  }
}
