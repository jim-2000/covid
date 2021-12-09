import 'package:covid/services/covidQuestion.dart';
import 'package:covid/widgets/questionCard.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isExpanded = true;
  bool isExpanded2 = true;
  bool isExpanded3 = true;
  bool isExpanded4 = true;
  bool isExpanded5 = true;
  bool isExpanded6 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID N-E-W-S"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          QuestionCard(
            questions: Covid.Question1,
            ans: Covid.Ans1,
            isExpanded: isExpanded,
            backgroucls: Color(0xff6F12E8),
          ),
          //
          QuestionCard(
            questions: Covid.Question2,
            ans: Covid.Ans2,
            isExpanded: isExpanded2,
            backgroucls: Color(0xffFF5050),
          ), //
          QuestionCard(
            questions: Covid.Question3,
            ans: Covid.Ans3,
            isExpanded: isExpanded3,
            backgroucls: Color(0xFFCF12E8),
          ),
          //
          QuestionCard(
            questions: Covid.Question4,
            ans: Covid.Ans4,
            isExpanded: isExpanded4,
            backgroucls: Color(0xFF2CE955),
          ), //
          //
          QuestionCard(
            questions: Covid.Question5,
            ans: Covid.Ans5,
            isExpanded: isExpanded5,
            backgroucls: Color(0xFF2CE3E9),
          ),
        ],
      ),
    );
  }
}
