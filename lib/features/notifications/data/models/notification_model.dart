class NotificationModel {
  final String id;
  final String title;
  final String body;
  final String time;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      time: json['created_at'],
    );
  }

  factory NotificationModel.placeHolder() {
    return NotificationModel(
      id: '',
      title: '',
      body: '',
      time: '',
    );
  }
}
