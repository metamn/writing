{% import "../../../framework/helpers/classname/classname.swig" as c  %}

{% if categories %}
  <p class="categories">
    <span class='categories__icon'>#</span>
    <span class="categories__list">
      {% for category in categories %}
        {% for archive in archives %}
          {% if category == archive.category %}
            {% if archive.articles[1] %}

              {% set classname = c.classname(category) %}
              {% set url_parts = [site.tags, classname] %}
              {% set url = url_parts | join('/') %}
              {% set link = { title: category, url: url, separator: ' ' } %}
              {% include '../../../framework/design/typography/elements/link/link.html.swig' %}

            {% endif %}
          {% endif %}
        {% endfor %}
      {% endfor %}
    </span>
  </p>
{% endif %}
