import 'video_content.dart';

class Anime extends VideoContent {
  Anime(String name, int episodeCount, int episodeLength, int score)
      : super(name, episodeCount, episodeLength, score);
}

final anime_list = [
  Anime('Gyakkyou Burai Kaiji: Ultimate Survivor', 26, 23, 10),
  Anime('Gyakkyou Burai Kaiji: Hakairoku-hen', 26, 24, 10),
  Anime('Shingeki no Kyojin Season 3 Part 2', 10, 23, 10),
  Anime('Bungou Stray Dogs 3rd Season', 12, 23, 10),
  Anime('Monster', 74, 24, 10),
  Anime('Arslan Senki', 25, 24, 10),
  Anime('Touhai Densetsu Akagi: Yami ni Maiorita Tensai', 26, 23, 10),
  Anime('Code Geass: Hangyaku no Lelouch', 25, 24, 10),
  Anime('Overlord', 13, 24, 10),
  Anime('Ixion Saga DT', 25, 24, 10),
  Anime('Nanatsu no Taizai: Imashime no Fukkatsu', 24, 24, 10),
  Anime('JoJo no Kimyou na Bouken', 26, 24, 10),
  Anime('Fullmetal Alchemist(2003)', 51, 24, 10),
  Anime('Yakusoku no Neverland', 12, 22, 10),
  Anime('Kuroshitsuji II', 12, 24, 10),
  Anime('Death Note', 37, 23, 10),
];