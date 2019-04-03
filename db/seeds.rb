# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

demoUser = User.create(first_name: 'Demo', last_name: 'User', username: 'DemoUser', password: 'demouser', email: 'deomuser@demouser.com', address: '1645 Branch Valley Dr. Roswell, GA 20076')

pizza_type_config = [{ name: 'Margherita', price: 8 }, { name: 'Pepperoni', price: 9 }, { name: 'Chronicle Special', price: 10 }]

margherita = PizzaType.create(name: pizza_type_config[0][:name], price: pizza_type_config[0][:price])

pepperoni = PizzaType.create(name: pizza_type_config[1][:name], price: pizza_type_config[1][:price])

chronicle_special = PizzaType.create(name: pizza_type_config[2][:name], price: pizza_type_config[2][:price])
