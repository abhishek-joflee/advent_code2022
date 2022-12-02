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
  choicePoints += result;
  return choicePoints;
}

const points = {
  'X': 0,
  'Y': 3,
  'Z': 6,
};

extension RockPaperScissor on String {
  int match(String me) {
    final opp = this;

    // rock
    if (opp == 'A') {
      if (me == 'X') return 3; // loose - scissor
      if (me == 'Y') return 1; // draw - rock
      if (me == 'Z') return 2; // win - paper
    }

    // paper
    if (opp == 'B') {
      if (me == 'X') return 1; // loose - rock
      if (me == 'Y') return 2; // draw - paper
      if (me == 'Z') return 3; // win - scissor
    }

    // scissor
    if (opp == 'C') {
      if (me == 'X') return 2; // loose - paper
      if (me == 'Y') return 3; // draw - scissor
      if (me == 'Z') return 1; // win - rock
    }
    return 0;
  }
}
