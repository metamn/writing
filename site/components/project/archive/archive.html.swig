<section class="archive">
  <h3 class="archive__title">{{ title }}</h3>

  {% include '__intro/archive__intro.html.swig' %}

  {% set m = articles | first %}
  {{ m.title }}
</section>
