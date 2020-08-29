
class Show {
  final String type;
  final String id;
  final String name;
  final int episodeCount;
  final int episodeLength;
  final int score;

  Show({
    this.type = '',
    this.id = 'error',
    this.name = 'error',
    this.episodeCount = 0,
    this.episodeLength = 0,
    this.score = 0,
  });

  String get imageUrl => '/static/upload/images/$type/$id.jpg';
}
