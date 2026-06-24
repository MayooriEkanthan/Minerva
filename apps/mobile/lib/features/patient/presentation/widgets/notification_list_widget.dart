import 'package:flutter/material.dart';
import '../../data/models/notification_model.dart';
import 'notification_card.dart';

class NotificationListWidget extends StatelessWidget {
  final List<NotificationModel> notifications;
  final int selectedTab;

  const NotificationListWidget({
    super.key,
    required this.notifications,
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    // Filter notifications based on the selected tab
    // Tab 0: All, Tab 1: Appointments, Tab 2: Consultations
    final filteredNotifications = notifications.where((notification) {
      if (selectedTab == 0) return true;
      if (selectedTab == 1) return notification.type == NotificationType.appointment;
      if (selectedTab == 2) return notification.type == NotificationType.consultation;
      return false;
    }).toList();

    if (filteredNotifications.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Center(
          child: Text('No notifications in this category.'),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: filteredNotifications.length,
      itemBuilder: (context, index) {
        final notification = filteredNotifications[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0), // Spacing between cards
          child: NotificationCard(
            title: notification.title,
            description: notification.description,
            timestamp: notification.timestamp,
            icon: notification.icon,
            onMarkAsRead: () {},
            onViewDetails: () {},
            onDelete: () {},
          ),
        );
      },
    );
  }
}
