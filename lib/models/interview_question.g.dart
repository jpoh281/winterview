// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewQuestion _$InterviewQuestionFromJson(Map<String, dynamic> json) {
  return InterviewQuestion(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    answerCount: json['answer_count'] as int,
    likeCount: json['like_count'] as int,
  );
}

Map<String, dynamic> _$InterviewQuestionToJson(InterviewQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'answer_count': instance.answerCount,
      'like_count': instance.likeCount,
    };
