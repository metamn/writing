{% import "../../../framework/helpers/linklist/linklist.swig" as l  %}

<aside class="article__meta">
  <h3>Article meta</h3>

  {% if categories %}
    <p class="categories">
      {% set linklist = l.linklist(categories, site.tags) %}
      # {{ linklist | raw }}
    </p>
  {% endif %}

  {% if date %}
    <p class="date">
      {{ date }}
    </p>
  {% endif %}
</aside>
