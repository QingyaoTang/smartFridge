
import 'package:app/network/dio_manager.dart';
import 'package:app/network/dio_options.dart';

Future getFoodList(data) async {
  String url = "${DioOptions.baseUrl}appservice/food_info/applist";
  Map<String, dynamic> queryParameters = data;
  return await DioManager.instance
      .getRequest(path: url, queryParameters: data);
}

Future addFood(data) async {
  String url = "${DioOptions.baseUrl}appservice/food_info";

  Map<String, dynamic> parameters = data;

  return await DioManager.instance
      .postRequest(path: url, data: parameters);
}

Future editFood(data) async {
  String url = "${DioOptions.baseUrl}appservice/food_info";

  Map<String, dynamic> parameters = data;

  return await DioManager.instance
      .putRequest(path: url, data: parameters);
}


Future delFood(id) async {
  String url = "${DioOptions.baseUrl}appservice/food_info/$id";
  // Map<String, dynamic> parameters = data;
  return await DioManager
      .deleteRequest(path: url);
}