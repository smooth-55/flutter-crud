import 'package:crud/config/api.dart';
import 'package:dio/src/response.dart';

final base_url = "/users/todos";

Future<Response> getTodo() async {
  var res = await dio.get(base_url);
  return res;
}

Future<Response> createTodo(Object? val) async {
  var res = await dio.post(base_url, data: val);
  return res;
}

Future<Response> updateTodo(int id, Object? val) async {
  var res = await dio.put("$base_url/$id", data: val);
  return res;
}