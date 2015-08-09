{% import "../../../framework/helpers/linklist/linklist.swig" as l  %}

<aside class="article__meta">
  <h3>Article meta</h3>

  {% if categories %}
    <p class="categories">
      {% set linklist = l.linklist(categories, site.tags) %}
      # {{ linklist | raw }}
    </p>
  {% endif %}

  <p class="archives">
    + {% set link = site.menu.links | first %}
    {% include '../../../framework/design/typography/elements/link/link.html.swig' %}
  </p>
</aside>
