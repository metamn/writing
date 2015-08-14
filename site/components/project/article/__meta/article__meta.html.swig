{% import "../../../framework/helpers/classname/classname.swig" as c  %}


<aside class="article__meta">
  <h3>Article meta</h3>

  {% if categories %}
    <p class="categories">
    #
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
    </p>
  {% endif %}

  <p class="archives">
    + {% set link = site.menu.links | first %}
    {% include '../../../framework/design/typography/elements/link/link.html.swig' %}
  </p>
</aside>
