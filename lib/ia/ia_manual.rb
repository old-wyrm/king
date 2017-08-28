# Clase IA. Modela la introduccion manual de las jugadas por parte de un jugador humano.
#
#
class IA_manual < IA

	# Inicializacion del objeto. No contiene codigo especifico.
	# @param v [Boolean] Indica el modo de salida en pantalla. Si true muestra etapas intermedias de la partida.
	#
	def initialize v
		super v
	end

	# Juega la primera carta de una baza en la ronda "no hacer. 
	# Esta version implementa:
	# 1) El jugador escoge que carta jugar 
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_primero mano
		carta_a_jugar = nil
		cadena = (Util.captura_entrada "Escoge una carta por su posicion en la mano (0=inicial)=>").chomp
		carta_a_jugar = mano[cadena.to_i]
		return carta_a_jugar	
	end

	# Juega una carta de una baza ya iniciada en la ronda "no hacer. 
	# Esta version implementa:
	# 1) El jugador escoge que carta jugar 
	#
	# @param mano [Array] Array de objetos Carta que representa la mano de un jugador.
	# @param carta_inicial [Carta] Carta de muestra de la baza
	# @param baza [Baza] Baza que se esta jugando
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_despues mano, carta_inicial, baza
		carta_a_jugar = nil
		Util.muestra_msg baza.to_s, @verbose
		cadena = (Util.captura_entrada "Escoge una carta por su posicion en la mano (0=inicial)=>").chomp
		carta_a_jugar = mano[cadena.to_i]
		return carta_a_jugar	
	end
end
