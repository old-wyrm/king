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
# @author old-wyrm
#
class Baza
	attr_accessor :baza

	# Inicializacion del objeto. Establece el atributo @baza a nil.
	#
	def initialize
		@baza = nil
	end

	# Muestra en pantalla la baza.
	#
	def muestra_en_pantalla
		print "Baza:"
		print Constantes::J1,"=>"
		@baza [Constantes::J1].muestra_en_pantalla if @baza[Constantes::J1] != nil
		print " ",Constantes::J2,"=>"
		@baza [Constantes::J2].muestra_en_pantalla if @baza[Constantes::J2] != nil
		print " ",Constantes::J3,"=>"
		@baza [Constantes::J3].muestra_en_pantalla if @baza[Constantes::J3] != nil
		print " ",Constantes::J4,"=>"
		@baza [Constantes::J4].muestra_en_pantalla if @baza[Constantes::J4] != nil
		print "\n"
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
	# @param c [Carta] Carta de la que se extrae el palo de inicio.
	# @return [String] Devuelve una de las constantes definidas para identificar a los jugadores.
	# @see Constantes::J1
	# @note no tendriamos que controlar que la carta inicial este en la baza o no este a nil?
	#
	def quien_gana c
		# Valor inicial: El jugador que ha jugado la carta de inicio
		ganador = @baza.key c
		# Recorre toda la baza
		@baza.each do |clave,valor|
			# Si la carta de la iteracion es mayor que la carta inicial
			if valor.es_mayor c
				then
				# Guardamos al nuevo ganador
				ganador = clave
			end
		end
		# Siempre devolvera un valor a menos que la carta inicial este a nil o no se encuentre en la baza
		return ganador
	end
end
