let header = document.querySelector(".header");

window.addEventListener("scroll", function () {
  var x = pageYOffset;
  if (x > 80) {
    header.classList.add("header_active");
  } else {
    header.classList.remove("header_active");
  }

  console.log(x);
});
