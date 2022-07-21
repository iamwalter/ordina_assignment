import 'package:flutter/cupertino.dart';
import 'package:ordina_assignment/word_processing.dart';

class WordAnalyzerNotifier extends ChangeNotifier {
  WordFrequencyAnalyzer wordFrequencyAnalyzer;

  WordAnalyzerNotifier(this.wordFrequencyAnalyzer) {
    _handle();
  }

  String word = "";
  String text =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";

  int nWords = 10;
  int frequencyForWord = 0;
  List<WordFrequency> wordFrequencies = [];

  void _handle() {
    frequencyForWord =
        wordFrequencyAnalyzer.calculateFrequencyForWord(text, word);
    wordFrequencies =
        wordFrequencyAnalyzer.calculateMostFrequentNWords(text, nWords);

    notifyListeners();
  }

  void onTextChange(String text) {
    this.text = text;

    _handle();
  }

  void onWordChange(String word) {
    this.word = word;

    _handle();
  }

  void onNWordsChange(double nWords) {
    this.nWords = nWords.round();

    _handle();
  }
}
