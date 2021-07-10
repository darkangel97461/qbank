import 'package:flutter/material.dart';

const kThemeColor = Color(0xFFFF616D);

const kSearchInputDecoration = InputDecoration(
  isDense: true,
  filled: true,
  fillColor: Colors.white,
  hintText: "🔍   Search Keywords",
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 18,
    fontFamily: 'OurFont',
  ),
  contentPadding: EdgeInsets.only(
    top: 20.0,
    left: 10.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);

List<dynamic> kTools = [
  {
    "name": "Repeated Questions",
    "color": LinearGradient(colors: [
      Color(0xFFEB70AE),
      Color(0xFFF479B8),
    ]),
    "text": Colors.white,
    'image': AssetImage('assets/images/rpd.jpg'),
  },
  {
    "name": "Year Wise Question Papers",
    "color": LinearGradient(colors: [
      Color(0xFF6E4AFB),
      Color(0xFF6E4BFF),
    ]),
    "text": Colors.white,
    'image': AssetImage('assets/images/year.jpg'),
  },
  {
    "name": "Topic Wise Questions",
    "color": LinearGradient(colors: [Color(0xFFFEE5A7), Color(0xFFFFE4A7)]),
    "text": Colors.white,
    'image': AssetImage('assets/images/topic.jpg'),
  },
  {
    "name": "Syllabus",
    "color": LinearGradient(colors: [Color(0xFFB58AE4), Color(0xFFB58AE4)]),
    "text": Colors.white,
    'image': AssetImage('assets/images/syllabus.jpg'),
  },
  {
    "name": "Textbooks",
    "color": LinearGradient(colors: [Color(0xFFDBADA0), Color(0xFFDBADA0)]),
    "text": Colors.white,
    'image': AssetImage('assets/images/textbook.jpg'),
  },
  {
    "name": "Guide for Studying",
    "color": LinearGradient(colors: [Color(0xFFB1528B), Color(0xFFB1528B)]),
    "text": Colors.white,
    'image': AssetImage('assets/images/guide1.jpg'),
  },
  {
    "name": "Notes",
    "color": LinearGradient(colors: [Color(0xFFFAC35C), Color(0xFFFAC35C)]),
    "text": Colors.white,
    'image': AssetImage('assets/images/notes.jpg'),
  },
  {
    "name": "Physiotherapy Dictionary",
    "color": LinearGradient(colors: [Color(0xFFDFA1A4), Color(0xFFDFA1A4)]),
    "text": Colors.white,
    'image': AssetImage('assets/images/dictionary.jpg'),
  },
];

List<dynamic> kQuestions = [
  {
    "question": "What is Body temperature? How it can be measured? What is the normal range of it?",
  },
  {
    "question": "Question No. 2",
  },
  {
    "question": "Question No. 3",
  },
  {
    "question": "Question No. 4",
  },
  {
    "question": "Question No. 5",
  },
];


const kUserInputDecoration = InputDecoration(
  isDense: true,
  filled: true,
  fillColor: Colors.white,
  hintText: "Enter Username...",
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 18,
  ),
  contentPadding: EdgeInsets.only(
    top: 20.0,
    left: 10.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kPasswordInputDecoration = InputDecoration(
  isDense: true,
  filled: true,
  fillColor: Colors.white,
  hintText: "Enter Password...",
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 18,
  ),
  contentPadding: EdgeInsets.only(
    top: 20.0,
    left: 10.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);


const kConfirmPasswordInputDecoration = InputDecoration(
  isDense: true,
  filled: true,
  fillColor: Colors.white,
  hintText: "Confirm Password...",
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 18,
  ),
  contentPadding: EdgeInsets.only(
    top: 20.0,
    left: 10.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);
