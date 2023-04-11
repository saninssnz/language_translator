import 'dart:convert';

TranslatedModel translatedModelFromJson(String str) => TranslatedModel.fromJson(json.decode(str));

String translatedModelToJson(TranslatedModel data) => json.encode(data.toJson());

class TranslatedModel {
  TranslatedModel({
    this.translatedText,
  });

  String? translatedText;

  factory TranslatedModel.fromJson(Map<String, dynamic> json) => TranslatedModel(
    translatedText: json["translatedText"],
  );

  Map<String, dynamic> toJson() => {
    "translatedText": translatedText,
  };
}
