function moverSlider(id, direccion) {
  const slider = document.getElementById(id);
  const carta = slider.querySelector(".carta");
  if (!carta) return;

  const cartaStyle = getComputedStyle(slider);
  const gap = parseInt(cartaStyle.gap || "20", 10); // lee el gap del CSS
  const cartaWidth = carta.offsetWidth + gap;

  const nuevoScroll = slider.scrollLeft + direccion * cartaWidth;
  console.log("nuevoScroll", nuevoScroll);

  slider.scrollTo({ left: nuevoScroll, behavior: "smooth" });
}


document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form"); // el form de login
    const email = document.querySelector("#user_email");
    const password = document.querySelector("#user_password");
    const flashAlert = document.querySelector(".alert-danger");

    if(form && email && password){
        // Ocultar alerta al principio si no hay datos ingresados
      if ((!email.value || !password.value) && flashAlert) { 
        flashAlert.style.display = "none";
      }
    }

    form.addEventListener("submit", function (e) {
      if (!email.value.trim() || !password.value.trim()) {
        e.preventDefault();
        alert("Por favor completa ambos campos antes de iniciar sesión.");
        if (flashAlert) flashAlert.style.display = "none";
      }
    });
});

// para que la pagina no se recargue 
document.addEventListener("DOMContentLoaded", function(){
  document.querySelectorAll(".form-agregar-carrito").forEach(form =>{
    form.addEventListener("submit", function(event){
      event.preventDefault(); // Parametro de que impide a que se actualice la pagina.

      const formData = new FormData(form);

      fetch(form.action,{
        method: "POST",
        headers:{
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        },
        body: formData
      })
      .then(response => response.json())
      .then(data =>{
        console.log("Producto agregado al carrito", data)

        const contador = document.getElementById("contador-carrito");
        if (contador && data.total_productos !== undefined){
          contador.textContent= data.total_productos;
        }
      })
    });
  });
});