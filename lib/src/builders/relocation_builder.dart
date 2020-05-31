import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:static_aligator_ir/builders.dart';


PostProcessBuilder relocationBuilder(BuilderOptions options) => RelocationBuilder();

class RelocationBuilder extends PostProcessBuilder {

  @override
  FutureOr<void> build(PostProcessBuildStep buildStep) async {

    //log.fine(jsonEncode(MarkdownBuilder.urls));
    //log.fine('investigating ${buildStep.inputId.path}');

    final outputPath = MarkdownBuilder.urls[buildStep.inputId.path];

    if(outputPath!=null){
      //log.fine('output path exits!');
      final output = AssetId(buildStep.inputId.package, outputPath);
      //log.fine('built outputId $output');
      final input = await buildStep.readInputAsString();
      //log.fine('read input content');
      await buildStep.writeAsString(output, input);
      //log.fine('written to output');
      await buildStep.deletePrimaryInput();
      //log.fine('deleted input');

      log.fine('relocated ${buildStep.inputId.path} to $outputPath');
    }
  }

  @override
  final inputExtensions = const ['.html'];
}
