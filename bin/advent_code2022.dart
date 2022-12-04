import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  File('input.txt').readAsString().then((String data) {
    final jsonData = json.encode(data).replaceAll(r'"', '');
    final allPairs = jsonData.split(r'\n');
    int totalScore = 0;
    for (int i = 0; i < allPairs.length; i++) {
      if (isOverlapping(allPairs[i])) {
        totalScore += 1;
      }
    }
    print(totalScore);
  });
}

bool isOverlapping(String data) {
  final firstPair = parsePair(data.split(',')[0]);
  final secondPair = parsePair(data.split(',')[1]);

  // -- PART 1 --
  // return (firstPair.first <= secondPair.first &&
  //         firstPair.last >= secondPair.last) ||
  //     (secondPair.first <= firstPair.first &&
  //         secondPair.last >= firstPair.last);

  // -- PART 2 --
  return firstPair.last >= secondPair.first &&
      firstPair.first <= secondPair.last;
}

Iterable<int> parsePair(String data) {
  return [data.split('-')[0], data.split('-')[1]].map(int.parse);
}
