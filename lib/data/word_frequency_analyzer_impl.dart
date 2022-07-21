import 'package:ordina_assignment/data/word_frequency_analyzer.dart';
import 'package:ordina_assignment/data/entities/word_frequency.dart';

class WordFrequencyAnalyzerImpl implements WordFrequencyAnalyzer {
  @override
  int calculateFrequencyForWord(String text, String word) => text
      .split(' ')
      .where((w) => w.toLowerCase() == word.toLowerCase() && word != '')
      .length;

  @override
  int calculateHighestFrequency(String text) {
    int highest = 0;

    for (String word in text.split(' ')) {
      final int frequency = calculateFrequencyForWord(text, word);
      if (frequency > highest) highest = frequency;
    }

    return highest;
  }

  @override
  List<WordFrequency> calculateMostFrequentNWords(String text, int n) {
    List<WordFrequency> list = [];
    final dict = <String, int>{};

    text.split(' ').forEach((word) {
      if (dict[word.toLowerCase()] == null) {
        dict[word.toLowerCase()] = 1;
      } else {
        dict[word.toLowerCase()] = dict[word.toLowerCase()]! + 1;
      }
    });

    dict.forEach((key, value) {
      list.add(WordFrequency(key, value));
    });

    list.sort((a, b) {
      if (a.frequency == b.frequency) {
        return a.word.compareTo(b.word);
      }

      return b.frequency - a.frequency;
    });

    if (n >= list.length) return list;

    return list.sublist(0, n);
  }
}
