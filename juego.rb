# $LOAD_PATH << "."
# require

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
# @note Clase principal de la IA
#
class Juego
	attr_reader :mesa_de_juego
	
	# Crea una mesa de juego. Usando la clase Mesa y a partir de cuatro nombres de jugadores inicializando las variables internas @mesa_de_juego y @baraja_de_juego
	#
	# @see Mesa
	# @note para que queremos esto aqui? aporta algo?
	#
	# @param j1 [String] Nombre del jugador 1
	# @param j2 [String] Nombre del jugador 2
	# @param j3 [String] Nombre del jugador 3
	# @param j4 [String] Nombre del jugador 4
	# @param v [Boolean] Indica el modo de salida en pantalla. Si true muestra etapas intermedias de la partida.
	#
	def initialize j1,n1,j2,n2,j3,n3,j4,n4,v
		# establece el modo de salida por pantalla
		@verbose = v

		jugador1 = Jugador.new j1,n1, v
		jugador2 = Jugador.new j2,n2, v
		jugador3 = Jugador.new j3,n3, v
	 	jugador4 = Jugador.new j4,n4, v
	 	@mesa_de_juego = Mesa.new jugador1, jugador2, jugador3, jugador4, v

		Util.muestra_msg "Juego creado..\n",@verbose
 	end

 	# Inicia la partida. Lleva a cabo la partida mediante llamadas internas a las diferentes rondas
	#
	# @return [Hash] Hash con la puntuacion en el juego para cada jugador. Usa como indices las constantes definidas en el modulo Constantes.
	#
	def inicia_juego 

		Util.muestra_msg "Iniciando juego..\n",@verbose

		# rondas negativas
		@mesa_de_juego.juega_ronda_no_hacer
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
		puntuaciones = {}
		j = @mesa_de_juego.jugadores
		j.each do |clave,valor|
			nombre = valor.nombre_jugador
			puntuacion = valor.puntuacion_jugador
			puntuaciones [nombre]=puntuacion
		end
		return puntuaciones
	end
end

