{% macro prevnext(items, current) -%}

  {% for item in items %}
    {% if item.title == current %}
      {% set prev_index = loop.index - 1 %}
      {% set next_index = loop.index + 1 %}
    {% endif %}
  {% endfor %}

  {% for item in items %}
    {% if loop.index == prev_index %}
      {% set prev = item %}
    {% endif %}

    {% if loop.index == next_index %}
      {% set next = item %}
    {% endif %}
  {% endfor %}

  {% set arrow = { item: prev, direction: 'left' } %}
  {% include '../../design/decorations/arrow/arrow.html.swig' %}

  {% set arrow = { item: next, direction: 'right' } %}
  {% include '../../design/decorations/arrow/arrow.html.swig' %}
{%- endmacro %}
