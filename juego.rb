require "/Users/atta/Documents/RUBY/V1/baraja.rb"
require "/Users/atta/Documents/RUBY/V1/jugador.rb"
require "/Users/atta/Documents/RUBY/V1/mesa.rb"
require "/Users/atta/Documents/RUBY/V1/carta.rb"

class Juego
 def initialize 
 end

 def crea_mesa (j1,j2,j3,j4)
	 @jugador1 = Jugador.new (j1)
	 @jugador2 = Jugador.new (j2)
	 @jugador3 = Jugador.new (j3)
	 @jugador4 = Jugador.new (j4)
	 
	 @mesa_de_juego = Mesa.new @jugador1, @jugador2, @jugador3, @jugador4
	 @baraja_de_juego = Baraja.new
 end

 def inicia_juego
	 @baraja_de_juego.repartir @mesa_de_juego
	 muestra_manos_jugadores
	 muestra_puntuaciones_jugadores
	 # rondas negativas
	 juega_ronda_no_hacer
	 @baraja_de_juego.repartir @mesa_de_juego
	 # no hacer corazones
	 # no hacer J's ni K's
	 # no hacer Q's
	 # no hacer K de corazones
	 # no hacer las dos ultimas
	 # rondas positivas
	 # primera ronda positiva
	 # segunda ronda positiva
	 # tercera ronda positiva
	 # cuarta ronda positiva
	 # fin de juego
 end

 def juega_ronda_no_hacer
	 for i in 0..12
	 end
 end

 def muestra_manos_jugadores
         @jugador1.muestra_mano
	 @jugador2.muestra_mano
	 @jugador3.muestra_mano
	 @jugador4.muestra_mano
 end

 def muestra_puntuaciones_jugadores
         @jugador1.muestra_puntuacion
	 @jugador2.muestra_puntuacion
	 @jugador3.muestra_puntuacion
	 @jugador4.muestra_puntuacion
 end
end

j = Juego.new
j.crea_mesa "AGU","MJ","AQUI","JP"
j.inicia_juego

