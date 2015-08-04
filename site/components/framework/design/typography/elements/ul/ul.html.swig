<ul class="ul">
  {% for item in items %}
    <li>{{ item | safe }}</li>
  {% endfor %}
</ul>
