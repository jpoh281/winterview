import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:winterview/blocs/interview_list/interview_list_bloc.dart';
import 'package:winterview/models/interview.dart';
import 'package:winterview/repo/interview_repo.dart';

class SimpleBlocObserver extends BlocObserver {
  Logger logger = Logger(
    printer: PrettyPrinter(
      lineLength: 80,
    ),
  );

  @override
  void onEvent(Bloc bloc, Object event) {
    logger.i('$bloc\n$event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, transition) {
    logger.i(transition);
    super.onTransition(bloc, transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InterviewListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = InterviewListBloc(interviewRepo: InterviewRepo())
      ..add(ListInterviews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIN:terview"),
        actions: <Widget>[
          FlatButton(
            child: Text('리프레시'),
            onPressed: () {
              _bloc.add(RefreshInterviews());
            },
          ),
          FlatButton(
            child: Text('더불러와'),
            onPressed: () {
              _bloc.add(LoadMoreInterviews());
            },
          )
        ],
      ),
      body: BlocConsumer<InterviewListBloc, InterviewListState>(
        cubit: _bloc,
        listener: (context, state) {
          if (state is InterviewListFailure) {
            Get.rawSnackbar(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is InterviewListLoaded) {
            final interviews = state.interviews;
            return ListView.separated(
              itemBuilder: (context, index) {
                final interview = interviews[index];
                return InterviewCard(
                  interview: interview,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
              itemCount: interviews.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}

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
