# Clase IA. Modela la inteligencia artificial del jugador para la ronda "no hacer", version 2.
#
# @note <escribir resultados>
#
class IA_no_hacer_v2 < IA_no_hacer

	# Inicializacion del objeto. No contiene codigo especifico.
	def initialize
	end

	# Juega la primera carta de una baza en la ronda "no hacer. 
	# Esta version implementa el concepto de PALO CORTO (palo con 1 o 2 cartas que hay que desprenderse):
	# 1) Obtiene las cartas del palo que sea menor
	# 12) Si tiene 1 o 2 cartas de ese palo 
	# 121) Juega la menor carta
	# 13) Sino Juega la menor carta de la mano
	#
	# @param mano [Array] Array de cartas que representa la mano de un jugador.
	# @return [Carta] Carta elegida por la IA de la mano del jugador.
	#
	def juega_primero mano
		cartas_palo_menor = obtiene_cartas_palo_menor mano
		if cartas_palo_menor.size == 1 or cartas_palo_menor.size == 2
			then 
			carta_a_jugar = obtiene_carta_menor cartas_palo_menor
			print "PALO CORTO:",carta_a_jugar.carta.split("+")[1],"\n"
		else
			carta_a_jugar = obtiene_carta_menor mano
		end
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