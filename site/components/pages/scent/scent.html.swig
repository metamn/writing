{% extends '../../project/templates/default/default.html.swig' %}{% block content %}
<p>
Humour has scent. Scent is style. 
And as we know the scent is the man […] because humour is worldview.
</p>

{% set person = page.people[0] %} 
{% set status = 'opened' %}
{% include '../../framework/structure/figure/figure.html.swig' %}
{% endblock %}