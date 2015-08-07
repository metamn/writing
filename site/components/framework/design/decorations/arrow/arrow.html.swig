{% if arrow.item.title %}
  <div class="arrow active">
    <a class="link" href="{{ site.url }}{{ arrow.item.url }}" title="{{ arrow.item.title }}">
      {% if arrow.direction == 'left' %}
        <span class="arrow__icon arrow__icon--left">&larr;</span>
        <span class="arrow__text">{{ arrow.item.title }}</span>
      {% endif %}

      {% if arrow.direction == 'right' %}
        <span class="arrow__text">{{ arrow.item.title }}</span>
        <span class="arrow__icon arrow__icon--right">&rarr;</span>
      {% endif %}
    </a>
  </div>
{% else %}
  <div class="arrow inactive">
    <span class="arrow__icon">
      {% if arrow.direction == 'left' %}&larr;{% endif %}
      {% if arrow.direction == 'right' %}&rarr;{% endif %}
    </span>
  </div>
{% endif %}
