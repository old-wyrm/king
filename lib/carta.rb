# $LOAD_PATH << "."
# require

# Clase Carta. Modela a los objetos tipo cartas. Una carta no deja de ser una cadena de texto con el formato "valor+palo"
#
# @!attribute [r] carta
# 	Almacena la carta codificada segun el modulo de constantes en la forma "valor+palo". P.e. "a+c" es el as de corazones.
# 	@return [String] Codificacion de la carta.
# 	@see Constantes
#
# @author old-wyrm
#
class Carta
	attr_reader :carta

	# Crea un objeto tipo Carta.
	#
	# @param valor [String] Valor de la carta, codificado segun el modulo de constantes.
	# @param palo [String] Palo de la carta, codificado segun el modulo de constantes.
	#
	def initialize valor,palo
	       @carta = valor + "+" + palo
	end

	# Compara el palo de dos cartas.
	#
	# @param c [Carta] Carta a comparar.
	# @return [Boolean]
	#
	def es_mismo_palo c
		(@carta.split "+")[1] == (c.carta.split "+") [1]
	end

	# Compara el valor de dos cartas.
	#
	# @param c [Carta] Carta a comparar.
	# @return [Boolean]
	#
	def es_igual c
		(@carta.split "+")[0] == (c.carta.split "+") [0]
	end

	# Compara si una carta es menor que otra.
	#
	# @param c [Carta] Carta a comparar.
	# @return [Boolean] True si el objeto es menor que la carta pasada como parametro.
	#
	def es_menor c
		# Para comparar enteros primero hay que convertir los valores de las cartas que tienen letras p.e. "j" o "as"
		a_valor_i= 0
		case (@carta.split "+")[0]
		when Constantes::J
			a_valor_i = 11
		when Constantes::Q
			a_valor_i = 12
		when Constantes::K
			a_valor_i = 13
		when Constantes::AS
			a_valor_i = 14
		else
			a_valor_i = (@carta.split "+")[0].to_i
		end
		b_valor_i=0
		case (c.carta.split "+")[0]
		when Constantes::J
			b_valor_i = 11
		when Constantes::Q
			b_valor_i = 12
		when Constantes::K
			b_valor_i = 13
		when Constantes::AS
			b_valor_i = 14
		else
			b_valor_i = (c.carta.split "+")[0].to_i
		end
		a_valor_i < b_valor_i
	end

	# Compara si una carta es mayor que otra.
	#
	# @param c [Carta] Carta a comparar.
	# @return [Boolean] True si el objeto es menor que la carta pasada como parametro.
	#
	def es_mayor c
		# Para comparar enteros primero hay que convertir los valores de las cartas que tienen letras p.e. "j" o "as"
		a_valor_i= 0
		case (@carta.split "+")[0]
		when Constantes::J
			a_valor_i = 11
		when Constantes::Q
			a_valor_i = 12
		when Constantes::K
			a_valor_i = 13
		when Constantes::AS
			a_valor_i = 14
		else
			a_valor_i = (@carta.split "+")[0].to_i
		end
		b_valor_i=0
		case (c.carta.split "+")[0]
		when Constantes::J
			b_valor_i = 11
		when Constantes::Q
			b_valor_i = 12
		when Constantes::K
			b_valor_i = 13
		when Constantes::AS
			b_valor_i = 14
		else
			b_valor_i = (c.carta.split "+")[0].to_i
		end
		a_valor_i >  b_valor_i
	end

	# Convierte y formatea una carta en una cadena de caracteres.
	#
	# @return [String] Cadena formateada.
	#
	def to_s
		salida = @carta
		return salida
	end

	# Devuelve la carta mas baja de un array de cartas, sean o no del mismo palo. Es un metodo de clase.
	# 
	# @param array_cartas [Array] Array de objetos Carta
	# @note No deberiamos controlar que el array tenga al menos un elemento?
	#
	def Carta.carta_mas_baja array_cartas
		mas_baja = nil
		# Recorre el array extrayendo los elementos carta uno a uno
		array_cartas.each do |c|
			# Si es el primer elemento sacado
			if mas_baja == nil
				then
				# la asigna como mas baja
				mas_baja = c
			else
				# sino es el primer elemento las compara
				if (mas_baja.es_mayor c)
					then
					# Si la nueva carta es menor la asigna como carta mas baja
					mas_baja = c
				end
				
			end
		end
		# Siempre devolvera una carta a menos que el array este vacio o nil
		return mas_baja
	end

	# Dado un array de cartas y un palo, devuelve un segundo array con las cartas del primero que son de ese palo. Es un metodo de clase.
	#
	# @param array_cartas [Array] Array de objetos Carta.
	# @param palo [String] Identificador de un palo tal y como esta definido en el modulo de Constantes.
	# @see Constantes::PALOS
	# @note No deberiamos controlar que el array tenga al menos un elemento?
	# @note No deberiamos hacerla un metodo de objeto y evitar pasarle el palo como parametro?
	#
	def Carta.cartas_de_un_palo array_cartas, palo
		# Inicializa el array a devolver
		de_un_palo = []
		# Crea una carta de ejemplo para poder comparar
		carta_ejemplo = Carta.new Constantes::AS,palo
		# Recorre el array extrayendo los objetos tipo Carta almacenados
		array_cartas.each do |c|
			# Si la carta extraida es del mismo palo que la carta ejemplo creada
			if carta_ejemplo.es_mismo_palo c
			then
				# la añade al array a devolver
				de_un_palo << c
			end	
		end
		return de_un_palo
	end

	# Metodo de clase. Asigna un valor numerico a una carta para permitir su ordenacion.
	#
	# @param c [Carta] Objeto tipo carta a convertir.
	# @return [Integer] Valor entero asignado a la carta en funcion de su valor y su palo.
	#
	def Carta.to_i c
		a_valor_i = 0
		case (c.carta.split "+")[0]
		when Constantes::J
			a_valor_i = 11
		when Constantes::Q
			a_valor_i = 12
		when Constantes::K
			a_valor_i = 13
		when Constantes::AS
			a_valor_i = 14
		else
			a_valor_i = (c.carta.split "+")[0].to_i
		end
		case (c.carta.split "+")[1]
		when Constantes::CORAZONES
			a_valor_i = a_valor_i + 10000
		when Constantes::PICAS
			a_valor_i = a_valor_i + 1000
		when Constantes::DIAMANTES
			a_valor_i = a_valor_i + 100
		when Constantes::TREBOLES
			a_valor_i = a_valor_i + 0
		end
		return a_valor_i
	end
end
