# static.aligator.ir 
[![Netlify Status](https://api.netlify.com/api/v1/badges/bbe851b0-aec2-498b-a94f-0f77e98abe6c/deploy-status)](https://app.netlify.com/sites/laughing-lalande-7c4a0a/deploys)

The most complex static Html website

#### description
This project uses dart builders to generate a static html+css+js site from the contents of the `web` folder.

## static builders

The site is generated by a collection of builders.

#### markdown_builder
input : markdown, mustache

output: html

#### sitemap_builder
input: all html files

output: sitemap.xml

#### cleanup_builder
input: Markdown, mustache

output: deletes them

Currently doesn't work

#### web_compilers(by dart.dev)
input: dart

output: js

#### sass_builder(by sass-lang)
input: sass, scss

output: css
