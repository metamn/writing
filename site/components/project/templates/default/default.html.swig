{% include '../head/head.html.swig' %}

<article class="article">
  <h3 class="article__title">{{ title }}</h3>

  <div class="article__body">
    {% block content %}{% endblock %}
  </div>

  {% if categories %}
    {% include '../../article/__meta/article__meta.html.swig' %}
  {% endif %}
</article>


{% include '../../menu/menu.html.swig' %}
{% include '../../header/header.html.swig' %}
{% include '../scripts/scripts.html.swig' %}
