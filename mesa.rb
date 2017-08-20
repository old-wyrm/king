# $LOAD_PATH << "."
# require "baraja"

# Clase para la modelizacion de la mesa de juego. Mantiene el estado de la mesa en todo momento.
#
# @!attribute [rw] jugador_en_activo
#       Almacena el jugador al que le toca jugar en la forma de una constante definida. Es modificada por Juego.
#       @return [String] Constante del jugador al que le toca jugar segun el módulo Constantes.
#       @see Constantes
#
# @!attribute [r] jugadores
# 	Almacena los jugadores de la mesa. 
# 	@return [Hash] Hash de objetos Jugador. Se usa como indices del hash las constantes declaradas en el modulo Constantes.
# 	@see Jugador
# 	@see Constantes
#
# @!attribute [r] bazas_jugadas
# 	Almacena el listado de bazas jugadas a lo largo de la partida.
# 	@return [Array] Array de objetos Baza jugados de forma secuencial.
# 	@see Baza
#
# @!attribute [re] baza_en_juego
# 	Almacena la baza que se esta jugando en estos momentos. Es modificada por Juego.
# 	@return [Baza] Baza en juego. 
#
# @author old-wyrm
#
class Mesa
	attr_reader :jugadores, :jugador_en_activo, :bazas_jugadas
	attr_accessor :baza_en_juego, :jugador_en_activo

	# Inicializacion de la clase. Inicializa las variables @jugadores, @jugador_en_activo y @baza
	#
	# @param j1 [Jugador] Jugador 1
	# @param j2 [Jugador] Jugador 2
	# @param j3 [Jugador] Jugador 3
	# @param j4 [Jugador] Jugador 4
	#
	def initialize j1,j2,j3,j4
		@jugadores = {Constantes::J1 => j1, Constantes::J2 => j2, Constantes::J3 => j3, Constantes::J4 => j4}
		@jugador_en_activo = Constantes::J1
		@bazas_jugadas = []
		@baza_en_juego = nil
	end

	# Pasa el turno al siguiente jugador modificando la variable @jugador_en_activo. Establece orden circular, de forma que detrás del cuarto jugador va de nuevo el primero.
	#
	def siguiente_jugador_en_activo
		case @jugador_en_activo
		when Constantes::J1
			@jugador_en_activo = Constantes::J2
		when Constantes::J2
			@jugador_en_activo = Constantes::J3
		when Constantes::J3
			@jugador_en_activo = Constantes::J4
		when Constantes::J4
			@jugador_en_activo = Constantes::J1
		end
	end

	# Muestra la mesa de juego
	#
	def muestra_en_pantalla
		print Constantes::J1,"=>"
		@jugadores[Constantes::J1].muestra_en_pantalla
		print Constantes::J2,"=>"
		@jugadores[Constantes::J2].muestra_en_pantalla
		print Constantes::J3,"=>"
		@jugadores[Constantes::J3].muestra_en_pantalla
		print Constantes::J4,"=>"
		@jugadores[Constantes::J4].muestra_en_pantalla
		print "Turno actual: ",@jugadores[@jugador_en_activo].nombre_jugador,"\n"

	end

	def muestra_resumen
		print "[",@jugadores[Constantes::J1].nombre_jugador,"=>",@jugadores[Constantes::J1].puntuacion_jugador," "	
		print @jugadores[Constantes::J2].nombre_jugador,"=>",@jugadores[Constantes::J2].puntuacion_jugador," "	
		print @jugadores[Constantes::J3].nombre_jugador,"=>",@jugadores[Constantes::J3].puntuacion_jugador," "	
		print @jugadores[Constantes::J4].nombre_jugador,"=>",@jugadores[Constantes::J4].puntuacion_jugador,"]["
		@bazas_jugadas.each do |b|
			b.muestra_en_pantalla
		end
		print "]\n"
	end

	# Metodo para jugar la primera ronda de negativas, "no hacer". La ronda tiene 13 bazas en las cuales los jugadores ganan puntos negativos.
	#
 	def juega_ronda_no_hacer
		# Una ronda siempre empieza con el reparto de cartas, inicializando las IA y mostrando la mesa de juego por pantalla
		baraja_de_juego = Baraja.new
		baraja_de_juego.repartir @jugadores, @jugador_en_activo

		@jugadores[Constantes::J1].juega Constantes::NO_HACER
		@jugadores[Constantes::J2].juega Constantes::NO_HACER
		@jugadores[Constantes::J3].juega Constantes::NO_HACER
		@jugadores[Constantes::J4].juega Constantes::NO_HACER

		# Juega las 13 bazas
		for i in 0..12
			# muestra la mesa
			print "\n"
			muestra_en_pantalla
			# Para cada baza crea un nuevo objeto Baza
		 	@baza_en_juego = Baza.new

		        # Obtiene la carta del primer jugador
			# La mete en la baza en juego
			# Pasa al siguiente jugador
		 	c1 = @jugadores[@jugador_en_activo].juega_primero
		 	@baza_en_juego.baza = {@jugador_en_activo => c1}
			@baza_en_juego.muestra_en_pantalla
			print "\n"
		 	siguiente_jugador_en_activo

			# Igual que la anterior pero en lugar de jugar_primero llama a jugar (ya hay una carta en la baza por tanto)
		 	c2 = @jugadores[@jugador_en_activo].juega_despues c1, @baza_en_juego
		 	@baza_en_juego.baza[@jugador_en_activo]=c2
			@baza_en_juego.muestra_en_pantalla
			print "\n"
		 	siguiente_jugador_en_activo
		 	
			# Igual que la anterior	
			c3 = @jugadores[@jugador_en_activo].juega_despues c1, @baza_en_juego
		 	@baza_en_juego.baza[@jugador_en_activo]=c3
			@baza_en_juego.muestra_en_pantalla
			print "\n"
		 	siguiente_jugador_en_activo
		 	
			# Igual que la anterior	
			c4 = @jugadores[@jugador_en_activo].juega_despues c1, @baza_en_juego
		 	@baza_en_juego.baza[@jugador_en_activo]=c4
			@baza_en_juego.muestra_en_pantalla
			print "\n"
		 	siguiente_jugador_en_activo
		 	
			# Comprueba quien ha ganado la baza (jugador que haya echalado la carta mas alta del palo inicial)
			jugador_que_gana = @baza_en_juego.quien_gana c1
			# Le suma un negativo
		 	@jugadores[jugador_que_gana].puntuacion_jugador -= 1
			# El jugador que ha ganado comienza la siguiente baza
		 	@jugador_en_activo = jugador_que_gana
			# Guarda la baza en bazas_jugadas
			@bazas_jugadas << @baza_en_juego
	 	end
		# muestra_resumen
	end
end
