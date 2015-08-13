{% extends '../../project/templates/default/default.html.swig' %}{% block content %}
<p>
The century of America literally killed all that part of the human <em>spirit</em> which is not tied to fear or to pragmatism.
</p>
<p>
This second century of America will literally kill all human <em>life</em> which won’t be tied to fear or to pragmatism.
</p>

{% set person = page.people[0] %} 
{% set status = 'opened' %}
{% include '../../framework/structure/figure/figure.html.swig' %}
{% endblock %}