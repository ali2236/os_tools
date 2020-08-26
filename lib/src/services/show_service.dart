import 'package:fanoos_http/fanoos_http.dart';

import '../models/show.dart';

class ShowService {
  Future<List<Show>> getShowList(String type) {
    return httpGet(
      url: '/api/$type/$type.csv',
      bodyParser: (csv) {
        final rows = csv.split('\n').skip(1);
        var list = <Show>[];
        for (var row in rows) {
          final r = row.split(',').map((e) => e.trim()).toList();
          if (r.length != 5) continue;
          final anime = Show(
            type: type,
            id: r[0],
            name: r[1],
            epsoideCount: int.tryParse(r[2]),
            epsoideLenght: int.tryParse(r[3]),
            score: int.tryParse(r[4]),
          );
          list.add(anime);
        }
        return list;
      },
    );
  }
}
