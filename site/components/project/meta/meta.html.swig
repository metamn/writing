<aside class="meta">
  <h3 class="meta__title">Meta</h3>

  {% include 'categories/categories.html.swig' %}

  <p class="archives">
    + {% set link = site.menu.links | first %}
    {% include '../../framework/design/typography/elements/link/link.html.swig' %}
  </p>
</aside>
