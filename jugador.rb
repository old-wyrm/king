class Jugador
	#inicializacion de la clase
	#usa el nombre que se le pasa y la mano a vacia
	#la mano se rellenara luego cuando se reparta la baraja
	def initialize (nombre)
		@nombre = nombre
		@mano = []
		@puntos = 0
	end

	def muestra_mano 
		print @nombre,"=>"
		mano.each do |c|
			print c.carta," "
		end
		print "\n"
	end

	def muestra_puntuacion
		print @nombre, "=>",@puntos, " ptos\n"
	end

	#accesores
	attr_reader :nombre,:mano
	attr_writer :mano
end
