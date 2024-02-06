import 'package:dangai_riverpod/domain/filter.dart';
import 'package:dangai_riverpod/domain/todo.dart';
import 'package:dangai_riverpod/providers/filter_provider.dart';
import 'package:dangai_riverpod/providers/list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filtered_list_provider.g.dart';

@riverpod
List<Todo> filteredTodos(FilteredTodosRef ref) {
  final List<Todo> todos = ref.watch(todoListProvider);
  final Filter filter = ref.watch(filterSettingProvider);
  switch (filter) {
    case Filter.active:
      return todos.where((todo) => !todo.completed).toList();
    case Filter.completed:
      return todos.where((todo) => todo.completed).toList();
    default:
      return todos;
  }
}
