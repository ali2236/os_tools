import 'package:markdown/markdown.dart';

import 'transformers.dart';

class MarkdownTransformer extends Transformer {
  @override
  String transform(String source, Map<String, dynamic> config) {
    return markdownToHtml(source);
  }
}
