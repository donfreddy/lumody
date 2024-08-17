import 'package:flutter/material.dart';

class Language {
  final String? name;
  final String? code;

  const Language({this.name, this.code});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
    };
  }
}

const List<Locale> lmdSupportedLocales = [
  Locale('en'),
  Locale('fr'),
];

const List<Language> lmdSupportedLanguages = [
  Language(name: 'english', code: 'en'),
  Language(name: 'french', code: 'fr'),
];

const languages_ = [
  'System Default',
  'English',
  'Spanish',
  'French',
  'German',
  'Italian',
  'Portuguese',
  'Russian',
  'Chinese',
  'Japanese',
  'Korean',
  'Arabic',
  'Hindi',
  'Bengali',
  'Punjabi',
  'Urdu',
  'Turkish',
  'Vietnamese',
  'Thai',
  'Swahili',
];
