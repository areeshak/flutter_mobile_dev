import 'package:http/http.dart' as http;

                                                          //link input --> http call --> return response (single responsibility)
class NetworkCall {
  static get(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body;
  }
}