import 'dart:convert';
import 'package:language_translator/Model/DetectModel.dart';
import 'package:language_translator/Model/TranslatedModel.dart';
import 'package:wnetworking/wnetworking.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:language_translator/Model/LanguageModel.dart';
import 'package:language_translator/Service/Api.dart';
import 'package:provider/provider.dart';

class DataProvider with ChangeNotifier {
  bool isLanguagesLoading = false;
  bool isLanguageDetecting = false;
  bool isLanguageTranslating = false;
  List<LanguageModel> languageList = [];
  LanguageModel selectedSourceLanguage = new LanguageModel();
  LanguageModel selectedTargetLanguage = new LanguageModel();
  DetectLanguageModel detectLanguageModel = new DetectLanguageModel();
  TranslatedModel translatedModel = new TranslatedModel();
  String apiKey = "ee9401bd9dmsh0fd4127d7dbe19ep1cd672jsn1f04425072ab";
  bool isSourceSelected = false;
  bool isTargetSelected = false;



  void setSourceLang(LanguageModel model){
    this.selectedSourceLanguage =model;
    notifyListeners();
  }

  void setTargetLang(LanguageModel model){
    this.selectedTargetLanguage =model;
    notifyListeners();
  }

  void setSource(bool data){
    this.isSourceSelected = data;
    notifyListeners();
  }

  void setTarget(bool data){
    this.isTargetSelected = data;
    notifyListeners();
  }




  var headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'Accept-Encoding': 'application/gzip',
    'X-RapidAPI-Key': "ee9401bd9dmsh0fd4127d7dbe19ep1cd672jsn1f04425072ab",
    'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
  };

  Future<void> getLanguageList(BuildContext context) async {
    var response;

    isLanguagesLoading = true;

    String url = Api.BASE_URL + "languages";
    response = await http.get(Uri.parse(url), headers: headers);

    isLanguagesLoading = false;

    if (response.statusCode == 200) {
      String responseString = response.body;
      var data = jsonDecode(responseString);
      var resultData = data["data"]["languages"];


      languageList = List<LanguageModel>.from(
          resultData.map((x) => LanguageModel.fromJson(x)));

      notifyListeners();
    }
  }


  Future<DetectLanguageModel> detectLanguage(BuildContext context, String typedData) async {

    isLanguageDetecting = true;

    var result = await HttpReqService.post<JMap>(
        Api.BASE_URL + "detect",
        auth: AuthType.apiKey,
        authData: MapEntry('X-RapidAPI-Key', apiKey),
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          'Accept-Encoding': 'application/gzip',
          'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'},
      body: {'q':typedData}
    );

    isLanguageDetecting = false;

    var data = result!['data']['detections'][0];

    detectLanguageModel = DetectLanguageModel.fromJson(data[0]);

    return detectLanguageModel;

  }


  Future<TranslatedModel> translateLanguage(BuildContext context,String typedData,String target,String source) async {

    isLanguageDetecting = true;

    var result = await HttpReqService.post<JMap>(
        Api.BASE_URL,
        auth: AuthType.apiKey,
        authData: MapEntry('X-RapidAPI-Key', apiKey),
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          'Accept-Encoding': 'application/gzip',
          'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'},
        body: {
          'q':typedData,
          "target":target,
          "source":source,}
    );

    isLanguageDetecting = false;

    print(result);

    var data = result!['data']['translations'][0];

    translatedModel = TranslatedModel.fromJson(data);

    return translatedModel;

  }

}
