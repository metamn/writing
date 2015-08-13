{% extends '../../project/templates/default/default.html.swig' %}
{% block content %}

  <p>
    We are programmable biocomputers shaped by Culture.
    A culture controlled by state and capital, soon by Technology.
  </p>

  <p>
    This era could be about a new metasystem transition. For such a shift we need, first of all, new senses.
  </p>

  <p>
    A new perception about ourselves built bottom up, by a new generation, on new
    {% set link = { url: 'surreal-numbers', title: 'values', separator: '.' } %}
    {% include '../../framework/design/typography/elements/link/link.html.swig' %}
  </p>

{% endblock %}
