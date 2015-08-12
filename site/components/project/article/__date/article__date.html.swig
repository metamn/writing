<aside class="article__date">
  <h3>Article date</h3>

  {% if date %}
    <p class="date">
      {{ date | date('F Y')}}
    </p>
  {% endif %}
</aside>
