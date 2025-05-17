import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/features/notification/controller/notification_pod.dart';
import 'package:taskly/features/notification/view/widgets/notification_card.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationView();
  }
}

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final router = context.router;

            try {
              // Attempt to get the AutoTabsRouter
              final tabsRouter = AutoTabsRouter.of(context);
              // If successful, switch to the Home tab
              tabsRouter.setActiveIndex(0);
            } catch (e) {
              // If AutoTabsRouter is not found, just pop the current route
              router.maybePop();
            }
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: NotificationCard(notification: notification),
          );
        },
      ),
    );
  }
}
