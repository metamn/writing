{% extends '../../project/templates/default/default.html.swig' %}{% block content %}
<p>
  Is engagement, commitment, mindset. With something or somebody. Nothing more.
</p>

{% set person = page.people[0] %} 
{% set status = 'opened' %}
{% include '../../framework/structure/figure/figure.html.swig' %}
{% endblock %}