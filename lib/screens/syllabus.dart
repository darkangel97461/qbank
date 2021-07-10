import 'package:qbankwithpdf/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:qbankwithpdf/screens/pdfscreen.dart';

class Syllabus extends StatefulWidget {
  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  String url =
      "https://firebasestorage.googleapis.com/v0/b/qb-app-2037b.appspot.com/o/BPT%204.5%20All%20years%20(1).pdf?alt=media&token=2c74b73e-2f1c-4dc2-979c-9f79d6227eec";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kThemeColor,
        ),
        centerTitle: true,
        title: Text(
          "Syllabus",
          style: TextStyle(
              fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
        ),
      ),
      body: PdfScreen(url: url),
    );
  }
}
