import 'package:requests/requests.dart';

class RequestHelper{

  static Future<dynamic> makePost(String API) async {
    var res = await Requests.post(API);
    return res.json();
  }

  static Future<dynamic> makeGet(String API) async {
    var res = await Requests.get(API);
    return res.json();
  }
}