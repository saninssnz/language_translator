import 'dart:convert';

LanguageModel languageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  LanguageModel({
    this.language,
  });

  String? language;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
  };
}
