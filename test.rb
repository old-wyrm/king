$LOAD_PATH << "."
require "lib/baraja"
require "lib/baza"
require "lib/carta"
require "lib/juego"
require "lib/jugador"
require "lib/mesa"
require "lib/modules/constantes"
require "lib/modules/util"

verbose = true
num_juegos = 1

resultados = {"AGU" => 0,"MJ" => 0, "AQUI" => 0, "JP" => 0}

for i in 1..num_juegos
	j = Juego.new "AGU",Constantes::MANUAL,"MJ",Constantes::NIVEL_2,"AQUI",Constantes::NIVEL_1,"JP",Constantes::NIVEL_1, verbose
	puntos = j.inicia_juego
	#print puntos,"\n"
	puntos.each do |clave,valor|
		resultados[clave]=resultados[clave]+valor
	end
end

print resultados,"\n"
print "{AGU=>",((resultados["AGU"]*100)/(num_juegos*1.0*13)).floor,"% "
print "MJ=>",((resultados["MJ"]*100)/(num_juegos*1.0*13)).floor,"% "
print "AQUI=>",((resultados["AQUI"]*100)/(num_juegos*1.0*13)).floor,"% "
print "JP=>",((resultados["JP"]*100)/(num_juegos*1.0*13)).floor,"%}\n"


