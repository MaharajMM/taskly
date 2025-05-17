import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/data/models/notification_model.dart';

final notificationsProvider = Provider<List<NotificationModel>>((ref) {
  return [
    NotificationModel(
      type: NotificationType.reminder,
      message: 'Your interview with Sarah starts in 30 minutes. Get ready!',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    NotificationModel(
      type: NotificationType.upcomingTask,
      message: 'Don\'t forget to complete Alex Interview before the deadline.',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    NotificationModel(
      type: NotificationType.taskCompleted,
      message: 'Great job! You\'ve checked off a task. Keep going!',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel(
      type: NotificationType.taskDue,
      message: 'Your task "Submit Report" is due in 1 hour. Stay on track!',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
    ),
  ];
});
