import 'package:qbankwithpdf/components/constants.dart';
import 'package:flutter/material.dart';

class GuideForStudying extends StatefulWidget {
  @override
  _GuideForStudyingState createState() => _GuideForStudyingState();
}

class _GuideForStudyingState extends State<GuideForStudying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kThemeColor,
        ),
        centerTitle: true,
        title: const Text(
          "Guides for Studying",
          style: TextStyle(
              fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
        ),
      ),
    );
  }
}
