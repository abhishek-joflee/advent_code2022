import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  void updateStack(List<Stack<String>> stack, String process) {
    int count = int.parse(process.split(r' ')[1]);
    final fromStack = int.parse(process.split(r' ')[3]) - 1;
    final toStack = int.parse(process.split(r' ')[5]) - 1;

    // --PART 1--
    // while (count != 0) {
    //   stack[toStack].push(stack[fromStack].pop());
    //   count -= 1;
    // }

    // --PART 2--
    final tempStack = Stack<String>();
    while (count != 0) {
      tempStack.push(stack[fromStack].pop());
      count -= 1;
    }
    while (tempStack.isNotEmpty) {
      stack[toStack].push(tempStack.pop());
    }
  }

  File('input.txt').readAsString().then((String data) {
    final jsonData = json.encode(data).replaceAll(r'"', '');
    final allData = jsonData.split(r'\n');
    final breakPoint = allData.indexOf(r"");
    final allStacks = allData.getRange(0, breakPoint).toList();

    // my stack
    final listOfStacks = allStacks.map(convertToStack).toList();

    // apply process
    for (var i = breakPoint + 1; i < allData.length; i++) {
      updateStack(listOfStacks, allData[i]);
    }
    print(listOfStacks);
    final res = listOfStacks.map((e) => e.peek).join();
    print(res);
  });
}

Stack<String> convertToStack(String data) {
  final st = Stack<String>();
  for (var i = data.length - 1; i >= 0; i--) {
    st.push(data[i]);
  }
  return st;
}

class Stack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);

  E pop() => _list.removeLast();

  E get peek => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}
