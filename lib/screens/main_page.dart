import 'dart:math';

import 'package:dangai_riverpod/domain/filter.dart';
import 'package:dangai_riverpod/domain/todo.dart';
import 'package:dangai_riverpod/providers/filter_provider.dart';
import 'package:dangai_riverpod/providers/filtered_list_provider.dart';
import 'package:dangai_riverpod/providers/list_provider.dart';
import 'package:dangai_riverpod/providers/todo_from_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoAsync = ref.watch(todoFromApiProvider);
    final List<Todo> filteredList = ref.watch(filteredTodosProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main'),
        ),
        body: Column(
          children: [
            todoAsync.when(
              skipLoadingOnRefresh: false,
              data: (todo) {
                return Text(todo);
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
            TextButton(
                onPressed: () {
                  ref.invalidate(todoFromApiProvider);
                },
                child: const Text("Reload")),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(todoListProvider.notifier).add();
                },
                child: const Text("Add")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(filterSettingProvider.notifier)
                        .setFilter(Filter.all);
                  },
                  child: const Text('All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(filterSettingProvider.notifier)
                        .setFilter(Filter.active);
                  },
                  child: const Text('Active'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(filterSettingProvider.notifier)
                        .setFilter(Filter.completed);
                  },
                  child: const Text('Completed'),
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final todo = filteredList[index];
                return ListTile(
                  title: Text(todo.description),
                  subtitle: Text(todo.completed ? 'Completed' : 'Active'),
                );
              },
            )
          ],
        ));
  }
}
