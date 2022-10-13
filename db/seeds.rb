# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Room.create(name: "Deluxe, Guest room", description: "Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms", size: "95", view: "Sea", bedding: "Quadrople", image: "https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px")

Room.create(name: "Standard Double", description: "Deluxe, Guest room, 1 King, Sea view, Recharge in our luxury hotel rooms, suites and villas while enjoying Aegean Sea and garden views", size: "65", view: "Forest", bedding: "Twin", image: "https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-guestroom-5475-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px:*")

Room.create(name: "Private Pool Suite", description: "1 Bedroom Larger Suite, 1 King, Sofa bed, Sea view, Private poolDeluxe, Guest room, 1 King, Sea view, Recharge in our luxury hotel rooms, suites and villas while enjoying Aegean Sea and garden views", size: "35", view: "Ocean", bedding: "Double", image: "https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-suite-5554-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px:*")

Room.create(name: "2 Bedroom Suite, Bedroom", description: "Yalikavak, 2 Bedroom Suite, Bedroom 1: 1 King, Bedroom 2: 1 King, Sea view, Balcony, Recharge in our luxury hotel rooms, suites and villas while enjoying Aegean Sea and garden views", size: "75", view:"City", bedding: "Twin", image: "https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-suite-0236-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px:*")
