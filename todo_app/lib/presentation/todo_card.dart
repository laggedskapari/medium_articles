import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/todo.dart';
import 'package:todo_app/domain/bloc/todo/todo_bloc.dart';


class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    double initialOffset = 0.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.double_arrow,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return GestureDetector(
                onHorizontalDragStart: (DragStartDetails details) {
                  initialOffset = details.globalPosition.dx;
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  if (details.globalPosition.dx - initialOffset > 100 &&
                      !todo.isCompleted) {
                    BlocProvider.of<TodoBloc>(context)
                        .add(CompleteTodoEvent(todoId: todo.todoId));
                  }
                },
                onDoubleTap: () {
                  BlocProvider.of<TodoBloc>(context)
                      .add(DeleteTodoEvent(todoId: todo.todoId));
                },
                child: Text(
                  todo.todoTitle,
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 20,
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: const Color.fromARGB(255, 100, 102, 105),
                    decorationThickness: 3,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
