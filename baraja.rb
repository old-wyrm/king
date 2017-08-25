# $LOAD_PATH << "."
# require 

# Clase Baraja. Esta clase se usa a la hora de crear una baraja estandar francesa y a la hora de repartir las cartas entre los jugadores.
#
# @!attribute [r] baraja
# 	Almacena la baraja como un array de objetos Carta.
# 	@return [Array] Array de objetos Carta.
# 	@see Carta
#
# @author old-wyrm
#
class Baraja
	attr_reader :baraja

	# Crea el objeto baraja. La baraja es una baraja francesa tipica, sin comodines. Para crearla, Recorre los palos y valores creando un objeto Carta para cada posible par palo/valor.
	#
	# @see Constantes::PALOS
	# @see Constantes::VALORES
	#
	def initialize ()
		# inicializa la variable baraja como un array vacio
		@baraja = []
		# recorre el array con todos los palos
		Constantes::PALOS.each do |p|
			# Recorre el array con todos los valores
			Constantes::VALORES.each do |v|
				# Para cada combinacion de palo/valor crea un objeto Carta y lo guarda en la baraja
				c = Carta.new v,p
				@baraja << (Carta.new v,p)

			end
		end
	end
	
	# Repartir es la funcion para repartir cartas entre los jugadores. Reparte todas las cartas almacenadas en la baraja, al azar, entre todos los jugadores de la mesa pasada como parametro.
	#
	# @param jugadores [Hash] Jugadores de la mesa de juego.
	# @param jugador_inicial [String] Jugador inicial de la ronda.
	#
	def repartir jugadores, jugador_inicial
		# Repite esta secuencia el tamaño maximo de la baraja menos 2. Una vez menos por el indice del array que es empieza a cero. Otra vez menos por la salida controlada.
		jugador_que_toca = jugador_inicial
		for i in (0.. Constantes::TAMANO_MAX_BARAJA - 2)
			# rand (x) produce un numero entero entre 0 y x-1
			indice = rand (Constantes::TAMANO_MAX_BARAJA - i)
			# la carta elegida al azar es @baraja[indice]
			# asigna la carta al jugador que le toca en el reparto (circular)
			j1 = jugadores[jugador_que_toca]
			# Si la mano de un jugador (array de cartas) no esta creado
			if j1.mano_jugador == nil
				then
				# lo crea con la carta seleccionada como unico elemento
				j1.mano_jugador = [@baraja [indice]]
			else
				# si ya esta creado (array vacio o con elementos) inserta al final del array la carta seleccionada
				j1.mano_jugador << @baraja[indice]
			end 
			# pasa al siguiente jugador
			jugador_que_toca = Util.siguiente_jugador jugador_que_toca
			#saca la carta de la baraja
			@baraja = @baraja - [@baraja[indice]]

		end
		# queda un elemento en el array de baraja
		# sera para el ultimo jugador y estara en @baraja[0]
		j1 = jugadores[jugador_que_toca]
		j1.mano_jugador << @baraja[0]
		# pasa al siguiente jugador para que es al que le tocara jugar
		jugador_que_toca = Util.siguiente_jugador jugador_que_toca
	end
end
