import 'package:http/http.dart' as http;

class HttpHelper {
  Future get({
    required String url,
  }) async {
    try {
      var response = await http.get(Uri.parse(url), headers: {});
      if (response.statusCode == 200) {
        return response;
      } else {
        return response.statusCode;
      }
    } catch (e) {}
  }
}
