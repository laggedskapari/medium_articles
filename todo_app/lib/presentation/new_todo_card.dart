import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/bloc/todo/todo_bloc.dart';

class NewTodoCard extends StatefulWidget {
  const NewTodoCard({super.key});

  @override
  State<NewTodoCard> createState() => _NewTodoCardState();
}

class _NewTodoCardState extends State<NewTodoCard> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.double_arrow,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    maxLines: 1,
                    maxLength: 30,
                    controller: _titleController,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      counter: const Offstage(),
                      hintText: '//TITLE',
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<TodoBloc>(context).add(
                CreateNewTodoEvent(
                  todoTitle: _titleController.text.trim(),
                ),
              );
            },
            icon: const Icon(
              Icons.check,
              size: 30,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
