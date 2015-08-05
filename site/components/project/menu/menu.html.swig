<nav class="menu">
  <h3>Menu</h3>

  {% for link in site.menu.links %}
    <div class="menu__item">
      {% set link = link %}
      {% include '../../framework/design/typography/elements/link/link.html.swig' %}
    </div>
  {% endfor %}
</nav>
