import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:markdown/markdown.dart';

/*
void main() {
  final links = querySelectorAll('a');
  links.forEach((a){
    var link = a.getAttribute('href');
    a.onClick.listen((_)=> load(link));
    a.removeAttribute('href');
  });
  load('/');
}

void load(String source) {
  if(source=='/') source = 'index';
  final content = querySelector('#content');
  final address = '/$source.md';
  http.get(address).then((sc) {
    content.innerHtml = markdownToHtml(sc.body);
  }).catchError((error) {
    content.innerText = error.toString();
  });
}
*/
