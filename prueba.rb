require "/Users/atta/Documents/RUBY/V1/baraja.rb"
require "/Users/atta/Documents/RUBY/V1/jugador.rb"
require "/Users/atta/Documents/RUBY/V1/mesa.rb"
require "/Users/atta/Documents/RUBY/V1/carta.rb"
j1 = Jugador.new ("AG")
j2 = Jugador.new ("Aq")
j3 = Jugador.new ("MJ")
j4 = Jugador.new ("JP")
m = Mesa.new j1, j2, j3, j4
# m es un objeto Mesa
# m.mesa accede a un hash que usa como indice las constantes definidas en la clase Mesa (J1,J2,etc.)
# m.mesa[Mesa::J1] accede al objeto Jugador en posicion 1
# m.mesa[Mesa::J1].nombre accede al nombre del objeto Jugador en posicion 1 de la mesa
# m.mesa[Mesa::J3].mano accede a la mano de cartas. La mano es un array de Strings
# m.mesa[Mesa::J3].mano[0] accede a la primera carta de la mano del jugador en posicion 3 de la mesa
# la carta es una string que codifica la carta segun aparece en baraja
b = Baraja.new
b.repartir(m)
print m.mesa[Mesa::J1].nombre,"=>"
m.mesa[Mesa::J1].mano.each do |c|
	print c.carta," "
end
print "\n"
print m.mesa[Mesa::J2].nombre,"=>"
m.mesa[Mesa::J2].mano.each do |c|
	print c.carta," "
end
print "\n"
print m.mesa[Mesa::J3].nombre,"=>"
m.mesa[Mesa::J3].mano.each do |c|
	print c.carta," "
end
print "\n"
print m.mesa[Mesa::J4].nombre,"=>"
m.mesa[Mesa::J4].mano.each do |c|
	print c.carta," "
end
print "\n"

