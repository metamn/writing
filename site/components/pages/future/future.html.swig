{% extends '../../project/templates/default/default.html.swig' %}{% block content %}
<p>
  The future already exists. If you really want something to happen think about it as it was already happened in the past.
</p>

{% set person = page.people[0] %} 
{% set status = 'opened' %}
{% include '../../framework/structure/figure/figure.html.swig' %}
{% endblock %}