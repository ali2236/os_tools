---
title: Anime List
tags: Anime, aligator Anime, ali ghanbari Anime
template: index.mustache
url: /anime
partials:
    - ./anime.mustache
imports:
    - ./anime.csv
---
# My Anime List

{{> anime}}

<script src="static/scripts/watchtime.dart.js"></script>