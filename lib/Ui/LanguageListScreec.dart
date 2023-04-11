import 'package:flutter/material.dart';
import 'package:language_translator/Model/LanguageModel.dart';
import 'package:language_translator/Utils/Preference.dart';
import 'package:language_translator/Utils/UtilFunctions.dart';
import 'package:provider/provider.dart';

import '../Service/Provider.dart';

class LanguageListScreen extends StatefulWidget {
  LanguageListScreen(this.langList);
  List<LanguageModel> langList = [];

  @override
  _LanguageListScreenState createState() => _LanguageListScreenState();
}

class _LanguageListScreenState extends State<LanguageListScreen> {
  TextEditingController searchController = new TextEditingController();
  List<LanguageModel> filteredList = [];

  @override
  void initState() {
    filteredList = widget.langList;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, dataProvider, child) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Color(0xFF232527),
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      filteredList = widget.langList
                          .where((item) =>
                              UtilFunctions.getLanguageType(item.language!)
                                  .toLowerCase()
                                  .contains(text.toLowerCase()))
                          .toList();
                      if (text.isEmpty) {
                        filteredList = widget.langList;
                      }
                    });
                  },
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    counterText: "",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white70)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white70)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white70)),
                  ),
                  controller: searchController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 14),
                        child: InkWell(
                          onTap: () {
                            if (dataProvider.isSourceSelected) {
                              dataProvider.setSourceLang(filteredList[index]);
                              PreferenceFile().setSourceLang(
                                  filteredList[index].language.toString());
                              setState(() {});
                            } else {
                              dataProvider.setTargetLang(filteredList[index]);
                              PreferenceFile().setTargetLang(
                                  filteredList[index].language.toString());
                              setState(() {});
                            }

                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF121416)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.language,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    UtilFunctions.getLanguageType(
                                        filteredList[index]
                                            .language
                                            .toString()),
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ));
    });
  }
}
