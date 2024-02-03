import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/bloc/todo/todo_bloc.dart';
import 'package:todo_app/presentation/todo_card.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoadedState) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListView.builder(
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                child: TodoCard(
                  todo: state.todos[index],
                ),
              ),
              itemCount: state.todos.length
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
