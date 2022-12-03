import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  File('input.txt').readAsString().then((String data) {
    final jsonData = json.encode(data).replaceAll(r'"', '');
    final allRucksack = jsonData.split(r'\n');
    int totalScore = 0;
    for (final ruck in allRucksack) {
      final res = priority(
        ruck.substring(0, ruck.length ~/ 2),
        ruck.substring(ruck.length ~/ 2),
      );
      totalScore += res;
    }
    print(totalScore);
  });
}

int priority(String data1, String data2) {
  final data1Ascii = getMyAscii(data1.runes);
  final data2Ascii = getMyAscii(data2.runes);

  for (final i in data1Ascii) {
    if (data2Ascii.contains(i)) {
      return i;
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
