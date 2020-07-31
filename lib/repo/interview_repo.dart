import 'dart:io';

import 'package:winterview/models/interview.dart';
import 'package:winterview/provider/interview_api_provider.dart';

class InterviewRepo {
  InterviewApiProvider _apiProvider = InterviewApiProvider();

  Future<List<Interview>> listInterviews() {
    return _apiProvider.listInterviews();
  }
}
