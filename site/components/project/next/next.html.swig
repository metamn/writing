{% import "../../framework/helpers/prevnext/prevnext.swig" as p  %}
{% set prevnext = p.prevnext(articles, title) %}

<nav class="next">
  <h3>Next article</h3>

  {{ prevnext | safe }}
</nav>
