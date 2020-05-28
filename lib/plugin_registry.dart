

import 'plugins/anime_list.dart';

final pluginRegistry = PluginRegistry({
});

typedef HtmlTransformer = String Function(String html);

class PluginRegistry {

  final Map<String, HtmlTransformer> plugins;

  PluginRegistry(this.plugins);

  void addPlugin(String name,HtmlTransformer plugin){
    plugins.addAll({
      name : plugin,
    });
 }

  String apply(String input, String plugin){
    return plugins[plugin](input);
  }

  String applyAll(String input, List<String> plugins){
    var state = input;
    for(var plugin in plugins){
      state = apply(state, plugin);
    }
    return state;
  }

}