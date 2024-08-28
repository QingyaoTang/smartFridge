
import 'package:app/network/dio_manager.dart';
import 'package:app/network/dio_options.dart';

Future getFridgeList() async {
  String url = "${DioOptions.baseUrl}appservice/fridge_info/applist";
  // Map<String, dynamic> queryParameters = data;
  return await DioManager.instance
      .getRequest(path: url);
}

Future addFridge(data) async {
  String url = "${DioOptions.baseUrl}appservice/fridge_info";

  Map<String, dynamic> parameters = data;

  return await DioManager.instance
      .postRequest(path: url, data: parameters);
}

Future editFridge(data) async {
  String url = "${DioOptions.baseUrl}appservice/fridge_info";

  Map<String, dynamic> parameters = data;

  return await DioManager.instance
      .putRequest(path: url, data: parameters);
}


Future delFridge(id) async {
  String url = "${DioOptions.baseUrl}appservice/fridge_info/$id";
  // Map<String, dynamic> parameters = data;
  return await DioManager
      .deleteRequest(path: url);
}