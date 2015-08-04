{% import "../../../helpers/classname/classname.swig" as c  %}

// Text style
//
// Typographic settings for different text types.
// Each text type has set a `font`, a `scale`, a `color` and parameters like letter-spacing, max-width or else.
// Everything text uses this `text-style` mixin. We don't set `color` or `font` directly for a text.
//
// Styleguide text-style

// The width of a text block
{% for text in text_styles %}{% if text.name == "Body text" %}{% for property in text.properties %}{% if property.name == "max-width" %}
$text-block-width: {{ property.value }}; {% endif %}{% endfor %}{% endif %}{% endfor %}



// The text mixin
@mixin text-style($variant) {
  {% for text in text_styles %}
  // {{ text.name }}
  // - {{ text.description }}
  {% set classname = c.classname(text.name) %}@if ($variant == '{{ classname }}') {
    {% for mixin in text.mixins %}@include {{ mixin.name }}{% if mixin.value %}({{ mixin.value }}){% endif %};
    {% endfor %}
    {% if text.properties %}{% for property in text.properties %}{{ property.name }}: {{ property.value }};
    {% endfor %}{% endif %}
    {% for responsive in text.responsive %}
    @include {{ responsive.breakpoint }} {
      {% for mixin in responsive.mixins %}@include {{ mixin.name }}{% if mixin.value %}({{ mixin.value }}){% endif %};
      {% endfor %}
      {% for property in responsive.properties %}{{ property.name }}: {{ property.value }};
      {% endfor %}
    }
    {% endfor %}
  }
  {% endfor %}
}


// Text style classes
{% for text in text_styles %}{% set classname = c.classname(text.name) %}
.text-style--{{ classname }} {
  {% for mixin in text.mixins %}@include {{ mixin.name }}{% if mixin.value %}({{ mixin.value }}){% endif %};
  {% endfor %}
  {% if text.properties %}{% for property in text.properties %}{{ property.name }}: {{ property.value }};
  {% endfor %}{% endif %}
  {% for responsive in text.responsive %}
  @include {{ responsive.breakpoint }} {
    {% for mixin in responsive.mixins %}@include {{ mixin.name }}{% if mixin.value %}({{ mixin.value }}){% endif %};
    {% endfor %}
    {% for property in responsive.properties %}{{ property.name }}: {{ property.value }};
    {% endfor %}
  }
  {% endfor %}
}
{% endfor %}
