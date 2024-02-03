import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/bloc/todo/todo_bloc.dart';
import 'package:todo_app/domain/database_services.dart';
import 'package:todo_app/presentation/new_todo_card.dart';
import 'package:todo_app/presentation/todo_list_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodoBloc(RepositoryProvider.of<DatabaseServices>(context))
              ..add(LoadTodosEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: const Column(
          children: [
            Expanded(
              child: TodoListView(),
            ),
            NewTodoCard(),
          ],
        ),
      ),
    );
  }
}
