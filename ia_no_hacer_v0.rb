# Clase IA. Modela la inteligencia artificial del jugador para la ronda "no hacer", version 0.
#
# @note La IA mas facil. En 10000 partidas con todos los jugadores usandola consigue una distribucion de puntos bastante equitativa.
#
class IA_no_hacer_v0 < IA_no_hacer

	# Inicializacion del objeto. No contiene codigo especifico.
	def initialize
	end

	# Juega la primera carta de una baza en la ronda "no hacer. 
	# Esta version implementa:
	# 1) Elige una carta de la mano al azar.
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_primero mano
		carta_a_jugar = nil
		# elige una carta al azar
		indice = rand mano.size
		carta_a_jugar = mano [indice]
		return carta_a_jugar
	end

	# Juega una carta de una baza ya iniciada en la ronda "no hacer. 
	# Esta version implementa:
	# 1) Si el jugador tiene cartas del mismo palo, selecciona una de esas cartas al azar.
	# 2) Si el jugador no tiene cartas del palo inicial, selecciona una al azar de toda su mano.
	#
	# @param mano [Array] Array de objetos Carta que representa la mano de un jugador.
	# @param carta_inicial [Carta] Carta de muestra de la baza
	# @param baza [Baza] Baza que se esta jugando
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_despues mano, carta_inicial, baza
		carta_a_jugar = nil
		cartas_posibles = []
		# Recorre la mano buscando cartas del mismo palo y metiendolas en el array cartas_posibles
		mano.each do |c1|
			if c1.es_mismo_palo carta_inicial
				then
				cartas_posibles << c1
			end
		end
		# Si el array de cartas_posibles esta a 0 es que no tiene cartas del mismo palo en la mano
		if cartas_posibles.size == 0
			then
			# Entonces, el array de cartas posibles es la propia mano
			cartas_posibles = mano
		end
		indice = rand cartas_posibles.size
		carta_a_jugar = cartas_posibles [indice]
		return carta_a_jugar
	end
end
