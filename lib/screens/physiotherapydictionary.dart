import 'package:qbankwithpdf/components/constants.dart';
import 'package:flutter/material.dart';

class PhysioTherapyDictionary extends StatefulWidget {
  @override
  _PhysioTherapyDictionaryState createState() =>
      _PhysioTherapyDictionaryState();
}

class _PhysioTherapyDictionaryState extends State<PhysioTherapyDictionary> {
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
          "Physiotherapy Dictionary",
          style: TextStyle(
              fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              elevation: 2,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: TextField(
                style: const TextStyle(
                  height: 1.2,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                decoration: kSearchInputDecoration,
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
