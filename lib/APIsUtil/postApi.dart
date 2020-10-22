import 'package:http/http.dart';

class PostApi {
  Future<void> getApi() async {
    try {
     Future<Response> res = post('https://api.edifyin.teamin.in/Employee/', headers: {
        'Content-Type': 'application/json'
      }, body: {
           });
     res.then((value) => null);

    } catch (e) {}
  }
}
