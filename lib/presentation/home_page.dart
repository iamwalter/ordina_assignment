import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordina_assignment/presentation/information_box.dart';
import 'package:ordina_assignment/presentation/main_text.dart';
import 'package:ordina_assignment/word_analyzer_notifier.dart';
import 'package:ordina_assignment/word_processing.dart';
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
        child: const MyHomePage(title: 'Epic Word Counter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(flex: 4, child: MainText()),
          Expanded(
            flex: 2,
            child: Consumer<WordAnalyzerNotifier>(
              builder: (context, store, builder) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InformationBox(
                      title: "calculateFrequencyForWord",
                      child: Column(
                        children: [
                          Text("Word: ${store.word}"),
                          TextField(
                            onChanged: (str) => store.onWordChange(str),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a word',
                            ),
                          ),
                          Text("Frequency in text: ${store.frequencyForWord}")
                        ],
                      ),
                    ),
                    InformationBox(
                      title: "calculateMostFrequentNWords",
                      child: Column(
                        children: [
                          Text("N: ${store.nWords}"),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: store.wordFrequencies.length,
                            itemBuilder: (context, i) {
                              final items = store.wordFrequencies;

                              return Text(items[i].toString());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () => print("pressed"),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
