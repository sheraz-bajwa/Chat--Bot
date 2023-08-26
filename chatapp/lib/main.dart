import 'package:chatapp/Homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// api key= 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
// apikey= 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
//video api key = sk-QPtbZcSyzelyj4DSwBqST3B1bkFJ1JxiZzVOFU5yHZc3FuXB
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatBot(),
    );
  }
}
