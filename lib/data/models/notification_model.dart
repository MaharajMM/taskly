class NotificationModel {
  final NotificationType type;
  final String message;
  final DateTime timestamp;

  const NotificationModel({
    required this.type,
    required this.message,
    required this.timestamp,
  });
}

enum NotificationType {
  reminder,
  upcomingTask,
  taskCompleted,
  taskDue,
}
