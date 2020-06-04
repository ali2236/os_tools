import 'dart:html';

void main() {
  var watchTime = 0;
  for(var anime in querySelectorAll('.anime')){
    watchTime += int.tryParse(anime.attributes['ep']) * int.tryParse(anime.attributes['len']);
  }
  querySelector('#anime-watchtime').text = watchTime.toString();
}