var showCard = function(toggler) {
  var triggers = document.querySelectorAll(toggler);

  function onViewChange(event) {
    this.parentNode.parentNode.nextSibling.classList.toggle('card__figure--inactive');
    event.stopPropagation();
  }

  for (var i = 0; i < triggers.length; i++ ) {
    triggers[i].addEventListener('click', onViewChange, false);
  }
}

showCard('.card__title');
