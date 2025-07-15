Grupo.destroy_all
User.destroy_all
Product.destroy_all
Ingrediente.destroy_all
IngredienteProducto.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('grupos')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('products')
ActiveRecord::Base.connection.reset_pk_sequence!('ingredientes')

puts "Creando Grupos..."
grupo1 = Grupo.create(nombre: "Hamburguesas", descripcion: "Jugosas hamburguesas artesanales")
grupo2 = Grupo.create(nombre: "Salchipapas", descripcion: "Papas con variedad de toppings")
grupo3 = Grupo.create(nombre: "Pizzas", descripcion: "Pizzas al horno con masa artesanal")
puts "Grupos creados: #{Grupo.count}"

puts "Creando Usuario Admin..."
User.create(
  email: "admin@admin",
  password: "rasdix-jePjor-kohsy6",
  nombre: "Admin",
  apellido: "Admin",
  telefono: "123456789",
  rol: :admin,
  confirmed_at: Time.current
)
puts "Usuarios creados: #{User.count}"

puts "Creando Ingredientes..."

nombres_ingredientes = [
  "Carne de res", "Pollo desmechado", "Salchicha", "Chorizo", "Tocineta", "Queso mozzarella",
  "Queso cheddar", "Huevo", "Jamón", "Lechuga", "Tomate", "Cebolla", "Cebolla caramelizada",
  "Maíz tierno", "Pepinillos", "Papas a la francesa", "Papas ripio", "Salsas (rosada, tártara, BBQ)",
  "Ajo triturado", "Guacamole", "Pan de hamburguesa", "Pan de perro caliente",
  "Arepa", "Tortilla de harina", "Tortilla de maíz", "Piña", "Salsa de tomate", "Orégano"
]

ingredientes = {}
nombres_ingredientes.each do |nombre|
  ingredientes[nombre] = Ingrediente.find_or_create_by(nombre: nombre)
end
puts "Ingredientes creados: #{Ingrediente.count}"

puts "Creando productos..."

# Hamburguesas
hamburguesas = [
  { nombre: "Hamburguesa Clásica", ingredientes: [ "Carne de res", "Queso cheddar", "Lechuga", "Tomate", "Pan de hamburguesa", "Salsas (rosada, tártara, BBQ)" ] },
  { nombre: "Hamburguesa BBQ", ingredientes: [ "Carne de res", "Tocineta", "Queso mozzarella", "Cebolla caramelizada", "Pan de hamburguesa" ] },
  { nombre: "Hamburguesa de Pollo", ingredientes: [ "Pollo desmechado", "Lechuga", "Tomate", "Pan de hamburguesa", "Guacamole" ] },
  { nombre: "Hamburguesa Mexicana", ingredientes: [ "Carne de res", "Ajo triturado", "Guacamole", "Pan de hamburguesa" ] },
  { nombre: "Hamburguesa Doble Carne", ingredientes: [ "Carne de res", "Carne de res", "Queso cheddar", "Pan de hamburguesa", "Salsas (rosada, tártara, BBQ)" ] },
  { nombre: "Hamburguesa Hawaiana", ingredientes: [ "Carne de res", "Jamón", "Piña", "Queso mozzarella", "Pan de hamburguesa" ] },
  { nombre: "Hamburguesa Criolla", ingredientes: [ "Carne de res", "Huevo", "Queso mozzarella", "Cebolla", "Pan de hamburguesa" ] }
]

hamburguesas.each do |data|
  producto = Product.create(
    nombre: data[:nombre],
    precio: 15000,
    descripcion: "Deliciosa #{data[:nombre]}",
    disponible: true,
    grupo_id: grupo1.id
  )
  data[:ingredientes].each do |ing|
    producto.ingredientes << ingredientes[ing]
  end
end

# Salchipapas
salchipapas = [
  { nombre: "Salchipapa Clásica", ingredientes: [ "Papas a la francesa", "Salchicha", "Salsas (rosada, tártara, BBQ)" ] },
  { nombre: "Salchipapa Mixta", ingredientes: [ "Papas a la francesa", "Chorizo", "Salchicha", "Queso cheddar", "Salsas (rosada, tártara, BBQ)" ] }
]

salchipapas.each do |data|
  producto = Product.create(
    nombre: data[:nombre],
    precio: 12000,
    descripcion: "Deliciosa #{data[:nombre]}",
    disponible: true,
    grupo_id: grupo2.id
  )
  data[:ingredientes].each do |ing|
    producto.ingredientes << ingredientes[ing]
  end
end

# Pizzas
pizzas = [
  { nombre: "Pizza Hawaiana", ingredientes: [ "Queso mozzarella", "Jamón", "Piña", "Salsa de tomate", "Orégano" ] },
  { nombre: "Pizza de Carne", ingredientes: [ "Carne de res", "Queso mozzarella", "Cebolla", "Salsa de tomate" ] },
  { nombre: "Pizza Vegetariana", ingredientes: [ "Queso mozzarella", "Tomate", "Cebolla", "Maíz tierno", "Orégano" ] }
]

pizzas.each do |data|
  producto = Product.create(
    nombre: data[:nombre],
    precio: 18000,
    descripcion: "Deliciosa #{data[:nombre]}",
    disponible: true,
    grupo_id: grupo3.id
  )
  data[:ingredientes].each do |ing|
    producto.ingredientes << ingredientes[ing]
  end
end

puts "Productos creados: #{Product.count}"
