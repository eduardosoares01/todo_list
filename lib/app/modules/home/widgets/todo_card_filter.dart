import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

import '../../../models/task_filter_enum.dart';
import '../../../models/total_tasks_model.dart';

class TodoCardFilter extends StatelessWidget {
  final String label;
  final TaskFilterEnum taskFilter;
  final TotalTasksModel? totalTasksModel;
  final bool selected;

  const TodoCardFilter(
      {Key? key,
      required this.label,
      required this.taskFilter,
      required this.selected,
      this.totalTasksModel})
      : super(key: key);

  double _getPercentFinish() {
    final total = totalTasksModel?.totalTasks ?? 0.0;
    final totalFinish = totalTasksModel?.totalTasksFinish ?? 0.0;

    if (totalFinish == 0)
      return 0.0;
    else
      return totalFinish / total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 120, maxWidth: 150),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: selected ? context.primaryColor : Colors.white,
          border: Border.all(width: 1, color: Colors.grey.withOpacity(.8)),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${totalTasksModel?.totalTasks ?? 0} TASKS',
            style: context.titleStyle.copyWith(
                fontSize: 10, color: selected ? Colors.white : Colors.grey),
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black),
          ),
          LinearProgressIndicator(
            backgroundColor:
                selected ? context.primaryColorLight : Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(
                selected ? Colors.white : context.primaryColor),
            value: _getPercentFinish(),
          )
        ],
      ),
    );
  }
}
