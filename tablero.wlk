import heroina.*

object mapaActual{
    const obstaculos = #{}
    
    method agregarObstaculo(obstaculo){
        obstaculos.add(obstaculo)
    }

    method puedePisarse(posicion){
        return not self.hayObstaculo(posicion)
    }

    method hayObstaculo(posicion){
        return obstaculos.any({ obstaculo => obstaculo.position() == posicion})
    }

}
object nivel{
    const mapa = [[p,p,p,p,p],
                  [p,e,p,v,e],
                  [p,h,v,v,p],
                  [p,p,p,p,p]].reverse()
                  
                  /*
                  [[p,p,p,p,p],
                  [p,e,p,v,p],
                  [p,h,v,v,p],
                  [p,p,p,p,p]]
                  */

    method dibujar(){

        (0..game.width()-1).forEach({ x => 
            (0..game.height()-1).forEach({ 
               y => 
               const elementoActual = mapa.get(y).get(x)
               elementoActual.dibujar(game.at(x,y))
            })
         })
    }

}

class Pared{
    const position
    const property image = "brick_3.png"
    
    method position() = position

    method dibujarse(){
        game.addVisual(self)
    }
}

class Enemigo{
    const position
    const property image = "muerto_vivo.png"
    
    method position() = position

    method dibujarse(){
        game.addVisual(self)
    }

    method impactar(personaje){
        personaje.perderVida()
    }
}

object p{ //Fabrica de Paredes
    const mundo = mapaActual
    //const property image = "brick_3.png"
    
    method dibujar(posicion){
        const pared = new Pared(position = posicion)
        
        mundo.agregarObstaculo(pared)    
        pared.dibujarse()
    }
}

object v{ //Vacio!
    method dibujar(posicionQueNoVaAutilizarEnSuVida){
       //No hace nada!
    }
}

object h{ //Heroina

    method dibujar(posicion){
        heroina.position(posicion)
        game.removeVisual(self)
        game.addVisual(heroina)
    }
}

object e{ //Enemigo
      
    method dibujar(posicion){
        const enemigo = new Enemigo(position = posicion)
        enemigo.dibujarse()
    }
}