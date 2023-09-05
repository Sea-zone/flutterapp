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
  List<Widget> imageTexts = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'REACH YOUR GOALS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'FASTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Text(
      'Text for Image 2',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'Text for Image 3',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ];
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
      body: Column(children: [
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
                    onTap: () => carouselController.animateToPage(entry.key),
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
              left: 30,
              right: 20,
              child: InkWell(
                onTap: () {
                  print(currentIndex);
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.black.withOpacity(0.7),
                  child: imageTexts[
                      currentIndex], // Display text based on currentIndex
                ),
              ),
            ),
            Positioned(
              bottom: 400,
              left: 30,
              right: 20,
              child: InkWell(
                onTap: () {
                  print(currentIndex);
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.black.withOpacity(0.7),
                  child: imageTexts[
                      currentIndex], // Display text based on currentIndex
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
