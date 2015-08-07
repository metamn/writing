{% import "../../../framework/helpers/linklist/linklist.swig" as l  %}
{% import "../../../framework/helpers/classname/classname.swig" as c  %}

<aside class="article__meta">
  <h3>Article meta</h3>

  <p class="senses">
    This story is about
    {% set first = categories | first %}
    {% set classname = c.classname(first) %}
    {% set url_parts = [site.tags, classname] %}
    {% set url = url_parts | join('/') %}
    {% set separator = '.' %}
    {% set link = { title: first, url: url, separator: separator } %}
    {% include '../../../framework/design/typography/elements/link/link.html.swig' %}
  </p>

  <p class="categories">
    {% set linklist = l.linklist(categories, site.tags) %}
    With focus on {{ linklist | raw }}
  </p>
</aside>
