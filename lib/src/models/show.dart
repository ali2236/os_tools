
class Show {
  final String type;
  final String id;
  final String name;
  final int epsoideCount;
  final int epsoideLenght;
  final int score;

  Show({
    this.type = '',
    this.id = 'error',
    this.name = 'error',
    this.epsoideCount = 0,
    this.epsoideLenght = 0,
    this.score = 0,
  });

  String get imageUrl => '/static/upload/images/$type/$id.jpg';
}
