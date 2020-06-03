---
title: Projects!
category: Random
tags: code, projects
template: web/templates/index.mustache
imports: 
    - web/content/data/projects.csv
---

# Projects:

## A list of my projects:
<div>
{{#projects }}
<div>
<div>
{{ name }}
</div>
<div>
{{ about }}
</div>
</div>
{{/projects }}
</div>