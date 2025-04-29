//	É o resultado visível de todas as ações feitas no app
// 	Descrever como o estado atual das tarefas deve ser
// O BLoC emite novos TaskState toda vez que acontece um TaskEvent

import '../models/task.dart';

// Representa o estado atual da lista de tarefas
class TaskState {
  // Construtor exige que sempre exista uma lista de tarefas (não aceita nulo)
  final List<Task> tasks;
  TaskState({required this.tasks});

  // Permite modificar a lista de tarefas sem alterar o estado original
  TaskState copyWith({List<Task>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }
}
