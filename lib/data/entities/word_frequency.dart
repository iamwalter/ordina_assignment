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
