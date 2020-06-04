---
title: Projects!
category: Random
tags: code, projects
template: index.mustache
url: /projects
imports: 
    - content/projects.csv
---

# Projects:

## A list of my projects:
<div>
{{#projects}}
{{#valid}}
<div>
<div>
{{ name }}
</div>
<div>
{{ about }}
</div>
</div>
{{/valid}}
{{/projects}}
</div>