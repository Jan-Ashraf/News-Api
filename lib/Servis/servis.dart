import 'package:dio/dio.dart';
import 'package:api_session/models/todoList.dart';

class TodoApiService {
  final Dio _dio = Dio();

  /// GET Todos
  Future<List<todoModel>> getTodos() async {
    try {
      final response = await _dio.get('https://dummyjson.com/todos?limit= 50');

      Map<String, dynamic> todosJson = response.data;

      List<dynamic> todos = todosJson['todos'];

      List<todoModel> todosList = [];

      for (var todoJson in todos) {
        todosList.add(todoModel.fromJson(todoJson));
      }

      return todosList;
    } catch (e) {
      throw Exception("Failed to load todos: $e");
    }
  }

}