import 'package:flutter/material.dart';

class Topic {
  int? id;
  final String title;
  final String subTitle;

  Topic({this.id, required this.title, required this.subTitle});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'],
      title: json['title'],
      subTitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subTitle,
  };
}