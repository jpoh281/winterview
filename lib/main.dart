import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIN:terview"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return InterviewCard();
        },
        separatorBuilder: (context, index) {
          return Divider();
          // return SizedBox(height: 8);
        },
        itemCount: 1,
      ),
    );
  }
}

class InterviewCard extends StatelessWidget {
  const InterviewCard({Key key}) : super(key: key);

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
            '팀 프로젝트를 할 때 의사소통에 문제가 있으면 어떻게 해결할 것인가?',
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
