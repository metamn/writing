{% import "../../../../helpers/link/link.swig" as l  %}
{{ l.link(link) }}<span data-hover="{{ link.title }}">{{ link.title }}</span></a>
{%- if link.separator %}{{ link.separator }}{% endif -%}
{#
  The returned link has an extra whitespace left. When adding a period, coma after a link is ugly.
  So we can add here any extra characters to be displayed right after the link.

  See https://github.com/paularmstrong/swig/issues/300
#}
