---
title: Projects!
category: Random
tags: code, projects
template: index.mustache
url: /projects
imports: 
    - ./projects.json
partials:
    - ./project.mustache
---

# Projects:


## A list of my projects:
<div id="projects">
<div class="uk-grid-small uk-grid-match uk-child-width-1-1@s uk-child-width-1-2@m uk-child-width-1-3@l uk-child-width-1-3@xl" uk-grid>
{{#projects}}
{{>project}}
{{/projects}}
</div>
</div>

