import tablero.*

object heroina{
    var vidas = 2
    const mundo = mapaActual
	var property position = game.origin()
    var magia = null

    method perderVida(){
        if(self.noTieneVidas()){
            self.morir()
        } else {
            vidas -= 1
        }
    }

    method noTieneVidas(){
        return vidas == 0
    }
    method magia(_magia){
        magia = _magia
    }

    method morir(){
        game.say(self, "Ya no puedo seguir... ohhhh")
        game.schedule(2000, { game.stop()})
    }
			
	method lanzarMagia() {
		
	}
	
	method image() = "heroina.png"

	method text() { //RGBA (opcional)
		return "Vidas: " + vidas
	}

	method textColor() {
		return "FF0000FF" //RGBA (opcional)
	}
	
	method usarDireccion(direccion){
        const siguiente = direccion.siguientePosicion(position)
        if(not mundo.hayObstaculo(siguiente)){
            position = siguiente
        }
	}
}



object magia{

    method crearProyectil(direccion){

    }
}

