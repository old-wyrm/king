# Clase IA. Modela la inteligencia artificial del jugador para la ronda "no hacer". Esta clase estara vacia, servira para definir las interfaces de las clases hijos.
#
class IA_no_hacer < IA

	# Inicializacion del objeto. No contiene codigo especifico.
	def initialize
	end

	# Juega la primera carta de una baza en la ronda "no hacer. 
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_primero mano
		return nil
	end

	# Juega una carta de una baza ya iniciada en la ronda "no hacer. 
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_despues mano, carta_inicial, baza_en_juego
		return nil
	end
end
