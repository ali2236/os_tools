import 'dart:io' as io;
import 'os_deadlock_avoidance.dart';

String get nextLine => io.stdin.readLineSync();

int get nextInt => int.tryParse(nextLine);

List<int> get nextIntList => nextLine.split(' ').map(int.tryParse).toList();

void main(List<String> arguments) {

  print('<(n)umber of process>\n<resource type (c)ount>');
  final n = nextInt;
  final c = nextInt;

  print('input $n lines of $c max resources:');
  final maxes = List.generate(
    n,
    (i) => nextIntList,
  );

  print('input $n lines of $c allocated resources:');
  final allocated = List.generate(
    n,
    (i) => nextIntList,
  );

  print('$c numbers for available resources:');
  final available = nextIntList;

  final processes = List.generate(
    n,
    (i) => Process(
      'P${i + 1}' /*String.fromCharCode('A'.codeUnits.first + i)*/ ,
      maxes[i],
      allocated[i],
    ),
  );

  var algo = BankerAvoidanceAlgorithm();
  var safe = algo.isSafe(processes, available);
  print('safe: $safe');
}