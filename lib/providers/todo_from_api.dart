import 'dart:convert';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'todo_from_api.g.dart';

@riverpod
Future<String> todoFromApi(TodoFromApiRef ref) async {
  final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
  final json = jsonDecode(response.body) as Map;
  return json['todos'][Random().nextInt(28)]['todo']! as String;
}
