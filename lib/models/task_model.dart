class Task {
  final String id;
  final String title;
  final String dueDate;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.isCompleted,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['objectId'],
      title: json['title'],
      dueDate: json['dueDate'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dueDate': dueDate,
      'isCompleted': isCompleted,
    };
  }
}
