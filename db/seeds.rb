# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chronicle = User.create(first_name: 'The Chronicle', last_name: 'of Higher Eduction', username: 'chronicle', password: 'chronicle', email: 'chroncile@chronicleofhighereducation.com')

chronicle_address = Address.create(full_address: '1255 23rd St NW, Washington, DC 20037')

chronicle.addresses << chronicle_address

demoUser = User.create(first_name: 'Demo', last_name: 'User', username: 'DemoUser', password: 'demouser', email: 'deomuser@demouser.com')

address_1 = Address.create(full_address: '1645 Branch Valley Dr. Roswell, GA 20076')
address_2 = Address.create(full_address: '2475 Virginia Ave. NW, Washington, DC 20037')
demoUser.addresses << address_1
demoUser.addresses << address_2

pizza_type_config = [{ name: 'Margherita', price: 8 }, { name: 'Pepperoni', price: 9 }, { name: 'Chronicle Special', price: 10 }]

margherita = PizzaType.create(name: pizza_type_config[0][:name], price: pizza_type_config[0][:price])

pepperoni = PizzaType.create(name: pizza_type_config[1][:name], price: pizza_type_config[1][:price])

chronicle_special = PizzaType.create(name: pizza_type_config[2][:name], price: pizza_type_config[2][:price])
