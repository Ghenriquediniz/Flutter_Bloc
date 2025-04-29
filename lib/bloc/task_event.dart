//Eventos das tarefas
abstract class TaskEvent {} // todos os eventos de tarefa vão herdar.

// Evento para adicionar uma nova tarefa.
class AddTask extends TaskEvent {
  final String title;

  AddTask(this.title);
}

//Evento para alterar
class ToggleTask extends TaskEvent {
  final String taskId;

  ToggleTask(this.taskId);
}

//Evernto para remover
class RemoveTask extends TaskEvent {
  final String taskId; // Corrigir aqui
  RemoveTask(this.taskId);
}
