import 'package:winterview/models/interview.dart';

class InterviewApiProvider {
  Future<List<Interview>> listInterviews() async {
    // String url ='';
    // Response response = await dio.get(url);
    // List<Interview> interviews =  Interview.fromJson(response.data);
    // return interviews;
    return Future.value([
      Interview(id: '1', question: "질문입니다1"),
      Interview(id: '1', question: "질문입니다2"),
      Interview(id: '1', question: "질문입니다3"),
    ]);
  }
}
