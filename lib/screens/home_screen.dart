import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imagelist = [
    {"id": 1, "image_path": 'images/1.png'},
    {"id": 2, "image_path": 'images/2.png'},
    {"id": 3, "image_path": 'images/3.png'},
  ];
  // List<Widget> imageTexts = [
  //   // Image 1
  //   Positioned(
  //     top: 300, // Adjust the top position for the first Text widget
  //     left: 20, // Adjust the left position for the first Text widget
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'REACH YOUR GOALS',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 32.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         Text(
  //           'We provide business and brands',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 32.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         Text(
  //           'Another line of text',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 24.0,
  //             fontWeight: FontWeight.normal,
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  //   Positioned(
  //     top: 70, // Adjust the top position for the second Text widget
  //     left: 20, // Adjust the left position for the second Text widget
  //     child: Text(
  //       'We provide business and brands',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 32.0,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   ),
  //   Positioned(
  //     top: 120, // Adjust the top position for the third Text widget
  //     left: 20, // Adjust the left position for the third Text widget
  //     child: Text(
  //       'Another line of text',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 24.0, // Adjust font size as needed
  //         fontWeight: FontWeight.normal, // Adjust font weight as needed
  //       ),
  //     ),
  //   ),

  //   // Image 2
  //   Positioned(
  //     top: 220, // Adjust the top position as needed
  //     left: 20, // Adjust the left position as needed
  //     child: Text(
  //       'Text for Image 2',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 32.0,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   ),

  //   // Image 3
  //   Positioned(
  //     top: 300, // Adjust the top position as needed
  //     left: 20, // Adjust the left position as needed
  //     child: Text(
  //       'Text for Image 3',
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 32.0,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   ),
  // ];
  final _formKey = GlobalKey<FormState>();
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Pricing',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Privacy policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Contact',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 75,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(children: [
          Image.asset(
            "images/logo.png",
            width: 180,
            height: 100,
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: imagelist
                      .map(
                        (item) => Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: 500,
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 0.8,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagelist.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  bottom: 400,
                  right: 10,
                  left: 50,
                  child: Container(
                    width: 400,
                    // color: Colors.black54,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'REACH YOUR GOALS',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 300,
                  right: 10,
                  left: 50,
                  child: Container(
                    width: 400,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Image.asset(
                'images/seo.png',
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 25.0, right: 370), // Adjust left margin as needed
                  height: 30.0,
                  width: 10,
                  color: Colors.red,
                ),
                Positioned(
                  left: 20.0, // Adjust the left position as needed
                  top: 30.0, // Adjust the top position as needed
                  child: Text(
                    'MARKETING FOR EVERY ONE',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: TextField(
                maxLines: null,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove the border
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
                controller: TextEditingController(
                  text:
                      'Worldwide we help businesses gain more leads and brands awareness by reassessing and improving their online presence. We provide unique web design combined with an extensive Search engine optimization, online advertising, and content strategy to ensure business growth.',
                ),
              ),
            ),
            Container(
              child: Form(
                key: _formKey,
                // color: Colors.black;
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'FullName *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Name';
                      }
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
