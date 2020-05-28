---
title: Projects!
category: Random
tags: code, projects
template: index.mustache
imports: 
    - web/content/projects.csv
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