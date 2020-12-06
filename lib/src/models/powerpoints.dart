import 'package:angular_components/utils/browser/window/new_window_opener.dart';

class PowerPoint implements Comparable<PowerPoint>{
  final String name;
  final String date;
  final String presented;
  final String download;

  PowerPoint(this.name, this.date, this.presented, this.download);

  factory PowerPoint.fromJson(Map<String, dynamic> json) {
    return PowerPoint(json['name'], json['date'], json['presented'], json['download']);
  }

  void openDownloadLink(){
    openInNewWindow(downloadLink);
  }

  String get downloadLink => '/static/upload/powerpoints/$download';

  int get _date => int.tryParse(date.replaceAll('/', ''));

  @override
  int compareTo(PowerPoint other) {
    return other._date.compareTo(_date);
  }
}