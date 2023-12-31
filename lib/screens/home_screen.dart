import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'carosel_slider_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController; // Define _tabController as nullable
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

  @override
  void initState() {
    super.initState();

    // Initialize _tabController with the correct length and vsync
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of _tabController if it's not null
    _tabController?.dispose();
    super.dispose();
  }

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
            const MyCustomForm(), //Adding Custom Form
            const SizedBox(
                height:
                    15.0), // Adding space between the form and the container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                color: Colors.blueGrey.shade50,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center children horizontally
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center children horizontally
                    children: [
                      Container(
                        height: 30.0,
                        width: 10,
                        color: Colors.red,
                      ),
                      const SizedBox(
                          width: 10), // Add space between container and text
                      const Text(
                        'What We Do ?',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // Add space between lines
                  const Text(
                    'we prioritize customer satisfaction, timely delivery, and exceeding expectations',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Card(
                      margin: EdgeInsets.all(25),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'Search Engine Optimization',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3, // Add elevation for a shadow effect
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        title: const SizedBox(
                          width: 300,
                          height: 100,
                          child:
                              Center(child: Text('Search Engine Optimiation')),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.red,
              controller: _tabController,
              tabs: const [
                Tab(text: "Project"),
                Tab(text: "Momo"),
                Tab(text: "Pizza")
              ],
            ),

            SizedBox(
              height: 600.0,
              child: TabBarView(controller: _tabController, children: const [
                Column(
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ],
                ),
                Text("there"),
                Text("here"),
              ]),
            ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

// Creating a Card
class OutlinedCard extends StatelessWidget {
  const OutlinedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Creating a form widget
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyNameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  List<String> dropdownItems = ["Premium", "Standard", "Basic"];

  String selectedDropdownValue = 'Premium';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Add padding to the container
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Colors.grey), // Add border styling
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.blueGrey.shade50,
        // Add border radius
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            // Set your desired background color here
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            alignment: Alignment.center,
            height: 70.0,
            // Adjust padding as needed
            child: const Text(
              'Request a Quote',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // You can also set the text color
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextFieldWithBox(
                    hintText: 'Enter your Name',
                    labelText: 'Full Name*',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Name';
                      }
                      return null;
                    },
                  ),
                  _buildTextFieldWithBox(
                    hintText: 'Enter your Email',
                    labelText: 'Email*',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Email';
                      }
                      return null;
                    },
                  ),
                  _buildTextFieldWithBox(
                    hintText: 'Enter a phone number',
                    labelText: 'Phone*',
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Phone Number';
                      }
                      return null;
                    },
                  ),
                  _buildTextFieldWithBox(
                    hintText: 'Enter Your Company Name',
                    labelText: 'CompanyName*',
                    controller: _companyNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Company Name';
                      }
                      return null;
                    },
                  ),
                  _buildTextFieldWithBox(
                    hintText: 'Enter Your Website',
                    labelText: 'Website*',
                    controller: _websiteController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Website';
                      }
                      return null;
                    },
                  ),

                  // Add the DropdownButtonFormField
                  DropdownButtonFormField<String>(
                    value: selectedDropdownValue,
                    onChanged: (value) {
                      setState(() {
                        selectedDropdownValue = value!;
                      });
                    },
                    items: dropdownItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item, // Make sure each item has a unique value
                        child: Text(item),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Select an option',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(400, 60)),
                      ),
                      child:
                          Text('Submit here', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // All form fields are valid, you can submit the data
      // Access the form field values using the controller
      String name = _nameController.text;
      String email = _emailController.text;
      String phone = _phoneController.text;
      String companyName = _companyNameController.text;
      String website = _websiteController.text;

      // You can handle the form submission here, e.g., send data to a server
      // or perform any required actions
      print('Name: $name');
      print('Email: $email');
      print('Phone: $phone');
      print('Company Name: $companyName');
      print('Website: $website');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }
}

Widget _buildTextFieldWithBox({
  String? hintText,
  String? labelText,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(16.0),
      ),
      validator: validator,
    ),
  );
}
