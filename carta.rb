class Carta
	CORAZONES = "c"
	PICAS = "p"
	DIAMANTES = "d"
	TREBOLES = "t"
	PALOS = [CORAZONES, PICAS, DIAMANTES, TREBOLES]

	AS = "a"
	DOS = "2"
	TRES = "3"
	CUATRO = "4"
	CINCO = "5"
	SEIS = "6"
	SIETE = "7"
	OCHO = "8"
	NUEVE = "9"
	DIEZ = "10"
	J = "j"
	Q = "q"
	K = "k"
	VALORES = [AS, DOS, TRES, CUATRO, CINCO, SEIS, SIETE, OCHO, NUEVE, DIEZ, J, Q, K]

	def initialize (palo, valor)
	       @carta = palo + valor	
	       @palo = palo
	       @valor = valor
	end
	
	attr_reader :carta, :palo, :valor
end
