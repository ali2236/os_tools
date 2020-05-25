---
title: Projects!
category: Random
tags: code, projects
template: index.mustache
projects:
    - name: Prayer Times
      about: Prayer Times app
---

# Projects:

## A list of my projects:
<div>
{{#projects}}
    {{> project_card }}
{{/projects}}
</div>