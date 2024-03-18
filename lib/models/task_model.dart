import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorate;

  Task(
      {required this.title,
      required this.description,
      required this.id,
      required this.date,
      this.isDone,
      this.isFavorate,
      this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorate = isFavorate ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorate,
  }) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        isFavorate: isFavorate ?? this.isFavorate);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'date': date,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorate': isFavorate
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isFavorate: map['isFavorate'] != null ? map['isFavorate'] as bool : null,
    );
  }

  @override
  List<Object?> get props =>
      [title, description, date, id, isDone, isDeleted, isFavorate];
}
