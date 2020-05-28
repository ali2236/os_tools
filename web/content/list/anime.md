---
title: Anime List
tags: Anime, aligator Anime, ali ghanbari Anime
template: index.mustache
url: /anime
imports:
    - web/content/list/anime.csv
---

# My Anime List

<p>Watched a total of <span id="anime-watchtime"></span> hours of anime</p>

<div id="animes">
{{#anime_list }}
<h3>{{ name }}</h3>  
<p>{{ score }}/10</p>
{{/anime_list }}
</div>