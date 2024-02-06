import 'package:dangai_riverpod/domain/todo.dart';
import 'package:dangai_riverpod/providers/todo_from_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [];
  }

  Future<void> add() async {
    final todo = await ref.watch(todoFromApiProvider.future);
    state = [...state, Todo(description: todo)];
  }

  void remove(Todo todo) {
    state = state.where((element) => element != todo).toList();
  }
}
