import 'dart:io';

import 'package:winterview/models/interview_question.dart';
import 'package:winterview/provider/interview_api_provider.dart';

class InterviewRepo {
  InterviewApiProvider _apiProvider = InterviewApiProvider();

  Future<List<InterviewQuestion>> listInterviews() {
    return _apiProvider.listInterviews();
  }
}
