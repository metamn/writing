<div class="meta__body">

  {% include '../categories/categories.html.swig' %}

  <p class="archives">
    + {% set link = site.menu.links | first %}
    {% include '../../../framework/design/typography/elements/link/link.html.swig' %}
  </p>
</div>
