import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/database_services.dart';
import 'package:todo_app/data/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  final DatabaseServices _databaseServices;

  TodoBloc(this._databaseServices) : super(TodoInitial()) {
    on<LoadTodosEvent>((event, emit) async {
      final todos = _databaseServices.loadAllTodos();
      List<Todo> todoList = await todos;
      emit(TodoLoadedState(todoList));
    });

    on<CreateNewTodoEvent>((event, emit) async {
      await _databaseServices.createNewTodo(todoTitle: event.todoTitle);
      add(LoadTodosEvent());
    });

    on<DeleteTodoEvent>((event, emit) async {
      await _databaseServices.deleteTodo(todoId: event.todoId);
      add(LoadTodosEvent());
    });

    on<CompleteTodoEvent>((event, emit) async {
      await _databaseServices.completeTodo(todoId: event.todoId);
      add(LoadTodosEvent());
    });
  }
}
