# $LOAD_PATH << "."
# require 

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
		print @jugadores[Constantes::J1].muestra_en_pantalla
		print Constantes::J2,"=>"
		print @jugadores[Constantes::J2].muestra_en_pantalla
		print Constantes::J3,"=>"
		print @jugadores[Constantes::J3].muestra_en_pantalla
		print Constantes::J4,"=>"
		print @jugadores[Constantes::J4].muestra_en_pantalla
		print "Turno actual: ",@jugadores[@jugador_en_activo].nombre_jugador,"\n"

	end
end
