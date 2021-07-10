import 'package:qbankwithpdf/components/constants.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
          "Notes",
          style: TextStyle(
              fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kThemeColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
