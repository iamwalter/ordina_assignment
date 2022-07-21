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
          const Expanded(flex: 2, child: MainText()),
          Expanded(
            child: Consumer<WordAnalyzerNotifier>(
              builder: (context, store, builder) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      children: [
                        InformationBox(
                          title: "Highest Frequency",
                          child: Text(
                            "${store.highestFrequency}",
                            style: const TextStyle(fontSize: 32.0),
                          ),
                        ),
                        InformationBox(
                          title: "Word Frequency",
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (str) => store.onWordChange(str),
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter a word',
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              const Text("Frequency:"),
                              Text(
                                "${store.frequencyForWord}",
                                style: const TextStyle(fontSize: 32.0),
                              )
                            ],
                          ),
                        ),
                        InformationBox(
                          title: "Most Frequent Words",
                          child: SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            child: Column(
                              children: [
                                Text("N: ${store.nWords}"),
                                Slider(
                                  value: store.nWords.toDouble(),
                                  divisions: 15,
                                  label:
                                      "N: ${store.nWords.round().toString()}",
                                  min: 1,
                                  max: 50,
                                  onChanged: (value) =>
                                      store.onNWordsChange(value),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "WORD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "FREQUENCY",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4.0),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: store.wordFrequencies.length,
                                  itemBuilder: (context, i) {
                                    final item = store.wordFrequencies[i];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(item.word))),
                                          Expanded(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      "${item.frequency}"))),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
