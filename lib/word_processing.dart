class WordFrequency {
  final String word;
  final int frequency;

  WordFrequency(this.word, this.frequency);

  @override
  String toString() {
    return "{'$word', $frequency}";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordFrequency &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          frequency == other.frequency;

  @override
  int get hashCode => word.hashCode ^ frequency.hashCode;
}

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
      if (!dict.containsValue(word.toLowerCase()) && word != '') {
        dict[word.toLowerCase()] = calculateFrequencyForWord(text, word);
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
