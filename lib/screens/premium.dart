import 'package:qbankwithpdf/components/constants.dart';
import 'package:flutter/material.dart';

class PremiumPage extends StatefulWidget {
  @override
  _PremiumPageState createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kThemeColor,
        ),
        centerTitle: true,
        title: const Text(
          "Go Premium",
          style: TextStyle(
              fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
        ),
      ),
    );
  }
}
