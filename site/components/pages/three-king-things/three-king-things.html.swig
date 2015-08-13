{% extends '../../project/templates/default/default.html.swig' %}{% block content %}
<p>
There are three things one can really do today: 
art, science and free physical work.
</p>

{% set person = page.people[0] %} 
{% set status = 'opened' %}
{% include '../../framework/structure/figure/figure.html.swig' %}


{% endblock %}