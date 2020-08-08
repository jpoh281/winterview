import 'package:json_annotation/json_annotation.dart';

part 'interview_answer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class InterviewAnswer {
  InterviewAnswer({
    this.id,
    this.questionId,
    this.body,
  });

  String id;

  /// 인터뷰 질문 ID
  String questionId;

  /// 답변 내용
  String body;

  factory InterviewAnswer.fromJson(Map<String, dynamic> json) =>
      _$InterviewAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewAnswerToJson(this);
}
