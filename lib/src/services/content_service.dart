import 'package:fanoos_http/fanoos_http.dart';

class ContentService {
  Future<String> getAboutMd() =>
      httpGet(
        url: 'api/content/about.md',
        bodyParser: _mdConfigRemover,
      );

  String _mdConfigRemover(String body) {
    var i = body.indexOf('---');
    i = body.indexOf('---', i + 3);
    return body.substring(i + 3);
  }
}