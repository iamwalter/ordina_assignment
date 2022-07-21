import 'package:flutter/material.dart';
import 'package:ordina_assignment/data/word_frequency_analyzer_impl.dart';
import 'package:ordina_assignment/widgets/information_boxes.dart';
import 'package:ordina_assignment/widgets/main_input.dart';
import 'package:ordina_assignment/providers/word_analyzer_notifier.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => WordAnalyzerNotifier(WordFrequencyAnalyzerImpl()),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Epic Text Analyzer"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: const [
            Expanded(flex: 2, child: MainInput()),
            Expanded(child: InformationBoxes()),
          ],
        ),
      ),
    );
  }
}
