{% import "../../../framework/helpers/linklist/linklist.swig" as l  %}

<aside class="article__meta">
  <h3>Article meta</h3>

  <p class="senses">
    {% set linklist = l.linklist(senses, site.tags) %}
    This story is about {{ linklist | raw }}
  </p>

  <p class="categories">
    {% set linklist = l.linklist(categories, site.tags) %}
    With focus on {{ linklist | raw }}
  </p>
</aside>
