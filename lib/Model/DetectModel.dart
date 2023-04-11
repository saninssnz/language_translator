import 'dart:convert';

DetectLanguageModel detectLanguageModelFromJson(String str) => DetectLanguageModel.fromJson(json.decode(str));

String detectLanguageModelToJson(DetectLanguageModel data) => json.encode(data.toJson());

class DetectLanguageModel {
  DetectLanguageModel({
    this.confidence,
    this.isReliable,
    this.language,
  });

  double? confidence;
  bool? isReliable;
  String? language;

  factory DetectLanguageModel.fromJson(Map<String, dynamic> json) => DetectLanguageModel(
    confidence: null!=json["confidence"]?double.parse(json["confidence"].toString()):0,
    isReliable: json["isReliable"],
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "confidence": confidence,
    "isReliable": isReliable,
    "language": language,
  };
}
