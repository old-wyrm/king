class Baraja
	#Tamaño maximo de la baraja
	TAMANO_MAX_BARAJA = 52
	def initialize ()
		# Crea la baraja estandar francesa
		# En esta version de es un simple array de Strings
		# Codificacion de las cartas Xy
		# X => "c" Corazones, "p" Picas, "d" Diamantes, "t" Treboles
		# y => "a" As, "2" dos.... "j" Jotas, "q" Qs y "k" Kings
		@baraja = ["ca","c2","c3","c4","c5","c6","c7","c8","c9","c10","cj","cq","ck"]
		@baraja = @baraja + ["pa","p2","p3","p4","p5","p6","p7","p8","p9","p10","pj","pq","pk"]
		@baraja = @baraja + ["da","d2","d3","d4","d5","d6","d7","d8","d9","d10","dj","dq","dk"]
		@baraja = @baraja + ["ta","t2","t3","t4","t5","t6","t7","t8","t9","t10","tj","tq","tk"]
	end
	
	# barajar es la funcion para repartir cartas al azar entre ellos
	# recibe una instancia de la clase Mesa
	def repartir (m)
		# toca es la variable que controla el reparto circular
		for i in (0.. TAMANO_MAX_BARAJA - 2)
			# rand (x) produce un numero entero entre 0 y x-1
			indice = rand (TAMANO_MAX_BARAJA - i)
			# la carta elegida al azar esa en @baraja[indice]
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
