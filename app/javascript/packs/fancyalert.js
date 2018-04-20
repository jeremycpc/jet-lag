const trigger = document.querySelectorAll(".fancyalert");

trigger.forEach(function (link) {
  const elem = document.getElementById(link.getAttribute("data-target"));

  link.addEventListener("click", function() {
    elem.classList.add("is-visible");
  });

  elem.querySelector('.fancy-close').addEventListener("click", function() {
    elem.classList.remove("is-visible");
  });
});

