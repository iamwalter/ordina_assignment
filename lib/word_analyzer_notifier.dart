import 'package:flutter/cupertino.dart';
import 'package:ordina_assignment/word_processing.dart';

class WordAnalyzerNotifier extends ChangeNotifier {
  WordFrequencyAnalyzer wordFrequencyAnalyzer;

  WordAnalyzerNotifier(this.wordFrequencyAnalyzer);

  String word = "";
  String text = "";

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
