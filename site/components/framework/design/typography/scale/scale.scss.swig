// Scale
//
// Typographic grid and scale.
// Different font sizes based on the [Modular Scale 4:3 Perfect Fourth](http://www.modularscale.com/?1&em&1.333&web&text) settings.
//
// Styleguide scale

// The default metric for sizing non-typographic elements
// - it is based on the default font size and line height
// - $lem is used for spacing elements on the webpage like margins and padding
{% for scale in scale %}{% if scale.name == 'default' %}{% for property in scale.properties %}{% if property.name == 'line-height' %}{% set line_height = property.value %}{%- endif %}{%- endfor %}
$lem: {{ line_height }}em;
{% for responsive in scale.responsive %}
@include {{ responsive.breakpoint }} { {% for property in responsive.properties %}{% if property.name == 'line-height' %}{% set line_height = property.value %}{%- endif %}{% endfor %}{% set lem = font_size * line_height / 100 %}
  $lem: {{ line_height }}em;
}
{% endfor %}{%- endif %}{%- endfor %}



// Different typographic scales
@mixin scale($variant) {
{% for scale in scale %}
  // {{ scale.description }}
  @if ($variant == '{{ scale.name }}') {
    {% for property in scale.properties %}{{ property.name }}: {{ property.value }};
    {% endfor %}
    {% for responsive in scale.responsive %}
    @include {{ responsive.breakpoint }} {
      {% for property in responsive.properties %}{{ property.name }}: {{ property.value }};
      {% endfor %}
    }
    {% endfor %}
  }
{% endfor %}
}


// Typographic scale classes
{% for scale in scale %}
.scale--{{ scale.name }} {
  {% for property in scale.properties %}{{ property.name }}: {{ property.value }};
  {% endfor %}
  {% for responsive in scale.responsive %}
  @include {{ responsive.breakpoint }} {
    {% for property in responsive.properties %}{{ property.name }}: {{ property.value }};
    {% endfor %}
  }
  {% endfor %}
}
{% endfor %}
