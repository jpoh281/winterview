import 'package:winterview/models/interview_question.dart';

class InterviewApiProvider {
  Future<List<InterviewQuestion>> listInterviews() async {
    // String url ='';
    // Response response = await dio.get(url);
    // List<Interview> interviews =  Interview.fromJson(response.data);
    // return interviews;
    return Future.value([
      InterviewQuestion(
        id: 'q-1',
        title: "질문입니다1",
        description: '',
        tags: [],
        likeCount: 0,
        answerCount: 0,
      ),
    ]);
  }
}
