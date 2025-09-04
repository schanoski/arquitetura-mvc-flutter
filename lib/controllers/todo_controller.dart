import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';

final todoServiceProvider = Provider<TodoService>((ref) => TodoService());

final todoProvider = FutureProvider.family<TodoModel, int>((ref, id) async {
  final service = ref.watch(todoServiceProvider);
  return service.fetchTodo(id);
});
