import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_translator/Model/LanguageModel.dart';
import 'package:language_translator/Service/Provider.dart';
import 'package:language_translator/Ui/LanguageListScreec.dart';
import 'package:language_translator/Utils/UtilFunctions.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController sourceTextController = new TextEditingController();
  TextEditingController targetTextController = new TextEditingController();
  var sourcetextLength = 0;
  var targettextLength = 0;
  var maxLength = 2500;

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false)
        .getLanguageList(context)
        .then((value) {
      Provider.of<DataProvider>(context, listen: false).selectedSourceLanguage =
          Provider.of<DataProvider>(context, listen: false).languageList[0];

      Provider.of<DataProvider>(context, listen: false).selectedTargetLanguage =
          Provider.of<DataProvider>(context, listen: false).languageList[2];
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, dataProvider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFF121416),
        body:  dataProvider.isLanguagesLoading
            ? Center(
          child: CircularProgressIndicator(
            color: Colors.white70,
          ),
        )
            : SafeArea(
          child: SingleChildScrollView(
            child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Text Translations",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                dataProvider.setSource(true);
                                dataProvider.setTarget(false);
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (builder) {
                                      return new Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                            color: Color(0xFF232527),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.5,
                                          child: LanguageListScreen(
                                              dataProvider.languageList));
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF232527),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.language,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        UtilFunctions.getLanguageType(
                                            dataProvider
                                                .selectedSourceLanguage.language
                                                .toString()),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.swap_horiz_outlined,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dataProvider.setSource(false);
                                dataProvider.setTarget(true);
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (builder) {
                                      return new Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                            color: Color(0xFF232527),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.5,
                                          child: LanguageListScreen(
                                              dataProvider.languageList));
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF232527),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.language,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        UtilFunctions.getLanguageType(
                                            dataProvider
                                                .selectedTargetLanguage.language
                                                .toString()),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Translate From ",
                              style: TextStyle(color: Colors.white54),
                            ),
                            Text(
                              "(" +
                                  UtilFunctions.getLanguageType(dataProvider
                                      .selectedSourceLanguage.language
                                      .toString()) +
                                  ")",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF232527)),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: TextField(
                                  controller: sourceTextController,
                                  maxLength: 2500,
                                  maxLines: 8,
                                  onChanged: (value) {
                                    setState(() {
                                      sourcetextLength = value.length;
                                      if (sourceTextController.text != "") {
                                        dataProvider
                                            .detectLanguage(context,
                                                sourceTextController.text)
                                            .then((values) {
                                          dataProvider.selectedSourceLanguage
                                              .language = values.language!;
                                          setState(() {});
                                        });
                                      }

                                      if (sourceTextController.text != "") {
                                        dataProvider
                                            .translateLanguage(
                                                context,
                                                sourceTextController.text,
                                                dataProvider
                                                    .selectedTargetLanguage
                                                    .language!,
                                                dataProvider
                                                    .selectedSourceLanguage
                                                    .language!)
                                            .then((values) {
                                          targetTextController.text =
                                              values.translatedText.toString();
                                          setState(() {});
                                        });
                                      } else {
                                        setState(() {
                                          targetTextController.clear();
                                        });
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 170.0, left: 15, right: 15),
                                child: Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 180.0,
                                    left: 15,
                                    right: 15,
                                    bottom: 15),
                                child: Text(
                                  '${sourcetextLength.toString()}/${maxLength.toString()}',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Translate To ",
                              style: TextStyle(color: Colors.white54),
                            ),
                            Text(
                              "(" +
                                  UtilFunctions.getLanguageType(dataProvider
                                      .selectedTargetLanguage.language
                                      .toString()) +
                                  ")",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF232527)),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: TextField(
                                  controller: targetTextController,
                                  readOnly: true,
                                  maxLength: 2500,
                                  maxLines: 8,
                                  onChanged: (value) {
                                    setState(() {
                                      targettextLength = value.length;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    counterText: "",
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 170.0, left: 15, right: 15),
                                child: Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 180.0,
                                    left: 15,
                                    right: 15,
                                    bottom: 15),
                                child: Text(
                                  '${targettextLength.toString()}/${maxLength.toString()}',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
