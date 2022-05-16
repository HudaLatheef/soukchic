import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soukchic/pages/category.dart';
import 'package:soukchic/pages/trends.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Data>> fetchData() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)["data"];
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Data(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar']);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<Data>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Data>? data = snapshot.data;
            return GridView.builder(
              padding: const EdgeInsets.only(top: 25),
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Ambassedors(data![index].avatar, data[index].firstName,
                    data[index].lastName);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
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
                        'assets/images/category.svg',
                        color: Colors.grey,
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
                      style: TextStyle(color: Colors.grey),
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Image(
            image: NetworkImage(widget.imagePath),
          ),
        ),
        CachedNetworkImage(
          imageUrl: widget.imagePath,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Column(
          children: [
            SizedBox(
              height: 5,
            ),
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
