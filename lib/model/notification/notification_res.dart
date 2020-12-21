// To parse this JSON data, do
//
//     final notificationRes = notificationResFromJson(jsonString);

import 'dart:convert';

NotificationRes notificationResFromJson(String str) => NotificationRes.fromJson(json.decode(str));

String notificationResToJson(NotificationRes data) => json.encode(data.toJson());

class NotificationRes {
  NotificationRes({
    this.unreadNotificationCount,
    this.notifications,
  });

  int unreadNotificationCount;
  List<Notification> notifications;

  factory NotificationRes.fromJson(Map<String, dynamic> json) => NotificationRes(
    unreadNotificationCount: json["unread_notification_count"],
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "unread_notification_count": unreadNotificationCount,
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notification {
  Notification({
    this.userName,
    this.userImage,
    this.path,
    this.notificationMessage,
    this.createdAt,
    this.notificationType,
  });

  String userName;
  String userImage;
  String path;
  String notificationMessage;
  String createdAt;
  String notificationType;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    userName: json["user_name"],
    userImage: json["user_image"],
    path: json["path"],
    notificationMessage: json["notification_message"],
    createdAt: json["created_at"],
    notificationType: json["notification_type"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "user_image": userImage,
    "path": path,
    "notification_message": notificationMessage,
    "created_at": createdAt,
    "notification_type": notificationType,
  };
}
