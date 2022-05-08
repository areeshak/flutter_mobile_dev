class Task {
  String title;
  String description;
  late DateTime date;
  late String dateDone;
  int isDone;
  late String docId;

  Task({
    required this.title,
    required this.description,
    required this.date,
    this.isDone = -1,
    this.dateDone = "",
    this.docId = "",
  });

  //add user
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    data['isDone'] = isDone;
    data['dateDone'] = dateDone;

    return data;
  }

  static Task fromJson(Map<String, dynamic> json) => Task(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        date: json['date'].toDate(),
        isDone: json['isDone'],
        dateDone: json['dateDone'],
      );
}
