import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  // String description;//TODO
  DateTime? sysCreationDate;
  DateTime? sysUpdateDate;
  DateTime? startDate;
  String status;
  Color color;

  Task({
    required this.id,
    this.title = "",
    // this.description = "", //TODO
    this.sysCreationDate,
    this.sysUpdateDate,
    this.startDate,
    required this.status,
    this.color = const Color.fromARGB(188, 172, 168, 168),
  });

  factory Task.fromJSON(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['task'],
        // description: json['description'], //TODO
        sysCreationDate: DateTime.tryParse(json['criado_em'])?.toLocal(),
        sysUpdateDate: DateTime.tryParse(json['atualizado_em'])?.toLocal(),
        startDate: DateTime.tryParse(json['startDate'])?.toLocal(),
        status: json['status'] ?? TaskStatus.pending,
        color: json['color'] == null ? const Color.fromARGB(188, 172, 168, 168) : Color(json['color']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'task': title,
        'criado_em': sysCreationDate,
        'atualizado_em': sysUpdateDate,
        'startDate': startDate,
        'status': status,
        'color': color.value,
      };
}

class TaskStatus {
  static String pending = "pending";
  static String completed = "completed";
  static String expired = "expired";
  static String active = "active";
  static String archived = "archived";
  static String deleted = "deleted";
}
