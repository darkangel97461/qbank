import 'package:qbankwithpdf/components/constants.dart';
import 'package:flutter/material.dart';

class TextBooks extends StatefulWidget {
  const TextBooks({Key? key}) : super(key: key);

  @override
  _TextBooksState createState() => _TextBooksState();
}

class _TextBooksState extends State<TextBooks> {
  late String textbookSelectedYear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 80.0,
                right: 100,
                bottom: 60,
                left: 10,
              ),
              child: Text(
                'Which Year Textbook you need?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  fontFamily: 'OurFont',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        textbookSelectedYear = '1st Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainTextBokkScreen(
                            mainTextbookYear: textbookSelectedYear,
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
                        child: const Center(
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
                    onTap: () {
                      setState(() {
                        textbookSelectedYear = '2nd Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainTextBokkScreen(
                            mainTextbookYear: textbookSelectedYear,
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
                        child: const Center(
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
                      setState(() {
                        textbookSelectedYear = '3rd Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainTextBokkScreen(
                            mainTextbookYear: textbookSelectedYear,
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
                        child: const Center(
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
                      setState(() {
                        textbookSelectedYear = '4th Year';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainTextBokkScreen(
                            mainTextbookYear: textbookSelectedYear,
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
                        child: const Center(
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
          ],
        ),
      ),
    );
  }
}

class MainTextBokkScreen extends StatefulWidget {
  final String mainTextbookYear;

  const MainTextBokkScreen({Key? key, required this.mainTextbookYear}) : super(key: key);

  @override
  _MainTextBokkScreenState createState() => _MainTextBokkScreenState();
}

class _MainTextBokkScreenState extends State<MainTextBokkScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget.mainTextbookYear == '1st Year')
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: kThemeColor,
              ),
              centerTitle: true,
              title: const Text(
                "1st Year Textbooks",
                style: TextStyle(
                    fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kThemeColor,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                InkWell(
                  child: SubjectContainer(subjectName: 'Anatomy'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Books(
                            image: Image.asset(
                              'assets/images/tree.webp',
                              height: 200,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            textbookName: 'Anatomy'),
                      ),
                    );
                  },
                ),
                SubjectContainer(subjectName: 'Physiology'),
                SubjectContainer(subjectName: 'Biochemistry'),
                SubjectContainer(subjectName: 'Biomechanics'),
                SubjectContainer(subjectName: 'Psychology'),
                SubjectContainer(subjectName: 'Sociology'),
              ],
            ),
          )
        : (widget.mainTextbookYear == '2nd Year')
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  iconTheme: const IconThemeData(
                    color: kThemeColor,
                  ),
                  centerTitle: true,
                  title: const Text(
                    "2nd Year Textbooks",
                    style: TextStyle(
                        fontFamily: 'OurFont',
                        fontSize: 22,
                        color: kThemeColor),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: kThemeColor,
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                body: ListView(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    SubjectContainer(subjectName: 'Pathology'),
                    SubjectContainer(subjectName: 'Microbiology'),
                    SubjectContainer(subjectName: 'Exercisetherapy'),
                    SubjectContainer(subjectName: 'Electrotherapy'),
                    SubjectContainer(subjectName: 'Pharmacology'),
                  ],
                ),
              )
            : (widget.mainTextbookYear == '3rd Year')
                ? Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      iconTheme: const IconThemeData(
                        color: kThemeColor,
                      ),
                      centerTitle: true,
                      title: const Text(
                        "3rd Year Textbooks",
                        style: TextStyle(
                            fontFamily: 'OurFont',
                            fontSize: 22,
                            color: kThemeColor),
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: kThemeColor,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                    body: ListView(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        SubjectContainer(subjectName: 'General Medicine'),
                        SubjectContainer(subjectName: 'General Surgery'),
                        SubjectContainer(
                            subjectName: 'Orthopaedics & Traumatology'),
                        SubjectContainer(
                            subjectName: 'Orthopaedics & Sports Physiotherapy'),
                        SubjectContainer(subjectName: 'Cardio Respiratory'),
                      ],
                    ),
                  )
                : Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      iconTheme: const IconThemeData(
                        color: kThemeColor,
                      ),
                      centerTitle: true,
                      title: const Text(
                        "4th Year Textbooks",
                        style: TextStyle(
                            fontFamily: 'OurFont',
                            fontSize: 22,
                            color: kThemeColor),
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: kThemeColor,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                    body: ListView(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        SubjectContainer(
                            subjectName: 'Neurology and Neurosurgery'),
                        SubjectContainer(subjectName: 'Neurophysiotherapy'),
                        SubjectContainer(subjectName: 'Community Medicine'),
                        SubjectContainer(
                            subjectName: 'Community Based Rehabilitation'),
                        SubjectContainer(subjectName: 'Research Methodology'),
                        SubjectContainer(subjectName: 'Biostatistics'),
                      ],
                    ),
                  );
  }
}

class SubjectContainer extends StatefulWidget {
  final String subjectName;
  // ignore: prefer_const_constructors_in_immutables
  SubjectContainer({Key? key, required this.subjectName}) : super(key: key);

  @override
  _SubjectContainerState createState() => _SubjectContainerState();
}

class _SubjectContainerState extends State<SubjectContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 23,
            ),
            child: Text(
              widget.subjectName,
              style: const TextStyle(
                fontFamily: 'OurFont',
                fontSize: 22,
                color: kThemeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Books extends StatefulWidget {
  final Image image;
  final String textbookName;

  const Books({Key? key,
    required this.image,
    required this.textbookName,
  }) : super(key: key);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.image,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.textbookName,
                          style: const TextStyle(
                            fontFamily: 'OurFont',
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
      ),
    );
  }
}
