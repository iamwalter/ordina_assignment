import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ordina_assignment/word_processing.dart';

void main() {
  const text =
      "good hello hello good hellohello how are you hello good bye ?? !! )2 &#* good good bye (@&#(! hello bye";

  final wordAnalyzer = WordFrequencyAnalyzerImpl();

  test('calculateFrequencyForWord', () {
    int expected = 4;
    int actual = wordAnalyzer.calculateFrequencyForWord(text, "hello");

    expect(actual, expected);

    expected = 3;
    actual = wordAnalyzer.calculateFrequencyForWord(text, "bye");

    expect(actual, expected);

    expected = 5;
    actual = wordAnalyzer.calculateFrequencyForWord(text, "good");

    expect(actual, expected);
  });

  test('calculateHighestFrequency', () {
    int expected = 5;
    int actual = wordAnalyzer.calculateHighestFrequency(text);

    expect(actual, expected);
  });

  test('calculateMostFrequentNWords', () {
    /// alphabetical order (for input text “The sun shines over the lake” and n = 3,
    /// it should return the list [{“the”, 2}, {“lake”, 1}, {“over”, 1}]
    String testStr = "The sun shines over the lake";

    List<WordFrequency> expected = [
      WordFrequency("the", 2),
      WordFrequency("lake", 1),
      WordFrequency("over", 1),
    ];

    List<WordFrequency> actual =
        wordAnalyzer.calculateMostFrequentNWords(testStr, 3);

    expect(actual, expected);
  });
}
