import 'package:http/http.dart' as http;
import 'package:provider_poc/model.dart/user_model.dart';

class UserRepositroy {
  Future<List<UserModel>?> getuserDetail() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var req = http.Request('GET', url);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return userModelFromJson(resBody);
    } else {
      return null;
    }
  }
}
