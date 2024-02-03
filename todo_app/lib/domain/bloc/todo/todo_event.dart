part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodosEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class CreateNewTodoEvent extends TodoEvent {
  final String todoTitle;

  const CreateNewTodoEvent({required this.todoTitle});

  @override
  List<Object?> get props => [todoTitle];
}

class DeleteTodoEvent extends TodoEvent {
  final String todoId;

  const DeleteTodoEvent({required this.todoId});

  @override
  List<Object?> get props => [todoId];
}

class CompleteTodoEvent extends TodoEvent {
  final String todoId;

  const CompleteTodoEvent({required this.todoId});

  @override
  List<Object?> get props => [todoId];
}
