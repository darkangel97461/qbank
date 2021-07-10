// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:qbankwithpdf/screens/premium.dart';
import 'package:qbankwithpdf/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbankwithpdf/screens/guidesforstudying.dart';
import 'package:qbankwithpdf/screens/notes.dart';
import 'package:qbankwithpdf/screens/physiotherapydictionary.dart';
import 'package:qbankwithpdf/screens/repeatedquestions.dart';
import 'package:qbankwithpdf/screens/signin.dart';
import 'package:qbankwithpdf/screens/signup.dart';
import 'package:qbankwithpdf/screens/syllabus.dart';
import 'package:qbankwithpdf/screens/textbooks.dart';
import 'package:qbankwithpdf/screens/topicwisequestions.dart';
import 'package:qbankwithpdf/screens/yearwisequestions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/constants.dart';

String? mainYear = "";

getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  mainYear = prefs.getString('mainYear') ?? '1';
  print(mainYear);
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        iconTheme: const IconThemeData(
      color: Colors.black,
    )),
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  const HomeScreen({Key? key,
    required this.year,
    this.localstorage,
  }) : super(key: key);
  final String year;
  final SharedPreferences? localstorage;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum SelectedNavigationScreen {
  home,
  profile,
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  SelectedNavigationScreen selectedNavigationScreen =
      SelectedNavigationScreen.home;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F7),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 70,
        child: Row(
          children: [
            (selectedNavigationScreen == SelectedNavigationScreen.home)
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kThemeColor,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedNavigationScreen =
                                  SelectedNavigationScreen.home;
                            });
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: Text(
                                    "Tools",
                                    style: TextStyle(
                                      color: (selectedNavigationScreen ==
                                              SelectedNavigationScreen.home)
                                          ? Colors.white
                                          : Colors.black,
                                      fontFamily: 'OurText',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedNavigationScreen =
                              SelectedNavigationScreen.home;
                        });
                      },
                      child: Center(
                        child: Icon(Icons.settings,
                            color: (selectedNavigationScreen ==
                                    SelectedNavigationScreen.home)
                                ? const Color(0xFF6E4BFF)
                                : Colors.black),
                      ),
                    ),
                  ),
            (selectedNavigationScreen == SelectedNavigationScreen.profile)
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kThemeColor,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedNavigationScreen =
                                  SelectedNavigationScreen.profile;
                            });
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                    top: 6,
                                  ),
                                  child: Text(
                                    "Me",
                                    style: TextStyle(
                                      color: (selectedNavigationScreen ==
                                              SelectedNavigationScreen.profile)
                                          ? Colors.white
                                          : Colors.black,
                                      fontFamily: 'OurFont',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedNavigationScreen =
                              SelectedNavigationScreen.profile;
                        });
                      },
                      child: Center(
                        child: Icon(Icons.person,
                            color: (selectedNavigationScreen ==
                                    SelectedNavigationScreen.profile)
                                ? Color(0xFF6E4BFF)
                                : Colors.black),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      body: (selectedNavigationScreen == SelectedNavigationScreen.home)
          ? ListView(
              children: [
                Container(
                  height: 150,
                  color: const Color(0xFFF2F1F7),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        // shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: kTools.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio:
                              (MediaQuery.of(context).size.height / 400.0),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return SingleTool(
                            toolName: kTools[index]['name'].toString(),
                            color: kTools[index]['color'],
                            textColor: kTools[index]['text'],
                            image: kTools[index]['image'],
                            localstorage: widget.localstorage!,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Container(
              color: Colors.white,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ),
                        );
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: const Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontFamily: 'OurFont',
                                    fontSize: 22,
                                    color: kThemeColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontFamily: 'OurFont',
                                  fontSize: 22,
                                  color: kThemeColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Transform.scale(
                                scale: 1,
                                child: Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: kThemeColor,
                                  activeTrackColor: kThemeColor,
                                  inactiveThumbColor: kThemeColor,
                                  inactiveTrackColor: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PremiumPage(),
                          ),
                        );
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Go Premium',
                                  style: TextStyle(
                                    fontFamily: 'OurFont',
                                    fontSize: 22,
                                    color: kThemeColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 14.0,
                                  bottom: 5,
                                ),
                                child: Image.asset(
                                  'assets/images/premium.png',
                                  width: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Change Academic Year',
                                style: TextStyle(
                                  fontFamily: 'OurFont',
                                  fontSize: 22,
                                  color: kThemeColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(

                                    iconEnabledColor: kThemeColor,
                                    value: widget.localstorage!
                                        .getString('mainYear'),
                                    items: [
                                      const DropdownMenuItem(
                                        child: Text(
                                          "1st Year",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        value: '1st Year',
                                      ),
                                     const DropdownMenuItem(
                                        child: Text(
                                          "2nd Year",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        value: '2nd Year',
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "3rd Year",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        value: '3rd Year',
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "4th Year",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        value: '4th Year',
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        widget.localstorage!
                                            .setString('mainYear', value.toString());
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () async {
                        print(widget.localstorage!.getString('mainYear'));
                      },
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Follow us on Social Media',
                                  style: TextStyle(
                                    fontFamily: 'OurFont',
                                    fontSize: 22,
                                    color: kThemeColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Icon(
                                  Icons.group_add,
                                  color: kThemeColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontFamily: 'OurFont',
                                  fontSize: 22,
                                  color: kThemeColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.assignment,
                                color: kThemeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Share this App',
                                style: TextStyle(
                                  fontFamily: 'OurFont',
                                  fontSize: 22,
                                  color: kThemeColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.share,
                                color: kThemeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'About Us',
                                style: TextStyle(
                                  fontFamily: 'OurFont',
                                  fontSize: 22,
                                  color: kThemeColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.help,
                                color: kThemeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Sign Out',
                                style: TextStyle(
                                  fontFamily: 'OurFont',
                                  fontSize: 22,
                                  color: kThemeColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.exit_to_app,
                                color: kThemeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
      drawer: Drawer(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          bottom: 70,
        ),
        child: FloatingActionButton(
          backgroundColor: kThemeColor,
          child: Center(
            child: Text(
              "10",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Exo',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          onPressed: () {
            print(
              widget.localstorage!.getString('mainYear'),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PremiumPage(),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SingleTool extends StatefulWidget {
  SingleTool({
    required this.toolName,
    required this.color,
    required this.textColor,
    required this.image,
    required this.localstorage,
  });
  final String toolName;
  final LinearGradient color;
  final Color textColor;
  final AssetImage image;
  final SharedPreferences localstorage;
  @override
  _SingleToolState createState() => _SingleToolState();
}

class _SingleToolState extends State<SingleTool> {
bool  checkPlatfrom(){
  if(Platform.isAndroid || Platform.isIOS){
    return true;
  }
  else{
    return false;
  }
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 15,
      ),
      child: Stack(
        children: [
          ClipRRect(


            borderRadius: BorderRadius.circular(20),
            child: Center(
              child: Container(
                             margin: EdgeInsets.only(bottom: 10),
                height: checkPlatfrom()==true?150:120,
                width: Platform.isAndroid || Platform.isIOS ? double.infinity : 500,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,0),
                      color: Colors.black.withOpacity(.8)
                    )
                  ],
                    image: DecorationImage(
                      image: widget.image,
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  onTap: () {
                    if (widget.toolName == "Repeated Questions") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RepeatedQuestions(
                            localstorage: widget.localstorage,
                          ),
                        ),
                      );
                    } else if (widget.toolName == "Year Wise Question Papers") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YearWiseQuestions(
                            localstorage: widget.localstorage,
                          ),
                        ),
                      );
                    } else if (widget.toolName == "Topic Wise Questions") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopicWiseQuestions(
                            localstorage: widget.localstorage,
                          ),
                        ),
                      );
                    } else if (widget.toolName == "Syllabus") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Syllabus(),
                        ),
                      );
                    } else if (widget.toolName == "Textbooks") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TextBooks(),
                        ),
                      );
                    } else if (widget.toolName == "Guide for Studying") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideForStudying(),
                        ),
                      );
                    } else if (widget.toolName == "Notes") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notes(),
                        ),
                      );
                    } else if (widget.toolName == "Physiotherapy Dictionary") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhysioTherapyDictionary(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black26,
                    ),
                    child: Center(
                      child: Text(
                        widget.toolName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: widget.textColor,
                          fontFamily: 'OurFont',
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainMenuContainer extends StatelessWidget {
  const MainMenuContainer({
    required this.mainList,
    required this.i,
  });

  final List<String> mainList;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, mainList[i]);
        },
        child: Material(
          elevation: 1.2,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                mainList[i].toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainSection extends StatefulWidget {
  const MainSection({
    required this.heading,
  });
  final String heading;
  @override
  _MainSectionState createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        title: Text(
          widget.heading.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

List<String> mainList = [
  'repeated questions',
  'year wise questions',
  'topic wise questions',
  'physiotherapy dictionary',
  'textbooks',
  'guide for studying',
  'notes',
  'syllabus'
];

class YearSelection extends StatefulWidget {
  @override
  _YearSelectionState createState() => _YearSelectionState();
}

class _YearSelectionState extends State<YearSelection> {
  late String selectedYear = '';
  late SharedPreferences localStorage;
  Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 80.0,

                    bottom: 60,
                  ),
                  child: Center(
                    child: Text(
                      'Select Year',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 39,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () async {
                      localStorage.setString('mainYear', '1st Year');
                      setState(() {
                        selectedYear = '1st Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            year: selectedYear,
                            localstorage: localStorage,
                          ),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () async {
                      localStorage.setString('mainYear', '2nd Year');
                      setState(() {
                        selectedYear = '2nd Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            localstorage: localStorage,
                            year: selectedYear,
                          ),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      localStorage.setString('mainYear', '3rd Year');
                      setState(() {
                        selectedYear = '3rd Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            localstorage: localStorage,
                            year: selectedYear,
                          ),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      localStorage.setString('mainYear', '4th Year');
                      setState(() {
                        selectedYear = '4th Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            localstorage: localStorage,
                            year: selectedYear,
                          ),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    print(_seen);
    if (_seen) {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => new HomeScreen(
            localstorage: prefs,
            year: mainYear!,
          ),
        ),
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => new YearSelection(),
        ),
      );
    }
  }
      void restrictSize(){
    if(!(Platform.isAndroid || Platform.isIOS))
    DesktopWindow.setMinWindowSize(Size(700,600));
    DesktopWindow.setMaxWindowSize(Size(900,800));
      }
  @override
  void initState() {
    getData();
    restrictSize();
    checkFirstSeen();
    super.initState();
  }

  void afterFirstLayout(BuildContext context) => checkFirstSeen();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}

// CustomScrollView(
// shrinkWrap: false,
// slivers: [
// SliverAppBar(
// leading: Builder(
// builder: (BuildContext context) {
// return MaterialButton(
// child: Image.asset(
// 'assets/images/menu.png',
// color: Colors.white,
// width: 60.0,
// height: 60.0,
// ),
// onPressed: () {
// Scaffold.of(context).openDrawer();
// print(widget.year);
// },
// );
// },
// ),
// flexibleSpace: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// "assets/images/pt.jpg",
// ),
// fit: BoxFit.fill,
// ),
// gradient: LinearGradient(
// colors: [Color(0xff00c6ff), Color(0xff0072ff)],
// ),
// // border: Border.all(color: Colors.black),
// // borderRadius: BorderRadius.only(
// //   bottomLeft: Radius.circular(100),
// //   bottomRight: Radius.circular(100),
// // ),
// ),
// ),
// primary: true,
// centerTitle: true,
// backgroundColor: Color(0xff125D98).withOpacity(.8),
// floating: false,
// stretch: true,
// expandedHeight: 200.00,
// actions: [
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 24,
// child: InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => PremiumPage(),
// ),
// );
// },
// child: Text(
// '10',
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.w600,
// fontSize: 14,
// ),
// ),
// )),
// )
// ],
// title: Text(
// 'PhysX'.toUpperCase(),
// style: TextStyle(
// letterSpacing: 2,
// color: Colors.black.withOpacity(.9),
// fontWeight: FontWeight.w700),
// ),
// elevation: 3.0,
// ),
// SliverGrid.count(
// crossAxisCount: 2,
// childAspectRatio: 1.5,
// children: [
// MainMenuContainer(mainList: mainList, i: 0),
// MainMenuContainer(mainList: mainList, i: 1),
// MainMenuContainer(mainList: mainList, i: 2),
// MainMenuContainer(mainList: mainList, i: 3),
// MainMenuContainer(mainList: mainList, i: 4),
// MainMenuContainer(mainList: mainList, i: 5),
// MainMenuContainer(mainList: mainList, i: 6),
// MainMenuContainer(mainList: mainList, i: 7),
// ],
// ),
// SliverToBoxAdapter(
// child: Column(
// children: [
// SizedBox(
// height: 200,
// ),
// ],
// ),
// ),
// ],
// ),
