import 'dart:convert';

class TaskModel {
    String title;
    String? subtitle;
    bool isCompleted;
    DateTime createdAt;

    TaskModel({
        required this.title,
        this.subtitle,
        this.isCompleted=false,
        required this.createdAt,
    });

    factory TaskModel.fromRawJson(String str) => TaskModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        subtitle: json["subtitle"],
        isCompleted: json["isCompleted"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isCompleted": isCompleted,
        "createdAt": createdAt.toIso8601String(),
    };
}
