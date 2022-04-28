import 'package:todo_list_provider/app/repositories/tasks/task_repository.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';

class TasksServiceImpl implements TasksService {
  final TaskRepository _taskRepository;

  TasksServiceImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  @override
  Future<void> save(DateTime date, String description) =>
      _taskRepository.save(date, description);
}
