import 'dart:convert';

import 'package:rahyab/model/CastesModel.dart';
import 'package:rahyab/model/ProviderModel.dart';
import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;

class RequestHelper
{

  static Future<dynamic> makePost(String API) async {
    var res = await Requests.post(API);
    return res.json();
  }

  static Future<dynamic> makeGet(String API) async {
    var res = await Requests.get(API);
    return res.json();
  }

  static Future<List<CastesModel>> makeGetSenf(groupId) async
  {
    List<CastesModel> l = List<CastesModel>();

    try {
      http.Response r = await http
          .get(
          'http://admin.rahyabkish.ir/Castes/API/_getCastes?token=test&group_id=${groupId}');
      if (r.statusCode == 200) {
        Map<String, dynamic> b = jsonDecode(r.body);

        for (var items in b['result']) {
          l.add(CastesModel.fromJson(items));
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return l;
  }


  static Future<List<ProviderModel>> makeGetProvider(castsId) async
  {
    List<ProviderModel> l = List<ProviderModel>();

    try {
      http.Response r = await http
          .get(
          'http://admin.rahyabkish.ir/Providers/API/_getProviders?token=test&caste_id=${castsId}');
      if (r.statusCode == 200) {
        Map<String, dynamic> b = jsonDecode(r.body);

        for (var items in b['result']) {
          l.add(ProviderModel.fromJson(items));
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return l;
  }
}