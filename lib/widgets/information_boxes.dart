import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordina_assignment/providers/word_analyzer_notifier.dart';
import 'package:ordina_assignment/widgets/information_box.dart';
import 'package:provider/provider.dart';

class InformationBoxes extends StatelessWidget {
  const InformationBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WordAnalyzerNotifier>(
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
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
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
                          label: "N: ${store.nWords.round().toString()}",
                          min: 1,
                          max: 50,
                          onChanged: (value) => store.onNWordsChange(value),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "WORD",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "FREQUENCY",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(item.word))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text("${item.frequency}"))),
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
    );
  }
}
