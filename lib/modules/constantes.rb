# $LOAD_PATH << "."
# require 

# Modulo con la definicion de constantes usadas por las distintas clases.
#
# @author old-wyrm
#
module Constantes
	# Indice/Identificador del primer jugador.
	J1 = "N"
	# Indice/Identificador del segundo jugador.
	J2 = "E"
	# Indice/Identificador del tercer jugador.
	J3 = "S"
	# Indice/Identificador del cuarto jugador.
	J4 = "O"

	# Codificacion para una carta del palo corazones.
	CORAZONES = "c"
	# Codificacion para una carta del palo picas.
	PICAS = "p"
	# Codificacion para una carta del palo diamante.s
	DIAMANTES = "d"
	# Codificacion para una carta del palo treboles.
	TREBOLES = "t"
	# Array con la codificacion de todos los palos.
	PALOS = [CORAZONES, PICAS, DIAMANTES, TREBOLES]

	# Codificacion para una carta con valor dos.
	DOS = "2"
	# Codificacion para una carta con valor tres.
	TRES = "3"
	# Codificacion para una carta con valor cuatro.
	CUATRO = "4"
	# Codificacion para una carta con valor cinco.
	CINCO = "5"
	# Codificacion para una carta con valor seis.
	SEIS = "6"
	# Codificacion para una carta con valor siete.
	SIETE = "7"
	# Codificacion para una carta con valor ocho.
	OCHO = "8"
	# Codificacion para una carta con valor nueve.
	NUEVE = "9"
	# Codificacion para una carta con valor diez.
	DIEZ = "10"
	# Codificacion para una carta con valor J.
	J = "j"
	# Codificacion para una carta con valor Q.
	Q = "q"
	# Codificacion para una carta con valor K.
	K = "k"
	# Codificacion para una carta con valor as.
	AS = "a"
	# Array con la codificcion de todos los valores.
	VALORES = [DOS, TRES, CUATRO, CINCO, SEIS, SIETE, OCHO, NUEVE, DIEZ, J, Q, K, AS]

	# Tamaño maximo de la baraja
	TAMANO_MAX_BARAJA = 52

	# Codificacion para la ronda no hacer
	NO_HACER = "no_hacer"

	# Condificacion para el nivel de inteligencia 0
	NIVEL_0 = 0
	# Condificacion para el nivel de inteligencia 1
	NIVEL_1 = 1
	# Condificacion para el nivel de inteligencia 2
	NIVEL_2 = 2
end
