// Recebe ações do usuário e devolve estados prontos para a UI
import '../models/task.dart';
import 'task_event.dart';
import 'task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Define o BLOC responsável pelas tarefas
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  // Construtor do TaskBloc
  TaskBloc() : super(TaskState(tasks: [])) {
    on<AddTask>((event, emit) {
      // Cria uma nova tarefa com ID baseado no tempo atual em milissegundos
      final newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: event.title,
      );

      // Emite um novo estado contendo todas as tarefas anteriores + a nova
      emit(TaskState(tasks: List.from(state.tasks)..add(newTask)));
    });

    // Configura a resposta para o evento de alternar o status de conclusão de uma tarefa
    on<ToggleTask>((event, emit) {
      // Mapeia a lista de tarefas: se o ID for o mesmo, inverte o isCompleted; senão mantém igual
      final updatedTasks =
          state.tasks.map((task) {
            return task.id == event.taskId
                ? task.copyWith(
                  isCompleted: !task.isCompleted,
                ) // Alterna status
                : task; // Mantém inalterado
          }).toList();

      // Emite o novo estado atualizado com as tarefas modificadas
      emit(TaskState(tasks: updatedTasks));
    });

    // Configura a resposta para o evento de remover uma tarefa específica
    on<RemoveTask>((event, emit) {
      // Filtra a lista de tarefas, removendo aquela que tiver o ID igual ao passado no evento
      final updatedTasks =
          state.tasks.where((task) => task.id != event.taskId).toList();

      // Emite o novo estado sem a tarefa removida
      emit(TaskState(tasks: updatedTasks));
    });
  }
}
