Grupo.destroy_all
User.destroy_all
Product.destroy_all
Ingrediente.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('grupos')

puts "Creando Grupos..."
Grupo.create(nombre: "Grupo 1")
Grupo.create(nombre: "Grupo 2")
Grupo.create(nombre: "Grupo 3")
puts "Grupos creados #{Grupo.count}"

ActiveRecord::Base.connection.reset_pk_sequence!('users')

puts "Creando Usuario Admin..."
User.create(
  email: "admin@admin",
  password: "rasdix-jePjor-kohsy6",
  nombre: "Admin",
  apellido: "Admin",
  telefono: "123456789",
  rol: :admin,
  confirmed_at: Time.current # Encargado de que si el correo esta verificado lo puede dejar entrar
)

puts "Usuarios creados #{User.count}"


ActiveRecord::Base.connection.reset_pk_sequence!('products')

puts "Creando productos..."

grupo1 = Grupo.find_by(nombre: "Grupo 1")
grupo2 = Grupo.find_by(nombre: "Grupo 2")
grupo3 = Grupo.find_by(nombre: "Grupo 3")

# Productos Grupo 1
Product.create(nombre: "Producto 1 (Grupo 1)", precio: 99999, descripcion: "Descripción producto 1", disponible: true, grupo_id: grupo1.id)
Product.create(nombre: "Producto 2 (Grupo 1)", precio: 99999, descripcion: "Descripción producto 2", disponible: true, grupo_id: grupo1.id)
Product.create(nombre: "Producto 3 (Grupo 1)", precio: 99999, descripcion: "Descripción producto 3", disponible: true, grupo_id: grupo1.id)
Product.create(nombre: "Producto 4 (Grupo 1)", precio: 99999, descripcion: "Descripción producto 4", disponible: true, grupo_id: grupo1.id)
Product.create(nombre: "Producto 5 (Grupo 1)", precio: 99999, descripcion: "Descripción producto 5", disponible: true, grupo_id: grupo1.id)
Product.create(nombre: "Producto 6 (Grupo 1)", precio: 99999, descripcion: "Descripción producto 6", disponible: true, grupo_id: grupo1.id)
Product.create(nombre: "Producto 7 (Grupo 1)", precio: 99999, descripcion: "Descripción producto 7", disponible: true, grupo_id: grupo1.id)

# Productos Grupo 2
Product.create(nombre: "Producto 1 (Grupo 2)", precio: 99999, descripcion: "Descripción producto 1", disponible: true, grupo_id: grupo2.id)
Product.create(nombre: "Producto 2 (Grupo 2)", precio: 99999, descripcion: "Descripción producto 2", disponible: true, grupo_id: grupo2.id)
Product.create(nombre: "Producto 3 (Grupo 2)", precio: 99999, descripcion: "Descripción producto 3", disponible: true, grupo_id: grupo2.id)
Product.create(nombre: "Producto 4 (Grupo 2)", precio: 99999, descripcion: "Descripción producto 4", disponible: true, grupo_id: grupo2.id)
Product.create(nombre: "Producto 5 (Grupo 2)", precio: 99999, descripcion: "Descripción producto 5", disponible: true, grupo_id: grupo2.id)
Product.create(nombre: "Producto 6 (Grupo 2)", precio: 99999, descripcion: "Descripción producto 6", disponible: true, grupo_id: grupo2.id)
Product.create(nombre: "Producto 7 (Grupo 2)", precio: 99999, descripcion: "Descripción producto 7", disponible: true, grupo_id: grupo2.id)

# Productos Grupo 3
Product.create(nombre: "Producto 1 (Grupo 3)", precio: 99999, descripcion: "Descripción producto 1", disponible: true, grupo_id: grupo3.id)
Product.create(nombre: "Producto 2 (Grupo 3)", precio: 99999, descripcion: "Descripción producto 2", disponible: true, grupo_id: grupo3.id)
Product.create(nombre: "Producto 3 (Grupo 3)", precio: 99999, descripcion: "Descripción producto 3", disponible: true, grupo_id: grupo3.id)
Product.create(nombre: "Producto 4 (Grupo 3)", precio: 99999, descripcion: "Descripción producto 4", disponible: true, grupo_id: grupo3.id)
Product.create(nombre: "Producto 5 (Grupo 3)", precio: 99999, descripcion: "Descripción producto 5", disponible: true, grupo_id: grupo3.id)
Product.create(nombre: "Producto 6 (Grupo 3)", precio: 99999, descripcion: "Descripción producto 6", disponible: true, grupo_id: grupo3.id)
Product.create(nombre: "Producto 7 (Grupo 3)", precio: 99999, descripcion: "Descripción producto 7", disponible: true, grupo_id: grupo3.id)

puts "Productos creados: #{Product.count}"


puts "Creando Ingredientes..."

ingredientes = [
  "Carne de res",
  "Pollo desmechado",
  "Salchicha",
  "Chorizo",
  "Tocineta",
  "Queso mozzarella",
  "Queso cheddar",
  "Huevo",
  "Jamón",
  "Lechuga",
  "Tomate",
  "Cebolla",
  "Cebolla caramelizada",
  "Maíz tierno",
  "Pepinillos",
  "Papas a la francesa",
  "Papas ripio",
  "Salsas (rosada, tártara, BBQ)",
  "Ajo triturado",
  "Guacamole",
  "Pan de hamburguesa",
  "Pan de perro caliente",
  "Arepa",
  "Tortilla de harina",
  "Tortilla de maíz"
]

ingredientes.each do |nombre|
  Ingrediente.find_or_create_by(nombre: nombre)
end

puts "Ingredientes creados: #{Ingrediente.count}"
