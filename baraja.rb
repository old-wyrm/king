class Baraja
	#Tamaño maximo de la baraja
	TAMANO_MAX_BARAJA = 52
	def initialize ()
		# Crea la baraja estandar francesa
		# En esta version de es un array de objetos de la clase Carta
		@baraja = []
		Carta::PALOS.each do |p|
			Carta::VALORES.each do |v|
			c = Carta.new p,v
			@baraja = @baraja + [c]
			end
		end
	end
	
	# barajar es la funcion para repartir cartas al azar entre ellos
	# recibe una instancia de la clase Mesa
	def repartir (m)
		# toca es la variable que controla el reparto circular
		for i in (0.. TAMANO_MAX_BARAJA - 2)
			# rand (x) produce un numero entero entre 0 y x-1
			indice = rand (TAMANO_MAX_BARAJA - i)
			# la carta elegida al azar es @baraja[indice]
			# asigna la carta al jugador que le toca en el reparto (circular)
			j = m.mesa[m.quien_va]
			j.mano << @baraja[indice]
			m.jugador_siguiente
			#saca la carta de la baraja
			@baraja = @baraja - [@baraja[indice]]

		end
		# queda un elemento en el array de baraja
		# sera para el ultimo jugador y estara en @baraja[0]
		j = m.mesa[m.quien_va]
		j.mano = j.mano + [@baraja[0]]
		m.jugador_siguiente
		# la baraja se re-inicializa a vacia
		@baraja = []
	end

	#accesores
	attr_reader :baraja
end
