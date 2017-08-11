class Jugador
	#inicializacion de la clase
	#usa el nombre que se le pasa y la mano a vacia
	#la mano se rellenara luego cuando se reparta la baraja
	def initialize (nombre)
		@nombre = nombre
		@mano = []
	end

	#accesores
	attr_reader :nombre,:mano
	attr_writer :mano
end
