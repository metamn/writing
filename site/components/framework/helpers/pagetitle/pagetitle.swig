---
title: Page title
description: Generate page title
example:
  - input: Home, Metamn
  - output: Home -- Metamn
---

{% macro pagetitle(page_title, site_title) -%}
  {% if page_title == "Home" %}{{ site_title }}{% else %}{{ page_title }} &mdash; {{ site.title }}{% endif %}
{%- endmacro %}
