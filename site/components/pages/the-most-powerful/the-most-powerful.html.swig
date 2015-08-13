{% extends '../../project/templates/default/default.html.swig' %}{% block content %}
<p>
Mercy is more powerful than law.
</p>

{% set person = page.people[0] %} 
{% set status = 'opened' %}
{% include '../../framework/structure/figure/figure.html.swig' %}
{% endblock %}