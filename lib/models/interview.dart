import 'package:json_annotation/json_annotation.dart';

part 'interview.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Interview {
  Interview({this.id, this.question});

  String id;
  String question;

  factory Interview.fromJson(Map<String, dynamic> json) =>
      _$InterviewFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewToJson(this);
}
