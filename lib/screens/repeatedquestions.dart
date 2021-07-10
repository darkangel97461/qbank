import 'package:flutter/material.dart';
import 'package:qbankwithpdf/components/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepeatedQuestions extends StatefulWidget {
  const RepeatedQuestions({
    Key? key,
    required this.localstorage,
  }) : super(key: key);
  final SharedPreferences localstorage;
  @override
  _RepeatedQuestionsState createState() => _RepeatedQuestionsState();
}

class _RepeatedQuestionsState extends State<RepeatedQuestions> {
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
          "Repeated Questions",
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
                onChanged: (value) {},
              ),
            ),
          ),
          (widget.localstorage.getString('mainYear') == '1st Year')
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubjectContainer(subjectName: 'Anatomy'),
                    SubjectContainer(subjectName: 'Physiology'),
                    SubjectContainer(subjectName: 'Biochemistry'),
                    SubjectContainer(subjectName: 'Biomechanics'),
                    SubjectContainer(subjectName: 'Psychology'),
                    SubjectContainer(subjectName: 'Sociology'),
                  ],
                )
              : (widget.localstorage.getString('mainYear') == '2nd Year')
                  ? Column(
                      children: [
                        SubjectContainer(subjectName: 'Pathology'),
                        SubjectContainer(subjectName: 'Microbiology'),
                        SubjectContainer(subjectName: 'Exercisetherapy'),
                        SubjectContainer(subjectName: 'Electrotherapy'),
                        SubjectContainer(subjectName: 'Pharmacology'),
                      ],
                    )
                  : (widget.localstorage.getString('mainYear') == '3rd Year')
                      ? Column(
                          children: [
                            SubjectContainer(subjectName: 'General Medicine'),
                            SubjectContainer(subjectName: 'General Surgery'),
                            SubjectContainer(
                                subjectName: 'Orthopaedics & Traumatology'),
                            SubjectContainer(
                                subjectName:
                                    'Orthopaedics & Sports Physiotherapy'),
                            SubjectContainer(subjectName: 'Cardio Respiratory'),
                          ],
                        )
                      : Column(
                          children: [
                            SubjectContainer(
                                subjectName: 'Neurology and Neurosurgery'),
                            SubjectContainer(subjectName: 'Neurophysiotherapy'),
                            SubjectContainer(subjectName: 'Community Medicine'),
                            SubjectContainer(
                                subjectName: 'Community Based Rehabilitation'),
                            SubjectContainer(
                                subjectName: 'Research Methodology'),
                            SubjectContainer(subjectName: 'Biostatistics'),
                          ],
                        ),
        ],
      ),
    );
  }
}

class SubjectContainer extends StatefulWidget {
  SubjectContainer({Key? key, required this.subjectName}) : super(key: key);
  final String subjectName;
  @override
  _SubjectContainerState createState() => _SubjectContainerState();
}

class _SubjectContainerState extends State<SubjectContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionsPage(
                subjectName: widget.subjectName,
              ),
            ),
          );
        },
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
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
      ),
    );
  }
}

class QuestionsPage extends StatefulWidget {
  final String subjectName;

  QuestionsPage({
    required this.subjectName,
  });

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
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
        title: SingleChildScrollView(
          child: Text(
            "${widget.subjectName} - Repeated Questions",
            style: TextStyle(
                fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
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
                  onChanged: (value) {},
                ),
              ),
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              // shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: kQuestions.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: (MediaQuery.of(context).size.height / 200.0),
              ),
              itemBuilder: (BuildContext context, int index) {
                return SingleQuestion(
                  questionName: kQuestions[index]['question'].toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SingleQuestion extends StatefulWidget {
  final String questionName;

  SingleQuestion({
    required this.questionName,
  });

  @override
  _SingleQuestionState createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: MaterialButton(
              child: Text(
                widget.questionName,
                style: TextStyle(fontFamily: 'QuickSand'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleQuestionContentScreen(
                      questionName: widget.questionName,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class SingleQuestionContentScreen extends StatefulWidget {
  final String questionName;

  SingleQuestionContentScreen({required this.questionName});

  @override
  _SingleQuestionContentScreenState createState() =>
      _SingleQuestionContentScreenState();
}

class _SingleQuestionContentScreenState
    extends State<SingleQuestionContentScreen> {
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
        title: SingleChildScrollView(
          child: Text(
            "",
            style: TextStyle(
                fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Q : ${widget.questionName}",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                fontFamily: 'QuickSand',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 70,
                    child: Center(
                      child: Text(
                        "How many years repeated ?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          fontFamily: 'QuickSand',
                          color: kThemeColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: 'QuickSand',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 70,
                    child: Center(
                      child: Text(
                        "Which all years repeated ?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          fontFamily: 'QuickSand',
                          color: kThemeColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2011 (S)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: 'QuickSand',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2011 (M)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: 'QuickSand',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2012 (S)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: 'QuickSand',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2012 (M)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: 'QuickSand',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2013 (S)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: 'QuickSand',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 70,
                    child: Center(
                      child: Text(
                        "Answers on Textbook",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          fontFamily: 'QuickSand',
                          color: kThemeColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Name of the Textbook :",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Edition :",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Page No :",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'QuickSand',
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
        ],
      ),
    );
  }
}
