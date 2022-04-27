abstract class TaskRepository {
    Future<void> save(Datetime date, String description);
}