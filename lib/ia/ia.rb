# Clase IA. Modela la inteligencia artificial del jugador. Esta clase estara vacia, servira para definir las interfaces de las clases hijos.
#
class IA

	@verbose = false

	# Inicializacion del objeto. No contiene codigo especifico.
	#
	# @param v [Boolean] Indica el modo de salida en pantalla. Si true muestra etapas intermedias de la partida.
	#
	def initialize v
		@verbose = v
	end

	# Juega la primera carta de una baza en una ronda.
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_primero mano
		return nil
	end

	# Juega una carta de una baza ya iniciada en una ronda. 
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_despues mano, carta_inicial, baza_en_juego
		return nil
	end

	# Dado una mano y una carta de muestra, obtiene todas las cartas de la mano que son del mismo palo que la muestra.
	#
	# @param mano [Array] Array de objetos Carta. 
	# @param carta_muestra [Carta] Carta cuyo palo queremos comparar.
	# @return [Array] Array de cartas de la mano cuyo palo son el mismo que la muestra.
	#
	def obtiene_cartas_mismo_palo mano, carta_muestra
		cartas_posibles = []
		# Recorre la mano buscando cartas del mismo palo y metiendolas en el array cartas_posibles
		mano.each do |c1|
			if c1.es_mismo_palo carta_muestra
				then
				cartas_posibles << c1
			end
		end
		return cartas_posibles
	end

	# Dado una mano y una carta de muestra, obtiene todas las cartas de la mano que tienen un valor inferior a la carta de muestra. No comprueba palos, por lo que si hay dos palos diferentes en la mano no lo tendra en cuenta. Si las cartas tienen el mismo valor no las incluye en la salida.
	#
	# @param mano [Array] Array de objetos Carta. 
	# @param carta_muestra [Carta] Carta cuyo valor queremos comparar.
	# @return [Array] Array de cartas de la mano cuyo valor es inferior al de la muestra.
	#
	def obtiene_cartas_inferiores  mano, carta_muestra
		cartas_posibles = []
		# Recorre la mano buscando cartas con valor inferior y metiendolas en el array cartas_posibles
		mano.each do |c1|
			if c1.es_menor carta_muestra
				then
				cartas_posibles << c1
			end
		end
		return cartas_posibles
	end

	# Dado una mano y una carta de muestra, obtiene todas las cartas de la mano que tienen un valor superior a la carta de muestra. No comprueba palos, por lo que si hay dos palos diferentes en la mano no lo tendra en cuenta. Si las cartas tienen el mismo valor no las incluye en la salida.
	#
	# @param mano [Array] Array de objetos Carta. 
	# @param carta_muestra [Carta] Carta cuyo valor queremos comparar.
	# @return [Array] Array de cartas de la mano cuyo valor es superior al de la muestra.
	#
	def obtiene_cartas_superiores  mano, carta_muestra
		cartas_posibles = []
		# Recorre la mano buscando cartas con valor superior y metiendolas en el array cartas_posibles
		mano.each do |c1|
			if c1.es_mayor carta_muestra
				then
				cartas_posibles << c1
			end
		end
		return cartas_posibles
	end

	# Dada una mano, obtiene la carta con el menor valor. No comprueba los palos, por lo que si hay palos diferentes no lo tendra en cuenta. Si dos cartas tienen el mismo valor se queda con la primera.
	#
	# @param mano [Array] Array de objetos Carta.
	# @return [Carta] Carta con el menor valor.
	#
	def obtiene_carta_menor mano
		carta_menor = nil
		mano.each do |c1|
			if carta_menor == nil
				then
				carta_menor = c1
			else
				if carta_menor.es_mayor c1
					then
					carta_menor = c1
				end
			end
		end
		return carta_menor
	end

	# Dada una mano, obtiene la carta con el mayor valor. No comprueba los palos, por lo que si hay palos diferentes no lo tendra en cuenta. Si dos cartas tienen el mismo valor se queda con la primera.
	#
	# @param mano [Array] Array de objetos Carta.
	# @return [Carta] Carta con el mayor valor.
	#
	def obtiene_carta_mayor mano
		carta_mayor = nil
		mano.each do |c1|
			if carta_mayor == nil
				then
				carta_mayor = c1
			else
				if carta_mayor.es_menor c1
					then
					carta_mayor = c1
				end
			end
		end
		return carta_mayor
	end

	# Dada una mano y una carta de muestra, obtiene la carta de mayor valor que sea inferior a la carta de muestra. p.e. Si tenemos un 3 y un 4 y la carta de muestra es un 5, obtendriamos el 4.No comprueba los palos, por lo que si hay palos diferentes no lo tendra en cuenta. Si dos cartas tienen el mismo valor se queda con la primera.
	#
	# @param mano [Array] Array de objetos Carta.
	# @param carta_muestra [Carta] Carta con la que compararemos los valores.
	# @return [Carta] Carta con el mayor valor inferior a la muestra.
	def obtiene_carta_mayor_inferior mano, carta_muestra
		carta_menor = nil
		mano.each do |c1|
			if carta_menor == nil
				then
				carta_menor = c1
			else
				if carta_menor.es_mayor c1
					then
					carta_menor = c1
				end
			end
		end
	end

	def obtiene_carta_ganadora baza, carta_inicial, tipo_baza
		case tipo_baza
		when Constantes::NO_HACER 

		end
	end
	
	# Dada una mano y una carta de muestra, cuenta cuantas cartas hay en la mano del mismo palo que la muestra.
	#
	# @param mano [Array] Array de objetos Carta.
	# @param carta_muestra [Carta] Carta de muestra con el palo a comparar.
	# @return [Integer] Numero de cartas de ese palo en la mano. Sino hay devuelve 0.
	#
	def cuenta_cartas_de_un_palo mano, carta_muestra
		cartas_de_ese_palo = obtiene_cartas_mismo_palo mano, carta_muestra
		return cartas_de_ese_palo.size
	end
	
	# Dada una mano, devuelve un array de cartas del palo que menos cartas tenga. El palo de las cartas devuelto siempre debe tener al menos una carta en la mano. A igualdad de cartas se sigue la precedencia definida Constantes.
	#
	# @param mano [Array] Array de objetos Carta
	# @return [Array] Array de objetos Carta del palo que menos cartas tenga.
	#
	def obtiene_cartas_palo_menor mano
		cartas_palo_menor = []
		cartas_corazones = obtiene_cartas_mismo_palo mano, (Carta.new Constantes::AS,Constantes::CORAZONES)
		cartas_picas = obtiene_cartas_mismo_palo mano, (Carta.new Constantes::AS,Constantes::PICAS)
		cartas_diamantes = obtiene_cartas_mismo_palo mano, (Carta.new Constantes::AS,Constantes::DIAMANTES)
		cartas_treboles = obtiene_cartas_mismo_palo mano, (Carta.new Constantes::AS,Constantes::TREBOLES)

		if cartas_corazones.size > 0 and (cartas_corazones.size <= cartas_picas.size or cartas_picas.size == 0) and (cartas_corazones.size <= cartas_diamantes.size or cartas_diamantes.size == 0) and (cartas_corazones.size <= cartas_treboles.size or cartas_treboles.size == 0)
		       then
		       cartas_palo_menor = cartas_corazones
		elsif cartas_picas.size > 0 and (cartas_picas.size <= cartas_corazones.size or cartas_corazones.size == 0)  and (cartas_picas.size <= cartas_diamantes.size or cartas_diamantes.size == 0)  and (cartas_picas.size <= cartas_treboles.size or cartas_treboles.size == 0)
		       then
		       cartas_palo_menor = cartas_picas
		elsif cartas_diamantes.size > 0 and (cartas_diamantes.size <= cartas_corazones.size or cartas_corazones.size == 0)  and (cartas_diamantes.size <= cartas_picas.size or cartas_picas.size == 0) and (cartas_diamantes.size <= cartas_treboles.size or cartas_treboles.size == 0)
		       then
		       cartas_palo_menor = cartas_diamantes
		elsif cartas_treboles.size > 0 and (cartas_treboles.size <= cartas_corazones.size or cartas_corazones.size == 0) and (cartas_treboles.size <= cartas_picas.size or cartas_picas.size == 0) and (cartas_treboles.size <= cartas_diamantes.size or cartas_diamantes.size == 0)
		       then
		       cartas_palo_menor = cartas_treboles
		end	       
		return cartas_palo_menor
	end

	# Dada una mano formada por un solo palo devuelve booleano diciendo si es un palo corto (sólo tiene 1 o 2 cartas)
	#
	# @param mano [Array] Array de objetos Carta de un solo palo
	# @return [Boolean] Devuelve cierto si el array parametro es menor que 1 o 2
	#
	def es_palo_corto mano
		return mano.size <= 2
	end
end
