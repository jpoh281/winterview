part of 'interview_list_bloc.dart';

@immutable
abstract class InterviewListState extends Equatable {
  @override
  List<Object> get props => [];
}

class InterviewListInitial extends InterviewListState {}

class InterviewListLoading extends InterviewListState {}

class InterviewListLoaded extends InterviewListState {
  InterviewListLoaded({this.interviews});

  final List<InterviewQuestion> interviews;
  @override
  List<Object> get props => [interviews];
}

class InterviewListFailure extends InterviewListState {
  InterviewListFailure({this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
