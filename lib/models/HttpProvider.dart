import 'package:flaguru/models/Country.dart';
import 'package:http/http.dart';
import 'package:flaguru/models/Report.dart';
import 'package:flaguru/models/UserDetail.dart';

class HttpProvider {
  final _reportURL =
      'https://us-central1-flaguru-35568.cloudfunctions.net/handleReport';
  final _updateURL = '';
  final _userURL = '';

  Future<bool> sendReports(Report reportLogs) async {
    if (reportLogs == null) return false;
    Map<String, String> headers = {"Content-type": "application/json"};
    String JSONbody = reportLogs.toJSON();
    var response = await post(_reportURL, headers: headers, body: JSONbody);
    return response.statusCode == 200;
  }

  Future<List<Country>> getUpdates(DateTime recentUpdateDates) async {
    var response =
        await get('$_updateURL?date=${recentUpdateDates.toString()}');
    return List<Country>();
  }

  Future<bool> updateUserFirebase(UserDetail userDetail) async {
    if (userDetail == null) return false;
    Map<String, String> headers = {"Content-type": "application/json"};
    String JSONbody = userDetail.toJSON();
    var response = await post(_userURL, headers: headers, body: JSONbody);
    return response.statusCode == 200;
  }

  Future<bool> updateUserLocal(Report reportLogs) async {
    if (reportLogs == null) return false;
    Map<String, String> headers = {"Content-type": "application/json"};
    String JSONbody = reportLogs.toJSON();
    var response = await post(_userURL, headers: headers, body: JSONbody);
    return response.statusCode == 200;
  }
}
