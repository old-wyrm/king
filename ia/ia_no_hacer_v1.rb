# Clase IA. Modela la inteligencia artificial del jugador para la ronda "no hacer", version 1.
#
# @note La mejora en la funcion juega_primero apenas enn 10000 partidas los puntos negativos que evita son 1000/2000. Las mejoras en las dos funciones mejoran notablementen sobre la version anterior.
#
class IA_no_hacer_v1 < IA_no_hacer

	# Inicializacion del objeto. No contiene codigo especifico.
	#
	# @param v [Boolean] Indica el modo de salida en pantalla. Si true muestra etapas intermedias de la partida.
	#
	def initialize v
		super v
	end

	# Juega la primera carta de una baza en la ronda "no hacer. 
	# Esta version implementa:
	# 1) Elige la carta mas baja de la mano del jugador
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_primero mano
		carta_a_jugar = obtiene_carta_menor mano
		return carta_a_jugar
	end

	# Juega una carta de una baza ya iniciada en la ronda "no hacer. 
	# Esta version implementa:
	# 1) Si tenemos cartas del mismo palo
	# 11) Si tenemos cartas inferiores a la carta inicial
	# 111) Jugamos la mayor carta de las inferiores a la carta inicial
	# 12) Sino tenemos cartas inferiores a la carta inicial
	# 121) Jugamos la mayor carta de las cartas del mismo palo que tengamos
	# 2) Sino tenemos cartas del mismo palo
	# 21) Jugamos la mayor carta que tengamos en la mano (sera de otro palo)
	#
	# @param mano [Array] Array de objetos Carta que representa la mano de un jugador.
	# @param carta_inicial [Carta] Carta de muestra de la baza
	# @param baza [Baza] Baza que se esta jugando
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_despues mano, carta_inicial, baza
		carta_a_jugar = nil
		cartas_de_la_mano_del_palo_muestra = obtiene_cartas_mismo_palo mano, carta_inicial
		if cartas_de_la_mano_del_palo_muestra.size > 0
			then
			# Tenemos cartas del mismo palo
			cartas_jugadas = baza.obtiene_cartas_jugadas
			cartas_jugadas_palo_muestra = obtiene_cartas_mismo_palo cartas_jugadas, carta_inicial
			mayor_carta_jugada_del_palo_muestra = obtiene_carta_mayor cartas_jugadas_palo_muestra
			cartas_del_mismo_palo_inferiores = obtiene_cartas_inferiores cartas_de_la_mano_del_palo_muestra, mayor_carta_jugada_del_palo_muestra
			if cartas_del_mismo_palo_inferiores.size > 0
				then
				carta_a_jugar = obtiene_carta_mayor cartas_del_mismo_palo_inferiores
			else
				carta_a_jugar = obtiene_carta_mayor cartas_de_la_mano_del_palo_muestra
			end
		else
			# No tenemos cartas del mismo palo
			# Escogemos la carta mayor que tengamos
			carta_a_jugar = obtiene_carta_mayor mano
		end
		return carta_a_jugar
	end
end
