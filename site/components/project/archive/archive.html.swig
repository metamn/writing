<section class="archive">
  <h3 class="archive__title">{{ title }}</h3>

  {% include '__intro/archive__intro.html.swig' %}

  {% set list = { title: "Senses", type: "tags", collection: "senses" } %}
  {% include '../list/list.html.swig' %}
</section>
