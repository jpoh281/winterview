import 'package:flutter/material.dart';
import 'package:winterview/models/interview.dart';

class InterviewCard extends StatelessWidget {
  const InterviewCard({Key key, @required this.interview}) : super(key: key);
  final Interview interview;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('뜨거운 질문'),
              SizedBox(width: 8),
              Text('IT'),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          ),
          SizedBox(height: 8),
          Text(
            interview.question,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              Text('#자기소개형'),
              Text('#답정너'),
            ],
            spacing: 16,
            runSpacing: 16,
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.favorite),
                  SizedBox(width: 4),
                  Text('4')
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: <Widget>[
                  Icon(Icons.chat_bubble),
                  SizedBox(width: 4),
                  Text('10')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
