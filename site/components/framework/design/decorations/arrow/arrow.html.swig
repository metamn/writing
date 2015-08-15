{% if arrow.item.title %}
  <div class="arrow active">
    <a class="link" href="{{ site.url }}{{ arrow.item.url }}" title="{{ arrow.item.title }}">
      {% if arrow.direction == 'left' %}
        <span class="arrow__icon arrow__icon--left">&lsaquo;</span>
        <span class="arrow__text">{{ arrow.item.title }}</span>
      {% endif %}

      {% if arrow.direction == 'right' %}
        <span class="arrow__text">{{ arrow.item.title }}</span>
        <span class="arrow__icon arrow__icon--right">&rsaquo;</span>
      {% endif %}
    </a>
  </div>
{% else %}
  <div class="arrow inactive">
    <span class="arrow__icon">
  {% if arrow.direction == 'left' %}&lsaquo;{% endif %}
  {% if arrow.direction == 'right' %}&rsaquo;{% endif %}
    </span>
  </div>
{% endif %}
