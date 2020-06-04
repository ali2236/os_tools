import 'package:mustache/mustache.dart';
import 'package:static_aligator_ir/src/transformers/transformers.dart';

class MustacheTransformer extends Transformer {
  @override
  String transform(String source, Map<String, dynamic> config) {
    return Template(source, partialResolver: (name) => config['partialResolver'][name])
        .renderString(config);
  }
}
