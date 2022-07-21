import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordina_assignment/word_analyzer_notifier.dart';
import 'package:provider/provider.dart';

class MainText extends StatelessWidget {
  const MainText({Key? key}) : super(key: key);

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
                Text("Enter Some Text", style: const TextStyle(fontSize: 38.0)),
                SizedBox(height: 18.0),
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
