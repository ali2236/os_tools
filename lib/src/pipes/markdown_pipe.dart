import 'package:angular/angular.dart';
import 'package:markdown/markdown.dart';

@Pipe('md')
class MarkdownPipe implements PipeTransform {
  String transform(value) => markdownToHtml(
        value,
        extensionSet: ExtensionSet.gitHubFlavored,
      );
}
