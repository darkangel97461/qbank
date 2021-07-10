import 'package:qbankwithpdf/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YearWiseQuestions extends StatefulWidget {
  const YearWiseQuestions({Key? key,
    required this.localstorage,
  }) : super(key: key);
  final SharedPreferences localstorage;
  @override
  _YearWiseQuestionsState createState() => _YearWiseQuestionsState();
}

class _YearWiseQuestionsState extends State<YearWiseQuestions> {
  SelectedChoice selectedChoice = SelectedChoice.yearwise;
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
          "Year-Wise Questions",
          style: TextStyle(
              fontFamily: 'OurFont', fontSize: 22, color: kThemeColor),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: kThemeColor,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        selectedChoice = SelectedChoice.yearwise;
                      });
                    },
                    child: Text(
                      "Year-Wise",
                      style: TextStyle(
                          fontFamily: 'OurFont',
                          color: (selectedChoice == SelectedChoice.yearwise)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        selectedChoice = SelectedChoice.subjectwise;
                      });
                    },
                    child: Text(
                      "Subject-Wise",
                      style: TextStyle(
                          fontFamily: 'OurFont',
                          color: (selectedChoice == SelectedChoice.subjectwise)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          (selectedChoice == SelectedChoice.subjectwise)
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
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
                          : (widget.localstorage.getString('mainYear') ==
                                  '2nd Year')
                              ? Column(
                                  children: [
                                    SubjectContainer(subjectName: 'Pathology'),
                                    SubjectContainer(
                                        subjectName: 'Microbiology'),
                                    SubjectContainer(
                                        subjectName: 'Exercisetherapy'),
                                    SubjectContainer(
                                        subjectName: 'Electrotherapy'),
                                    SubjectContainer(
                                        subjectName: 'Pharmacology'),
                                  ],
                                )
                              : (widget.localstorage.getString('mainYear') ==
                                      '3rd Year')
                                  ? Column(
                                      children: [
                                        SubjectContainer(
                                            subjectName: 'General Medicine'),
                                        SubjectContainer(
                                            subjectName: 'General Surgery'),
                                        SubjectContainer(
                                            subjectName:
                                                'Orthopaedics & Traumatology'),
                                        SubjectContainer(
                                            subjectName:
                                                'Orthopaedics & Sports Physiotherapy'),
                                        SubjectContainer(
                                            subjectName: 'Cardio Respiratory'),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        SubjectContainer(
                                            subjectName:
                                                'Neurology and Neurosurgery'),
                                        SubjectContainer(
                                            subjectName: 'Neurophysiotherapy'),
                                        SubjectContainer(
                                            subjectName: 'Community Medicine'),
                                        SubjectContainer(
                                            subjectName:
                                                'Community Based Rehabilitation'),
                                        SubjectContainer(
                                            subjectName:
                                                'Research Methodology'),
                                        SubjectContainer(
                                            subjectName: 'Biostatistics'),
                                      ],
                                    ),
                    ],
                  ),
                )
              : Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                SubjectContainer(subjectName: '2011 - Supplementary'),
                SubjectContainer(subjectName: '2011 - Mains'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
                SubjectContainer(subjectName: '2012 - Supplementary'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum SelectedChoice {
  yearwise,
  subjectwise,
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
    );
  }
}
