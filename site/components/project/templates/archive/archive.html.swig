{% include '../head/head.html.swig' %}

<section class="archive">
  <h3 class="archive__title">{{ title }}</h3>

  {% block content %}{% endblock %}
</section>

{% include '../../header/header.html.swig' %}
{% include '../scripts/scripts.html.swig' %}
