# $LOAD_PATH << "."
# require 

# Clase Baza. Esta clase se usara para modelar las bazas en juego o jugadas. Una baza son de 1 a 4 cartas jugadas por cada uno de los jugadores.
#
# @!attribute [rw] baza 
# 	Almacena una baza. Es modificado desde el objeto Juego para ir añadiendo las cartas jugadas por cada jugador.
# 	@return [Hash] Hash de objetos Carta. Se usa como indices del hash las constantes declaradas en el modulo Constantes para cada Jugador.
# 	@see Carta
# 	@see Constantes
#
# @!attribute [r] jugador_inicial_baza
# 	Almacena quien fue el jugador inicial de una baz
# 	@return [String] Cadena identificadora de un jugador segun el formato establecido el modulo Constantes.
# 	@see Constantes
#
# @author old-wyrm
#
class Baza
	attr_accessor :baza
	attr_reader :jugador_inicial_baza

	# Inicializacion del objeto. Establece el atributo @baza a nil.
	#
	# @param j [String] Jugador inicial de la baza
	#
	def initialize j
		@baza = nil
		@jugador_inicial_baza = j
	end

	# Convierte y formatea una baza en una cadena de caracteres.
	#
	# @return [String] Cadena formateada.
	#
	def to_s
		salida = @jugador_inicial_baza
		salida = salida + "(" + Constantes::J1 + "=>"
		salida = salida + @baza[Constantes::J1].to_s if @baza[Constantes::J1] != nil
		salida = salida + " " + Constantes::J2 + "=>"
		salida = salida + @baza[Constantes::J2].to_s if @baza[Constantes::J2] != nil
		salida = salida + " " + Constantes::J3 + "=>"
		salida = salida + @baza[Constantes::J3].to_s if @baza[Constantes::J3] != nil
		salida = salida + " " + Constantes::J4 + "=>"
		salida = salida + @baza[Constantes::J4].to_s if @baza[Constantes::J4] != nil
		salida = salida + ")\n"
		return salida 
	end

	# Devuelve la menor carta de una baza. Recorre todas las cartas de una baza y devuelve la menor.
	#
	# @return [Carta] Carta con menor valor de una baza.
	# @note No deberiamos tener en cuenta el palo?
	# @note No deberiamos tener en cuenta si la baza esta vacia o es nil?
	#
	def carta_menor_baza 
		carta_menor = nil
		# Recorreo todos los pares clave/valor del hash
		@baza.each do |clave,valor|
			# Si es la primera iteracion
			if carta_menor == nil
				then
				# Asigna la primera carta recorrida a la variable 
				carta_menor = valor
			else
				# Sino es la primera iteracion
				# Si la carta en la variable es mayor que la nueva carta en iteracion
				if carta_menor.es_mayor valor
					then
					# La asigna
					carta_menor = valor
				end
			end
		end
		# Salvo que la baza este vacia siempre va a devolver una carta 
		return carta_menor
	end

	# Devuelve que jugador gana una baza. El ganador siempre es aquel que ha jugado la mayor carta del palo de inicio.
	#
	# @param c [Carta] Carta inicial de la baza.
	# @return [String] Devuelve la constante del jugador que ha ganado.
	# @see Constantes::J1
	# @note no tendriamos que controlar que la carta inicial este en la baza o no este a nil?
	#
	def quien_gana c
		# Valor inicial: El jugador que ha jugado la carta de inicio
		carta_ganadora = c
		# Recorre toda la baza
		@baza.each do |clave,valor|
			# Si la carta de la iteracion es mayor que la carta inicial
			if valor.es_mismo_palo carta_ganadora and valor.es_mayor carta_ganadora
				then
				# Guardamos al nuevo ganador
				carta_ganadora = valor
			end
		end
		# Siempre devolvera un valor a menos que la carta inicial este a nil o no se encuentre en la baza
		return @baza.key carta_ganadora
	end

	# Devuelve las cartas que se han jugado en una baza, sin importar quien.
	#
	# @return [Array] Array de objetos Carta que se han jugado.
	#
	def obtiene_cartas_jugadas
		cartas_jugadas = []
		jugadas = @baza.to_a
		jugadas.each do |jugada|
			cartas_jugadas << jugada[1]
		end
		return cartas_jugadas
	end
end
