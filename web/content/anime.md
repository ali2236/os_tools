---
title: Anime List
tags: Anime, aligator Anime, ali ghanbari Anime
template: web/templates/index.mustache
url: /anime
imports:
    - web/content/data/anime.csv
---

# My Anime List

<p>Watched a total of <span id="anime-watchtime"></span> hours of anime</p>

<div id="animes" uk-grid>
{{#anime_list }}
{{>anime}}
{{/anime_list }}
</div>