import 'package:os_deadlock_avoidance/src/models/models.dart';

class BankerAvoidanceAlgorithm {
  List<String> isSafe(List<Process> process, List<int> available){
    final tproc = List.of(process);
    final tavi = List.of(available);
    final n = available.length;
    var doneProcesses = 0;
    final result = <String>[];
    while(doneProcesses<process.length) {
      Process fountOne; // step 1
      for (var p in tproc) { // step 1
        var resourceAvailable = true;
        var needed = p.need;
        for (var i = 0; i < n; i++) { // step 1
          if (needed[i] > tavi[i]) {
            resourceAvailable = false;
            break;
          }
        }
        if (resourceAvailable) { // step 2
          result.add(p.label);
          for(var i = 0; i < n; i++){ // step 2
            tavi[i] += p.allocated[i];
          }
          doneProcesses++;
          fountOne = p;
          break;
        }
      }
      if(fountOne==null) {
        return null;
      } else {
        tproc.remove(fountOne);
      }
    }
    return result;
  }
}