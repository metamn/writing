---
title: Link
description: Generate link url and title
---

{% macro link(link) -%}
  {#
    - if link.url is not defined we will get it from the title itself
  #}

  {% import "../classname/classname.swig" as c  %}
  {% if link.url == '' %}
    {% set url = c.classname(link.title) %}
  {% else %}
    {% set url = link.url %}
  {% endif %}

  {% set title = link.title %}


  {#
    - internal, external and mailto URLs are all handled
  #}


  {% set base_url = site.url %}

  {% if link.type == "email" %}
    {% set base_url = "mailto:" %}
  {% elseif link.type == "external" %}
    {% set base_url = '' %}
  {% endif %}

  <a class="link" href="{{ base_url }}{{ url }}" title="{{ title }}">
{%- endmacro %}
