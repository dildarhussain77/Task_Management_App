class Task {
  String title;
  String description; // New field
  bool isCompleted;

  Task({required this.title, required this.description, this.isCompleted = false});

  // Convert task to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description, // Storing description
      'isCompleted': isCompleted,
    };
  }

  // Create task from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'], // Fetching description
      isCompleted: json['isCompleted'],
    );
  }
}
