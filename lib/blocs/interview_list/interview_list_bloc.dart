import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:winterview/models/interview.dart';
import 'package:winterview/repo/interview_repo.dart';

part 'interview_list_event.dart';
part 'interview_list_state.dart';

class InterviewListBloc extends Bloc<InterviewListEvent, InterviewListState> {
  InterviewListBloc({this.interviewRepo})
      : assert(interviewRepo != null),
        super(InterviewListInitial());
  InterviewRepo interviewRepo;

  @override
  Stream<InterviewListState> mapEventToState(
    InterviewListEvent event,
  ) async* {
    if (event is ListInterviews) {
      yield* mapListInterviewsToState();
    }
    if (event is LoadMoreInterviews) {
      yield* mapLoadMoreInterviewsToState(event);
    }
    if (event is RefreshInterviews) {
      yield* mapListInterviewsToState();
    }
  }

  Stream<InterviewListState> mapListInterviewsToState() async* {
    yield InterviewListLoading();
    try {
      final List<Interview> interviews = await interviewRepo.listInterviews();
      yield InterviewListLoaded(interviews: interviews);
    } catch (e) {
      yield InterviewListFailure();
    }
  }

  Stream<InterviewListState> mapLoadMoreInterviewsToState(
      LoadMoreInterviews event) async* {
    if (state is InterviewListLoaded) {
      final currentState = state as InterviewListLoaded;
      try {
        final List<Interview> interviews = await interviewRepo.listInterviews();
        yield InterviewListLoaded(
            interviews: [...currentState.interviews, ...interviews]);
        throw Error();
      } catch (e) {
        yield InterviewListFailure(message: '저만 가지고 이쓸까용 ');
        yield InterviewListLoaded(interviews: currentState.interviews);
      }
    }
  }
}
