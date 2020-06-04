import 'dart:html';

void main() {
  var watchTime = 0;
  for(var anime in querySelectorAll('.anime')){
    watchTime += int.tryParse(anime.attributes['ep']) * int.tryParse(anime.attributes['len']);
  }
  querySelector('#anime-watchtime-hours').text = (watchTime ~/ 60).toString();
  querySelector('#anime-watchtime-minutes').text = (watchTime % 60).toString();
}