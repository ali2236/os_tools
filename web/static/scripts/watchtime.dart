import 'dart:html';

void main() {
  var watchTime = 0;
  for(var content in querySelectorAll('.watchable')){
    watchTime += int.tryParse(content.attributes['ep']) * int.tryParse(content.attributes['len']);
  }
  querySelector('#watchtime-hours').text = (watchTime ~/ 60).toString();
  querySelector('#watchtime-minutes').text = (watchTime % 60).toString();
}