import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  File('input.txt').readAsString().then((String data) {
    final jsonData = json.encode(data).replaceAll(r'"', '');
    final x = jsonData.split(r'\n\n');
    final result = x
        .map(
          (e) => stringSum(e.split(r'\n')),
        )
        .toList();
    print(result);
    final mx = result.reduce(max);
    print('max is : $mx & its index is: ${result.indexOf(mx)}');
  });
}

int stringSum(List<String> data) {
  int result = 0;
  for (final i in data) {
    result += int.parse(i);
  }
  return result;
}
