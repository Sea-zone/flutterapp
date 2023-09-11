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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();

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
      padding: EdgeInsets.all(16.0), // Add padding to the container
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Colors.grey), // Add border styling
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.blueGrey.shade50,
        // Add border radius
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red, // Set your desired background color here
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            height: 70.0, // Adjust padding as needed
            child: Text(
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
                    decoration: InputDecoration(
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
