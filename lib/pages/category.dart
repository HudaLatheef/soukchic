import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soukchic/pages/collection.dart';
import 'package:soukchic/pages/homepage.dart';
import 'package:soukchic/pages/trends.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class Data {
  final String id;
  final String name;
  final String image;
  final List children;

  Data({
    required this.id,
    required this.name,
    required this.image,
    required this.children,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      children: json['children'],
    );
  }
}

Future<List<Data>> readJsonData() async {
  //read json file
  final jsondata = await rootBundle.loadString('assets/categories.json');
  //decode json data as list
  final list = json.decode(jsondata)["categories"] as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => Data.fromJson(e)).toList();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Data>> futureData;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 110,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SvgPicture.asset(
                  'assets/images/drawer.svg',
                ),
              ),
              SvgPicture.asset(
                'assets/images/search.svg',
              ),
            ],
          ),
        ),
        title: SvgPicture.asset('assets/images/1.svg'),
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            'assets/images/3.svg',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 15),
            child: SvgPicture.asset(
              'assets/images/4.svg',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'Category',
            style: GoogleFonts.alexBrush(
                color: Colors.grey[800],
                fontSize: 20.sp,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: size.height * 0.75,
            child: FutureBuilder<List<Data>>(
              future: readJsonData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as List<Data>;
                  return ListView.builder(
                      padding: const EdgeInsets.only(top: 25),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: Category(items[index].image, items[index].name,
                              items[index].children),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
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
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                    ),
                    Text('Home', style: TextStyle(color: Colors.grey))
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
                    Text(
                      'Category',
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/trends.svg',
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Trends()),
                        );
                      },
                    ),
                    Text(
                      'Trends',
                      style: TextStyle(color: Colors.grey),
                    )
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
  final List<dynamic> childData;

  const Category(this.imagePath, this.text, this.childData);

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
              Image(
                height: 50,
                image: NetworkImage(widget.imagePath),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.text,
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
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
                MaterialPageRoute(
                    builder: (context) => Collection(widget.childData)),
              );
            },
          ),
        ],
      ),
    );
  }
}