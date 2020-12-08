class Persona {
  final String name, birthYear, deathYear, about, likes, dislikes, nameOrigin;

  Persona({
    this.name = '-',
    this.birthYear = '-',
    this.deathYear = '-',
    this.about = '-',
    this.likes = '-',
    this.dislikes = '-',
    this.nameOrigin = '-',
  });

  List<String> toList() => [name, birthYear, deathYear, about, nameOrigin, likes, dislikes];

}

final personas = [
  Persona(
    name: 'Ali Ghanbari',
    birthYear: '2000',
    about: 'This is the real Ali Ghanbari that you can meet in the real world.'
        ' he was always the quiet kid in the group and prefers to spend his time in front of his computer.',
    nameOrigin: 'His mom and dad named him "Ali".',
    likes: 'Anything that\'s bizarre, new and unpredictable',
    dislikes: 'Lying',
  ),
  Persona(
    name: 'Aligator',
    birthYear: '2016',
    about: 'Aligator is the hardcore Gamer/Weeb/Programmer side of Ali Ghanbari.',
    nameOrigin: 'Named after his favorite childhood youtuber, "sl1pg8r".',
    likes: 'Memes',
    dislikes: 'Stock market',
  ),
  Persona(
    name: 'ali2236',
    birthYear: '2013',
    nameOrigin: 'It\'s his first name + a random 4 digit number.',
    about: 'Ali2236 really likes tech(specially smartphones) and represents the Geek side of Ali Ghanbari.',
    likes: 'Computer hardware',
    dislikes: 'Samsung phones',
  ),
  Persona(
    name: 'Ori',
    birthYear: '2009',
    deathYear: '2013',
    about: 'The Simple minded kid from your childhood.',
    nameOrigin: 'Ori, a miss hearing of the name "Rory". a character from doctor who.',
    likes: 'Reading',
    dislikes: 'Speaking',
  )
];
