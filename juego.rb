$LOAD_PATH << "."
require "baraja"
require "baza"
require "carta"
require "constantes"
require "jugador"
require "mesa"

# Clase principal que ejecuta una partida llamando secuencialmente a cada una de las rondas.
#
# @author old-wyrm
#
# @example
#  j = Juego.new
#  j.crea_mesa "AGU","MJ","AQUI","JP"
#  j.inicia_juego
#
# @!attribute [r] mesa_de_juego 
# 	Mesa de juego de la partida
# 	@return [Mesa]
#
# @!attribute [r] baraja_de_juego 
# 	Baraja de la partida
# 	@return [Baraja]
#
# @note Clase principal de la IA
#
class Juego

	attr_reader :mesa_de_juego
	# Constructor vacío
	def initialize 
	end

	# Crea una mesa de juego. Usando la clase Mesa y a partir de cuatro nombres de jugadores inicializando las variables internas @mesa_de_juego y @baraja_de_juego
	#
	#@see Mesa
	#@note para que queremos esto aqui? aporta algo?
	#
	#@param j1 [String] Nombre del jugador 1
	#@param j2 [String] Nombre del jugador 2
	#@param j3 [String] Nombre del jugador 3
	## @param j4 [String] Nombre del jugador 4
	def crea_mesa (j1,j2,j3,j4)
		jugador1 = Jugador.new j1
		jugador2 = Jugador.new j2
		jugador3 = Jugador.new j3
	 	jugador4 = Jugador.new j4
	 	@mesa_de_juego = Mesa.new jugador1, jugador2, jugador3, jugador4
	 	@baraja_de_juego = Baraja.new
 	end

 	# Inicia la partida. Lleva a cabo la partida mediante llamadas internas a las diferentes rondas
	#
	def inicia_juego
		# rondas negativas
		juega_ronda_no_hacer
		# no hacer corazones
		# no hacer J's ni K's
		# no hacer Q's
		# no hacer K de corazones
		# no hacer las dos ultimas
		# rondas positivas
		# primera ronda positiva
		# segunda ronda positiva
		# tercera ronda positiva
		# cuarta ronda positiva
		# fin de juego
	end

	# Metodo para jugar la primera ronda de negativas, "no hacer". La ronda tiene 13 bazas en las cuales los jugadores ganan puntos negativos.
	#
 	def juega_ronda_no_hacer
		# Una ronda siempre empieza con el reparto de cartas y mostrando la mesa de juego por pantalla
		@baraja_de_juego.repartir @mesa_de_juego
		@mesa_de_juego.muestra_en_pantalla
		# Juega las 13 bazas
		for i in 0..12
			# Para cada baza crea un nuevo objeto Baza
		 	@mesa_de_juego.baza_en_juego = Baza.new
		        # Obtiene la carta del primer jugador
			# La mete en la baza en juego
			# Pasa al siguiente jugador
			# Muestra la baza en la pantalla	
		 	c1 = @mesa_de_juego.jugadores[@mesa_de_juego.jugador_en_activo].juega_primero
		 	@mesa_de_juego.baza_en_juego.baza = {@mesa_de_juego.jugador_en_activo => c1}
		 	@mesa_de_juego.siguiente_jugador_en_activo
		 	@mesa_de_juego.baza_en_juego.muestra_en_pantalla

			# Igual que la anterior pero en lugar de jugar_primero llama a jugar (ya hay una carta en la baza por tanto)
		 	c2 = @mesa_de_juego.jugadores[@mesa_de_juego.jugador_en_activo].juega @mesa_de_juego.baza_en_juego
		 	@mesa_de_juego.baza_en_juego.baza[@mesa_de_juego.jugador_en_activo]=c2
		 	@mesa_de_juego.siguiente_jugador_en_activo
		 	@mesa_de_juego.baza_en_juego.muestra_en_pantalla
		 	
			# Igual que la anterior	
			c3 = @mesa_de_juego.jugadores[@mesa_de_juego.jugador_en_activo].juega @mesa_de_juego.baza_en_juego
		 	@mesa_de_juego.baza_en_juego.baza[@mesa_de_juego.jugador_en_activo]=c3
		 	@mesa_de_juego.siguiente_jugador_en_activo
		 	@mesa_de_juego.baza_en_juego.muestra_en_pantalla
		 	
			# Igual que la anterior	
			c4 = @mesa_de_juego.jugadores[@mesa_de_juego.jugador_en_activo].juega @mesa_de_juego.baza_en_juego
		 	@mesa_de_juego.baza_en_juego.baza[@mesa_de_juego.jugador_en_activo]=c4
		 	@mesa_de_juego.siguiente_jugador_en_activo
		 	@mesa_de_juego.baza_en_juego.muestra_en_pantalla
		 	
			# Comprueba quien ha ganado la baza (jugador que haya echalado la carta mas alta del palo inicial)
			jugador_que_gana = @mesa_de_juego.baza_en_juego.quien_gana c1
			# Le suma un negativo
		 	@mesa_de_juego.jugadores[jugador_que_gana].puntuacion_jugador -= 1
			# El jugador que ha ganado comienza la siguiente baza
		 	@mesa_de_juego.jugador_en_activo = jugador_que_gana
			# Muestra la mesa en la pantalla
			@mesa_de_juego.muestra_en_pantalla
	 	end
 	end
end

# Ejecuta el programa
j = Juego.new
j.crea_mesa "AGU","MJ","AQUI","JP"
j.inicia_juego

