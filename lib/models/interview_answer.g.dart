// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewAnswer _$InterviewAnswerFromJson(Map<String, dynamic> json) {
  return InterviewAnswer(
    id: json['id'] as String,
    questionId: json['question_id'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$InterviewAnswerToJson(InterviewAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'body': instance.body,
    };
