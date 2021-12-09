// ignore: file_names
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard(
      {Key? key,
      required this.questions,
      required this.ans,
      required this.isExpanded,
      required this.backgroucls})
      : super(key: key);
  String questions;
  String ans;
  bool isExpanded;
  Color backgroucls;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.isExpanded = !widget.isExpanded;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          horizontal: widget.isExpanded ? 25 : 0,
          vertical: 20,
        ),
        padding: EdgeInsets.all(20),
        height: widget.isExpanded ? 70 : 330,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1200),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: widget.backgroucls.withOpacity(0.5),
              blurRadius: 20,
              offset: Offset(5, 10),
            ),
          ],
          color: widget.backgroucls,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.isExpanded ? 20 : 0),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.questions,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Icon(
                    widget.isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 27,
                  ),
                ],
              ),
              widget.isExpanded ? SizedBox() : SizedBox(height: 20),
              AnimatedCrossFade(
                firstChild: Text(
                  '',
                  style: TextStyle(
                    fontSize: 0,
                  ),
                ),
                secondChild: Text(
                  widget.ans,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.7,
                  ),
                ),
                crossFadeState: widget.isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 1200),
                reverseDuration: Duration.zero,
                sizeCurve: Curves.fastLinearToSlowEaseIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
