import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:winterview/blocs/interview_list/interview_list_bloc.dart';
import 'package:winterview/repo/interview_repo.dart';
import 'package:winterview/screens/screens.dart';
import 'package:winterview/widgets/interview_card.dart';

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
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(AddInterviewQuestionScreen(), fullscreenDialog: true);
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
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
                return InterviewCard(interview: interview);
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
