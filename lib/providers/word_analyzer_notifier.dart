import 'package:flutter/cupertino.dart';
import 'package:ordina_assignment/data/entities/word_frequency.dart';
import 'package:ordina_assignment/data/word_frequency_analyzer.dart';

class WordAnalyzerNotifier extends ChangeNotifier {
  WordFrequencyAnalyzer wordFrequencyAnalyzer;

  WordAnalyzerNotifier(this.wordFrequencyAnalyzer);

  String word = "";
  String text = "";

  int nWords = 10;
  int frequencyForWord = 0;
  int highestFrequency = 0;

  List<WordFrequency> wordFrequencies = [];

  void onTextChange(String text) {
    this.text = text;

    frequencyForWord =
        wordFrequencyAnalyzer.calculateFrequencyForWord(text, word);
    wordFrequencies =
        wordFrequencyAnalyzer.calculateMostFrequentNWords(text, nWords);
    highestFrequency = wordFrequencyAnalyzer.calculateHighestFrequency(text);

    notifyListeners();
  }

  void onWordChange(String word) {
    this.word = word;

    frequencyForWord =
        wordFrequencyAnalyzer.calculateFrequencyForWord(text, word);

    notifyListeners();
  }

  void onNWordsChange(double nWords) {
    this.nWords = nWords.round();

    wordFrequencies =
        wordFrequencyAnalyzer.calculateMostFrequentNWords(text, this.nWords);

    notifyListeners();
  }
}
