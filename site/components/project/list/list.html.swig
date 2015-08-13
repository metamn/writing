<nav class="list">
  <h3 class="list__title">{{ list.title }}</h3>

  {% if list.type == "tags" %}
    {% include '--tags/list-tags.html.swig' %}
  {% endif %}
</nav>
