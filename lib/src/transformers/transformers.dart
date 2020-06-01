
import 'package:static_aligator_ir/src/transformers/markdown_transformer.dart';
import 'package:static_aligator_ir/src/transformers/mustache_transformer.dart';

final transformer = TransformerRegistry({
  'markdown' : MarkdownTransformer(),
  'mustache' : MustacheTransformer(),
});

class TransformerRegistry {

  final Map<String, Transformer> _transformers;

  TransformerRegistry(this._transformers);

  String apply(String input, String plugin, Map<String, dynamic> config){
    return _transformers[plugin].transform(input, config);
  }

  String applyAll(String input, List<String> transformers, Map<String, dynamic> config){
    var state = input;
    for(var transformer in transformers){
      state = apply(state, transformer, config);
    }
    return state;
  }

}

abstract class Transformer {

  String transform(String source, Map<String, dynamic> config);

}