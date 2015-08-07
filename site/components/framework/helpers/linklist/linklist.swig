---
title: Linklist
description: Generate a list of links
---

{% macro linklist(items, prefix) -%}
  {% import "../classname/classname.swig" as c  %}

  {% for item in items -%}
    {% if !loop.first %}
      {% set classname = c.classname(item) %}
      {% set url_parts = [prefix, classname] %}
      {% set url = url_parts | join('/') %}
      {% set separator = ', ' %}
      {% if loop.last %}
        {% set separator = '.' %}
      {%- endif %}
      {% set link = { title: item, url: url, separator: separator } %}
      {% include '../..//design/typography/elements/link/link.html.swig' %}
    {% endif %}
  {%- endfor %}
{%- endmacro %}
