enum DoctorNotificationType { appointment, reminder }

class DoctorNotificationModel {
  final String id;
  final String patientName;
  final String issue;
  final String time;
  final DoctorNotificationType type;
  final String? duration; // Used for reminders

  const DoctorNotificationModel({
    required this.id,
    required this.patientName,
    required this.issue,
    required this.time,
    required this.type,
    this.duration,
  });
}
