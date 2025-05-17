import 'package:flutter/material.dart';
import 'package:taskly/data/models/notification_model.dart';

class NotificationCard extends StatefulWidget {
  final NotificationModel notification;
  const NotificationCard({super.key, required this.notification});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  IconData? iconData;
  Color? iconColor;
  @override
  Widget build(BuildContext context) {
    switch (widget.notification.type) {
      case NotificationType.reminder:
        iconData = Icons.notifications;
        iconColor = Colors.amber;
        break;
      case NotificationType.upcomingTask:
        iconData = Icons.hourglass_empty;
        iconColor = Colors.brown;
        break;
      case NotificationType.taskCompleted:
        iconData = Icons.check_box;
        iconColor = Colors.green;
        break;
      case NotificationType.taskDue:
        iconData = Icons.hourglass_bottom;
        iconColor = Colors.brown;
        break;
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getNotificationTitle(widget.notification.type),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.notification.message,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getNotificationTitle(NotificationType type) {
    switch (type) {
      case NotificationType.reminder:
        return 'Reminder';
      case NotificationType.upcomingTask:
        return 'Upcoming Task';
      case NotificationType.taskCompleted:
        return 'Task Completed';
      case NotificationType.taskDue:
        return 'Task Due';
    }
  }
}
