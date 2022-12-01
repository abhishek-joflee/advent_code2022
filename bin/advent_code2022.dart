import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  File('input2021.txt').readAsString().then((String data) {
    final jsonData = json.encode(data).replaceAll(r'"', '');
    final x = jsonData.split(r'\n');
    int result = 0;
    for (var i = 2; i < x.length - 1; i++) {
      final prev = int.parse(x[i - 2]) + int.parse(x[i - 1]) + int.parse(x[i]);
      final current =
          int.parse(x[i - 1]) + int.parse(x[i]) + int.parse(x[i + 1]);
      if (current > prev) {
        result += 1;
      }
    }
    print(result);
  });
}
