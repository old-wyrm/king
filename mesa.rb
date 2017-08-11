class Mesa
	#Constantes de la clase 
	#Sirven para indexar el hash de objetos Jugador
	J1 = "J1"
	J2 = "J2"
	J3 = "J3"
	J4 = "J4"

	#inicializa la mesa
	def initialize (jugador1,jugador2,jugador3,jugador4)
		@mesa = {J1 => jugador1,J2  => jugador2,J3 => jugador3,J4 => jugador4}
		@quien_va = J1
	end

	#mueve la mano al siguiente jugador en orden
	#turno circular
	def jugador_siguiente
		case @quien_va
		when J1
			@quien_va = J2
		when J2
			@quien_va = J3
		when J3
			@quien_va = J4
		when J4
			@quien_va = J1
		end
	end

	#accesores
	attr_reader :mesa, :quien_va
end
