import 'dart:io' as io;
import '../lib/os_memory_allocators.dart';
import 'package:pretty_json/pretty_json.dart';

const algorithms = [
  'Optimal Policy',
  'Least Recently Used',
  'First In First Out',
  'Clock Policy',
];

String get nextLine => io.stdin.readLineSync();

int get nextInt => int.tryParse(nextLine);

void main() {
  printPrettyJson(ClockPolicy().calculate([1, 2, 3, 4, 5, 2, 6, 3, 5, 2, 4, 6, 3, 4, 6, 2], 3).toMap());
  return;
  while (true) {
    try {
      readFromStdIn();
    } catch (e) {
      print(e);
    }
  }
}

void readFromStdIn() {
  int i = 0;
  print(algorithms.map((a) => '(${i++ + 1}) $a').join('\n'));
  MemoryAllocator alg = ({
        1: () => OptimalPolicyAllocator(),
        2: () => LeastRecentlyUsed(),
        3: () => FirstInFirstOut(),
        4: () => ClockPolicy(),
      }[i = nextInt] ?? throwException)();
  print('Selected: ${algorithms[i-1]}');
  final proc = nextLine.split(',').map(int.tryParse).toList();
  printPrettyJson(alg.calculate(proc, nextInt).toMap());
}

MemoryAllocator throwException() {
  throw 'invalid algorithm index!';
  return null;
}
