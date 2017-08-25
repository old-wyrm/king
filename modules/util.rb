# $LOAD_PATH << "."
# require 

# Modulo con la definicion de metodos usados por distintas clases
#
# @author old-wyrm
#
module Util
	# Pasa el turno al siguiente jugador modificando la variable @jugador_en_activo. Establece orden circular, de forma que detrás del cuarto jugador va de nuevo el primero.
	#
	# @param j [String] Recibe el identificador de un jugador
	# @return [String] Devuelve el siguiente jugador en orden circular
	#
	def Util.siguiente_jugador j
		siguiente = nil
		case j
		when Constantes::J1
			siguiente = Constantes::J2
		when Constantes::J2
			siguiente = Constantes::J3
		when Constantes::J3
			siguiente = Constantes::J4
		when Constantes::J4
			siguiente = Constantes::J1
		end
		return siguiente
	end

	# Muestra mensaje por pantalla. 
	#
	# @param m [String] Mensaje a mostrar por pantella.
	# @param v [Booelan] Modo verbose.
	#
	def Util. muestra_msg m, v
		if v
			then
			print m
		end
	end
end
