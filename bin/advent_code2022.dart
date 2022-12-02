import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  File('input.txt').readAsString().then((String data) {
    final jsonData = json.encode(data).replaceAll(r'"', '');
    final allMatches = jsonData.split(r'\n');
    int totalScore = 0;
    for (final match in allMatches) {
      final res = score(match);
      totalScore += res;
    }

    print(totalScore);
  });
}

int score(String data) {
  String opponentMove = data.split(r' ')[0];
  String yourMove = data.split(r' ')[1];
  int choicePoints = points[yourMove] ?? 0;
  final result = opponentMove.match(yourMove);
  print(
      'Match($opponentMove $yourMove): $choicePoints + $result = ${choicePoints + result}');
  choicePoints += result;
  return choicePoints;
}

const points = {
  'X': 1,
  'Y': 2,
  'Z': 3,
};

extension RockPaperScissor on String {
  int match(String me) {
    final opp = this;

    // rock
    if (opp == 'A') {
      if (me == 'X') return 3; // rock - draw
      if (me == 'Y') return 6; // paper - won
      if (me == 'Z') return 0; // scissor - loos
    }

    // paper
    if (opp == 'B') {
      if (me == 'X') return 0; // rock - loose
      if (me == 'Y') return 3; // paper - draw
      if (me == 'Z') return 6; // scissor - won
    }

    // scissor
    if (opp == 'C') {
      if (me == 'X') return 6; // rock - won
      if (me == 'Y') return 0; // paper - loose
      if (me == 'Z') return 3; // scissor - draw
    }
    return 0;
  }
}
