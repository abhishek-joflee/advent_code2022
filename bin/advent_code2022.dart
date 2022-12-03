import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  File('input.txt').readAsString().then((String data) {
    final jsonData = json.encode(data).replaceAll(r'"', '');
    final allRucksack = jsonData.split(r'\n');
    int totalScore = 0;
    for (int i = 2; i < allRucksack.length; i += 3) {
      final res = priority(
        allRucksack[i - 2],
        allRucksack[i - 1],
        allRucksack[i],
      );
      totalScore += res;
    }
    print(totalScore);
  });
}

int priority(String data1, String data2, String data3) {
  final data1Ascii = getMyAscii(data1.runes);
  final data2Ascii = getMyAscii(data2.runes);
  final data3Ascii = getMyAscii(data3.runes);

  for (final i in data1Ascii) {
    if (data2Ascii.contains(i)) {
      if (data3Ascii.contains(i)) {
        return i;
      }
    }
  }
  return 0;
}

List<int> getMyAscii(Runes runes) {
  return runes.map((e) {
    final x = e - 96;
    if (x > 0) return x;
    return x + 58;
  }).toList();
}
