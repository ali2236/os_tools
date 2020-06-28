---
title: Anime List
tags: Anime, aligator Anime, ali ghanbari Anime
template: index.mustache
url: /movies
partials:
    - ./movie.mustache
imports:
    - ./movies.csv
---
# My Movie List

{{> movie}}

<script src="static/scripts/watchtime.dart.js"></script>