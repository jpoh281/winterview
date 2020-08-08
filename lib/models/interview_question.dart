import 'package:json_annotation/json_annotation.dart';

part 'interview_question.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class InterviewQuestion {
  InterviewQuestion({
    this.id,
    this.title,
    this.description,
    this.tags,
    this.answerCount,
    this.likeCount,
  });

  /// 인터뷰 질문 코드
  String id;

  /// 인터뷰 질문 제목
  String title;

  /// 인터뷰 질문 설명
  String description;

  /// 인터뷰 태그
  List<String> tags;

  /// 인터뷰에 달린 답변 수
  int answerCount;

  /// 인터뷰에 누른 좋아요 수
  int likeCount;

  factory InterviewQuestion.fromJson(Map<String, dynamic> json) =>
      _$InterviewQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewQuestionToJson(this);
}
