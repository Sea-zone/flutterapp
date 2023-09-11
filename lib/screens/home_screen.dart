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
      "bottonText": "request Quote"
    },
    {
      "quote": "Connect, Engage ,\n succeed",
      "description": "this is description 2",
      "id": 2,
      "image_path": 'images/2.png',
      "bottonText": "request Quote"
    },
    {
      "quote": "Elevate Customer \n Experience",
      "description": "this is description 3",
      "id": 3,
      "image_path": 'images/3.png',
      "bottonText": "request Quote"
    },
  ];

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
            MyCustomForm(), //Adding Custom Form
          ],
        ),
      ),
    );
  }
}

//Creating a form widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Add padding to the container
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Colors.grey), // Add border styling
        borderRadius:
            BorderRadius.all(Radius.circular(8.0)), // Add border radius
      ),

      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextFieldWithBox(
              hintText: 'Enter your Name',
              labelText: 'Full Name*',
            ),
            _buildTextFieldWithBox(
              hintText: 'Enter your Email',
              labelText: 'Email*',
            ),
            _buildTextFieldWithBox(
              hintText: 'Enter a phone number',
              labelText: 'Phone*',
            ),
            _buildTextFieldWithBox(
              hintText: 'Enter Your Company Name',
              labelText: 'CompanyName*',
            ),
            _buildTextFieldWithBox(
              hintText: 'Enter Your Website',
              labelText: 'Website*',
            ),
            _buildTextFieldWithBox(
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextFieldWithBox({
  String? hintText,
  String? labelText,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.0),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        contentPadding: EdgeInsets.all(16.0),
      ),
    ),
  );
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
