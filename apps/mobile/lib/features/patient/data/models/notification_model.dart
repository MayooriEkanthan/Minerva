import 'package:flutter/material.dart';

enum NotificationType { appointment, consultation, update }

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final String timestamp;
  final IconData icon;
  final NotificationType type;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.icon,
    required this.type,
  });
}
