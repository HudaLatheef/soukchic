import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soukchic/pages/category.dart';
import 'package:soukchic/pages/homepage.dart';
import 'package:soukchic/pages/trends.dart';

class Collection extends StatefulWidget {
  final List<dynamic> childData;

  const Collection(this.childData);

  @override
  State<Collection> createState() => _CollectionState();
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

class _CollectionState extends State<Collection> {
  Future<List<Data>> loadData() async {
    final list = widget.childData;
    return list.map((e) => Data.fromJson(e)).toList();
  }

  Future<List<dynamic>> loadChildData(childData) async {
    final list = childData.children;
    return list.map((e) => Data.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Clothing Collections',
          style: GoogleFonts.openSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Data>>(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data as List<Data>;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      margin: const EdgeInsets.only(top: 12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items[index].name,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'view all',
                                    ),
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/images/arrow.svg',
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: size.height * 0.5,
                            child: FutureBuilder<List<dynamic>>(
                              future: loadChildData(items[index]),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var products = snapshot.data as List<dynamic>;
                                  return GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: products.length >= 9
                                          ? 9
                                          : products.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Item(products[index].image,
                                            products[index].name);
                                      });
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ),
                        ],
                      ));
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
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
    return SizedBox(
      height: 0.19.sh,
      width: 0.17.sw,
      child: Column(
        children: [
          Image(
            height: 100,
            image: NetworkImage(widget.imagePath),
          ),
          Text(
            widget.text,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
