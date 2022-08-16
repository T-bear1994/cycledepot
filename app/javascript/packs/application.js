require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

document.addEventListener('DOMContentLoaded', () => {
  const $navbarBergers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  $navbarBergers.forEach( el => {
    el.addEventListener('click', () => {
      const target = el.dataset.target;
      const $target = document.getElementById(target);

      el.classList.toggle('is-active')
      $target.classList.toggle('is-active')
    });
  });
});