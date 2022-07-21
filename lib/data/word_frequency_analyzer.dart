import 'package:ordina_assignment/data/entities/word_frequency.dart';

abstract class WordFrequencyAnalyzer {
  /// CalculateFrequencyForWord should return the frequency of the specified word
  int calculateFrequencyForWord(String text, String word);

  /// CalculateHighestFrequency should return the highest frequency in the text
  /// (several words might actually have this frequency)
  int calculateHighestFrequency(String text);

  /// CalculateMostFrequentNWords should return a list of the most frequent „n‟
  /// words in the input text, all the words returned in lower case. If several
  /// words have the same frequency, this method should return them in ascendant
  /// alphabetical order (for input text “The sun shines over the lake” and n = 3,
  /// it should return the list [{“the”, 2}, {“lake”, 1}, {“over”, 1}]
  List<WordFrequency> calculateMostFrequentNWords(String text, int n);
}
