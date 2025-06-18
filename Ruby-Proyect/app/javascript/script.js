
window.moverSlider = function (id, direccion) {
  const slider = document.getElementById(id);
  const carta = slider.querySelector(".carta");
  if (!carta) return;

  const cartaStyle = getComputedStyle(slider);
  const gap = parseInt(cartaStyle.gap || "20", 10);
  const cartaWidth = carta.offsetWidth + gap;

  const nuevoScroll = slider.scrollLeft + direccion * cartaWidth;
  slider.scrollTo({ left: nuevoScroll, behavior: "smooth" });
};

document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form[action='/users/sign_in']");
  if (!form) return; // ← solo corre si estamos en login

  const email = document.querySelector("#user_email");
  const password = document.querySelector("#user_password");
  const flashAlert = document.querySelector(".alert-danger");

  if ((!email?.value || !password?.value) && flashAlert) {
    flashAlert.style.display = "none";
  }

  form.addEventListener("submit", function (e) {
    if (!email.value.trim() || !password.value.trim()) {
      e.preventDefault();
      alert("Por favor completa ambos campos antes de iniciar sesión.");
      if (flashAlert) flashAlert.style.display = "none";
    }
  });
});
