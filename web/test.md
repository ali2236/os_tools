---
title: Test
category: Random
tags: code, dart
template: index.mustache
items:
    - name: sosis
      price: 500
    - name: call bus
      price: 800
    
---

A list of Items:

{{#items}}
<p>{{ . }}</p>
{{/items}}
