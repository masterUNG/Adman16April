// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class PostModel {
  final String uidPost;
  final List<String> urlPaths;
  final String article;
  final String link;
  final String nameButton;
  PostModel({
    @required this.uidPost,
    @required this.urlPaths,
    @required this.article,
    @required this.link,
    @required this.nameButton,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uidPost': uidPost,
      'urlPaths': urlPaths,
      'article': article,
      'link': link,
      'nameButton': nameButton,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      uidPost: (map['uidPost'] ?? '') as String,
      urlPaths: List<String>.from((map['urlPaths'] ?? const <String>[]) as List<String>),
      article: (map['article'] ?? '') as String,
      link: (map['link'] ?? '') as String,
      nameButton: (map['nameButton'] ?? '') as String,
    );
  }

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
