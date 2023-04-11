import 'package:flutter/material.dart';
import 'package:language_translator/Service/Provider.dart';
import 'package:language_translator/Ui/MainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<DataProvider>(create: (context) => DataProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                  BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                  BorderSide(color: Colors.transparent)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                  BorderSide(color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                  BorderSide(color: Colors.transparent)),
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(15),
              filled: true,
              hintStyle: TextStyle(color: Colors.white54),
              // hintText: "Type in your mobile number",
              fillColor: Color(0xFF232527)),
        ),
      home: MainScreen(),
    );
  }
}
