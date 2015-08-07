{% include '../head/head.html.swig' %}

<article class="article">
  <h3 class="article__title">{{ title }}</h3>

  <div class="article__body">
    {% block content %}{% endblock %}
  </div>

  {% include '../../article/__meta/article__meta.html.swig' %}
  {% include '../../article/__next/article__next.html.swig' %}
</article>


{% include '../../menu/menu.html.swig' %}
{% include '../../header/header.html.swig' %}
{% include '../scripts/scripts.html.swig' %}
