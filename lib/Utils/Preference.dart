import 'package:language_translator/Model/LanguageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceFile{

  Future setSourceText( String sourceTextJson) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("sourceLanguageModel", sourceTextJson);
  }

  Future<String> getSourceText()async{
    String sourceText = "";
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String jsonData =null!=preferences.getString("sourceLanguageModel")?preferences.getString("sourceLanguageModel")!:"";
    if(jsonData.isNotEmpty){
      sourceText =jsonData;
    }
    return sourceText;
  }

  Future setTargetText( String targetTextJson) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("targetLanguageModel", targetTextJson);
  }

  Future<String> getTargetText()async{
    String targetText = "";
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String jsonData =null!=preferences.getString("targetLanguageModel")?preferences.getString("targetLanguageModel")!:"";
    if(jsonData.isNotEmpty){
      targetText =jsonData;
    }
    return targetText;
  }

}