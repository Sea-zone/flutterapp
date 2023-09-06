import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imagelist = [
    {
      "quote": "Reach your goal\n faster",
      "description":
          "Forge connections, engage deeply,and brands\n digital marketing services",
      "id": 1,
      "image_path": 'images/1.png',
      "bottonText": "request Quote1"
    },
    {
      "quote": "Connect, Engage ,\n succeed",
      "description": "this is description 2",
      "id": 2,
      "image_path": 'images/2.png',
      "bottonText": "request Quote2"
    },
    {
      "quote": "Elevate Customer \n Experience",
      "description": "this is description 3",
      "id": 3,
      "image_path": 'images/3.png',
      "bottonText": "request Quote3"
    },
  ];
<<<<<<< HEAD
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
=======

>>>>>>> development
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
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
        iconTheme: const IconThemeData(color: Colors.black),
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
                // CarouselSlider(
                //   items: imagelist
                //       .map(
                //         (item) => Image.asset(
                //           item['image_path'],
                //           fit: BoxFit.cover,
                //           width: 500,
                //         ),
                //       )
                //       .toList(),
                //   carouselController: carouselController,
                //   options: CarouselOptions(
                //     scrollPhysics: const BouncingScrollPhysics(),
                //     autoPlay: true,
                //     aspectRatio: 0.8,
                //     viewportFraction: 1,
                //     onPageChanged: (index, reason) {
                //       setState(() {
                //         currentIndex = index;
                //       });
                //     },
                //   ),
                // ),

                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: imagelist.map((index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CaroselSliderContents(
                          buttonText: index["bottonText"],
                          description: index["description"],
                          imagePath: index["image_path"],
                          onClick: () {
                            if (kDebugMode) {
                              print("clicked $index");
                            }
                          },
                          quote: index["quote"],
                        );

                        //   Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        //     decoration: const BoxDecoration(
                        //         color: Colors.amber
                        //     ),
                        //     child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                        // );
                      },
                    );
                  }).toList(),
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
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Image.asset(
                'images/seo.png',
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 25.0,
                    right: 370,
                  ), // Adjust left margin as needed
                  height: 30.0,
                  width: 10,
                  color: Colors.red,
                ),
                const Positioned(
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
              margin: const EdgeInsets.only(top: 30),
              child: TextField(
                maxLines: null,
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none, // Remove the border
                ),
                style: const TextStyle(
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

class CaroselSliderContents extends StatelessWidget {
  const CaroselSliderContents({
    required this.buttonText,
    required this.description,
    required this.imagePath,
    required this.onClick,
    required this.quote,
    super.key,
  });

  final String imagePath;
  final String quote;
  final String buttonText;
  final String description;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          width: double.infinity,
          height: 400.0,
          fit: BoxFit.cover,
          image: AssetImage(
            imagePath,
          ),
        ),
        Positioned(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quote,
                style: const TextStyle(
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.yellow,
                ),
              ),
              ElevatedButton(
                  onPressed: onClick,
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ))
      ],
    );
  }
}
