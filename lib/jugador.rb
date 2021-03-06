$LOAD_PATH << "lib/ia/."
require "ia"
require "ia_manual"
require "ia_no_hacer"
require "ia_no_hacer_v0"
require "ia_no_hacer_v1"
require "ia_no_hacer_v2"

# Clase Jugador. Modela la informacion necesaria para un jugador: Nombre, puntuacion y mano de cartas que tiene.
#
# @!attribute [r] nombre_jugador
# 	Almacena el nombre del jugador.
# 	@return [String]
#
# @!attribute [rw] puntuacion_jugador
# 	Almacena la puntuacion de un jugador, siempre un entero positivo o negativo. La puntuacion inicial es 0. Lo modifican clases como Juego.
# 	@return [Integer]
#
# @!attribute [rw] mano_jugador
# 	Almacena la mano de un jugador. La mano inicial es un array vacio. Lo modifican diferentes clases como Baraja, etc.
# 	@return [Array] Array de objetos Carta.
# 	@see Carta
#
# @!attribute [r] ia_jugador
# 	Almacena la IA del jugador.
# 	@return [IA] IA del jugador.
#
# @!attribute [r] nivel_inteligencia_jugador
# 	Almacena el nivel de inteligencia del jugador. Este nivel será usado más tarde para la instanciacion de la clase ia que corresponda a la ronda.
# 	@return [String] Codificacion segun el modulo Constantes.
# 	@see Constantes::NIVEL_0
#
# @author old-wyrm
#
class Jugador
	attr_reader :nombre_jugador, :nivel_inteligencia_jugador, :ia_jugador
	attr_accessor :mano_jugador, :puntuacion_jugador

	# Crea un objeto Jugador.
	#
	# @param nombre [String] Nombre del jugador a crear. Este nombre es inmutable.
	# @param v [Boolean] Indica el modo de salida en pantalla. Si true muestra etapas intermedias de la partida.
	#
	def initialize nombre, nivel, v

		# Establece nivel de salida por pantalla
		@verbose = v

		@nombre_jugador = nombre
		@puntuacion_jugador = 0
		@mano_jugador = nil
		@ia_jugador = nil
		@nivel_inteligencia_jugador = nivel

		Util.muestra_msg "Jugador creado.. =>"+nombre+" IA"+nivel.to_s+"\n",v
	end

	# Convierte y formatea un jugador en una cadena de caracteres.
	#
	# @return [String] Cadena formateada.
	#
	def to_s
		salida = @nombre_jugador+" "+@puntuacion_jugador.to_s+" ptos "
		m = @mano_jugador.sort!{|a,b| (Carta.to_i a) <=> (Carta.to_i b)}
		indice_carta = 0
		m.each do |c|
			salida = salida + " " + indice_carta.to_s + ":" + c.to_s
			indice_carta = indice_carta + 1
		end
		salida = salida + "\n"
		return salida
	end
	
	# Instancia la IA del jugador. La clase IA seleccionada dependera de la ronda que toca y el nivel de inteligencia que le demos al jugador al crearlo.
	#
	# @param ronda [String] Ronda que toca codificada segun constantes
	# @see Constantes
	#
	def juega ronda
		# Comprobamos si es un jugador manual
		if @nivel_inteligencia_jugador == Constantes::MANUAL
			then
			@ia_jugador = IA_manual.new @verbose
		else

			# Miramos que ronda toca
			case ronda
			when Constantes::NO_HACER
				# Miramos el nivel de inteligencia que tiene el jugadorR
				case @nivel_inteligencia_jugador
				when Constantes::NIVEL_0
					@ia_jugador = IA_no_hacer_v0.new @verbose
				when Constantes::NIVEL_1 
					@ia_jugador = IA_no_hacer_v1.new @verbose
				when Constantes::NIVEL_2
					@ia_jugador = IA_no_hacer_v2.new @verbose
				end
			end	
		end
	end

	# Juega la primera carta de una baza. Inicialmente solo para la ronda no_hacer. 
	# 
	# @return [Carta] Devuelve un objeto carta jugado y sacado de su mano.
	# @note Extender al resto de rondas.
	#
	def juega_primero
		carta_a_jugar = @ia_jugador.juega_primero @mano_jugador
		@mano_jugador.delete carta_a_jugar
		# devuelve la carta para que sea introducida en una baza
		return carta_a_jugar
	end

	# Juega una carta de una baza. Inicialmente solo para la ronda no_hacer. 
	#
	# @param c [Carta] Carta inicial de la baza en juego.
	# @param b [Baza] Baza en juego.
	# @see Baza
	# @return [Carta] Devuelve un objeto carta jugado y sacado de su mano.
	# @note Extender al resto de rondas.
	# @note Sobrecargar el metodo para que juega_primero y juega se llamen igual?
	#
	def juega_despues c, b
		carta_a_jugar = @ia_jugador.juega_despues @mano_jugador, c, b
		@mano_jugador.delete carta_a_jugar
		return carta_a_jugar
	end
end
