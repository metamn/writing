{% extends '../../project/templates/default/default.html.swig' %}{% block content %}
<p>
Surreal numbers are the sweetest story of everything, especially of time.
</p>

<p>
Introduced by the father of programming Prof.
{% set image = people[0] %} {% include '../../project/card/card.html.swig' %}
<blockquote>Surreal Numbers: How Two Ex-Students Turned on to Pure Mathematics and Found Total Happiness (1974)</blockquote>
<p>
and inspired by the game go, this theory explains the birth of the numbers through mechanisms of reproduction and inheritance,
like evolution.
</p>

<p>
The theory says numbers have ancestors, and every number can have descendants.
With reproduction we can construct more numbers than infinite and make operations with them.
This theory needs no axioms at all, as pure as nature stands without dogmas, conventions and prerequisites.
</p>

<p>
Surreal numbers were introduced in Game Theory by
{% set image = people[1] %} {% include '../../project/card/card.html.swig' %}
</p>
<p>
Using together with pseudo numbers (a similar theory to surreal numbers) Conway started to analyse those situations in a game
when it can be easily predicted when a player will win, or especially lose, in maximum two steps.
</p>

<p>
He demonstrated the situation when any of the players who will move will lose, and,
the situation when the first player who moves will lose are identical, equivalent.
</p>

<p>
And here comes the <em>speculation</em>, based on the feeling I’ve got reading through this beautiful world of surreal numbers
built by time through reproduction: in games, where time is a factor does not matter which player starts moving first, anyway will lose.
</p>

<p>
You can’t win a game if there is a time factor in.
</p>

<p class="notice">
Download an introduction to Surreal Numbers <a href="http://www.tondering.dk/claus/sur15.pdf">here</a>. (PDF)
</p>
{% endblock %}
