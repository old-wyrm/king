# $LOAD_PATH << "."
# require

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
# @author old-wyrm
#
class Jugador
	attr_reader :nombre_jugador
	attr_accessor :mano_jugador, :puntuacion_jugador

	# Crea un objeto Jugador.
	#
	# @param nombre [String] Nombre del jugador a crear. Este nombre es inmutable.
	#
	def initialize nombre
		@nombre_jugador = nombre
		@puntuacion_jugador = 0
		@mano_jugador = nil
		@ia_jugador = nil

	end

	# Muestra un jugador por pantalla.
	#
	def muestra_en_pantalla
		print @nombre_jugador," ",@puntuacion_jugador," "
		@mano_jugador.each do |c|
			c.muestra_en_pantalla
		end
		print "\n"
	end

	# Juega la primera carta de una baza. Inicialmente solo para la ronda no_hacer. 
	#
	# @return [Carta] Devuelve un objeto carta jugado y sacado de su mano.
	# @note Extender al resto de rondas.
	#
	def juega_primero
		carta_mas_baja = nil
		# Recorre tdos los palos
		Constantes::PALOS.each do |p|
			carta_mas_baja_de_un_palo = nil
			# Obtiene todas las cartas de la mano del jugador de ese palo
			cartas_de_un_palo = Carta.cartas_de_un_palo @mano_jugador, p
			# Si tiene cartas dese palo
			if cartas_de_un_palo.size != 0
				then
				# Obtiene la carta mas baja
				carta_mas_baja_de_un_palo = Carta.carta_mas_baja cartas_de_un_palo
				# Si es la primera iteracion
				if carta_mas_baja == nil
					then
					# la toma como la carta mas baja
					carta_mas_baja = carta_mas_baja_de_un_palo
				else
					# sino es la primera iteracion las compara y si carta tomada como la mas baja es mayor la sustituye
					if carta_mas_baja.es_mayor carta_mas_baja_de_un_palo
						then
						carta_mas_baja = carta_mas_baja_de_un_palo
					end
				end
			end
		end
		# borra la carta de la mano del jugador
		@mano_jugador.delete carta_mas_baja
		# devuelve la carta para que sea introducida en una baza
		return carta_mas_baja
	end

	# Juega una carta de una baza. Inicialmente solo para la ronda no_hacer. 
	#
	# @param b [Baza] Baza en Juego. Al menos contendrá una carta ya que antes se llamo a juega_primero
	# @see Baza
	# @return [Carta] Devuelve un objeto carta jugado y sacado de su mano.
	# @note Extender al resto de rondas.
	# @note Sobrecargar el metodo para que juega_primero y juega se llamen igual?
	#
	def juega b
		carta_a_jugar = nil
		carta_mas_baja_de_un_palo = nil
		# Obtiene la menor carta de una baza
		# Aqui puede haber un posible error ya que tendriamos que tener en cuenta cual es el palo inicial de la baza
		c1 = b.carta_menor_baza
		# Recorre la mano del jugador
		@mano_jugador.each do |c2|
			# Mirando cartas del mismo palo
			if c2.es_mismo_palo c1
				then
				# Que sean mas altas 
				if carta_mas_baja_de_un_palo == nil
					then
					carta_mas_baja_de_un_palo = c2
				end
				if c2.es_menor c1
					then
					carta_mas_baja_de_un_palo = c2
				end
			end
		end
		# Sino tiene cartas mas altas de ese palo
		if carta_mas_baja_de_un_palo == nil
			then
			carta_mas_alta_de_otro_palo = nil
			# Recorre la mano del jugador buscando la carta mas alta de cualquier palo
			@mano_jugador.each do |c3|
				if carta_mas_alta_de_otro_palo == nil
					then
					carta_mas_alta_de_otro_palo = c3
				end
				if carta_mas_alta_de_otro_palo.es_menor c3
					then
					carta_mas_alta_de_otro_palo = c3
				end
			end
			carta_a_jugar = carta_mas_alta_de_otro_palo
		else
			carta_a_jugar = carta_mas_baja_de_un_palo
		end
		# Elimina esa carta de la mano del jugador
		@mano_jugador.delete carta_a_jugar
		return carta_a_jugar
	end
end
