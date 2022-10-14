import 'package:http/http.dart' as http;

abstract class IHttpService {
  Future<http.Response> get({required String url});
}

class HttpService extends IHttpService {
  @override
  Future<http.Response> get({required String url}) async {
    var response = await http.get(Uri.parse(url));
    return response;
  }
}
