import 'package:flutter/material.dart';
import 'package:ordina_assignment/providers/word_analyzer_notifier.dart';
import 'package:provider/provider.dart';

class MainInput extends StatelessWidget {
  const MainInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WordAnalyzerNotifier>(
      builder: (context, store, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                const Text("Text Analyzer", style: TextStyle(fontSize: 38.0)),
                const SizedBox(height: 18.0),
                TextField(
                  onChanged: (str) => store.onTextChange(str),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
                    hintText: "Enter Text",
                  ),
                  maxLines: null,
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
