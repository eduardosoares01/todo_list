import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/models/week_task_model.dart';
import 'package:todo_list_provider/app/repositories/tasks/task_repository.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';

class TasksServiceImpl implements TasksService {
  final TaskRepository _taskRepository;

  TasksServiceImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  @override
  Future<void> save(DateTime date, String description) =>
      _taskRepository.save(date, description);

  @override
  Future<List<TaskModel>> getToday() {
    return _taskRepository.findByPeriod(DateTime.now(), DateTime.now());
  }

  @override
  Future<List<TaskModel>> getTomorrow() {
    var tomorrowDate = DateTime.now().add(Duration(days: 1));
    return _taskRepository.findByPeriod(tomorrowDate, tomorrowDate);
  }

  @override
  Future<WeekTaskModel> getWeek() async {
    final today = DateTime.now();
    //var startFilter = DateTime(today.year, today.month,to)
    DateTime startFilter = today;
    DateTime endFilter = today.add(Duration(days: 7));

    //var startFilter = today.subtract(Duration(days: (1 - today.weekday)));

    final tasks = await _taskRepository.findByPeriod(startFilter, endFilter);
    return WeekTaskModel(
        startDate: startFilter, endDate: endFilter, tasks: tasks);
  }
}
