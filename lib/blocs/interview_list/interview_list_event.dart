part of 'interview_list_bloc.dart';

@immutable
abstract class InterviewListEvent {}

/// 인터뷰 목록 가져오는 이벤트 입니다
class ListInterviews extends InterviewListEvent {
  ListInterviews();
}

class LoadMoreInterviews extends InterviewListEvent {}

class RefreshInterviews extends InterviewListEvent {}
