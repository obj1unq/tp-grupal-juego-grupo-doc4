class Dibujable{
    method nombre() //Método Abstracto!

    method image(){
        return self.nombre() + ".png"
    }

}

object manzana inherits Dibujable{
    method cuantoQuere(){
        return 1000000
    }

    override method nombre(){
        return "manzana"
    }

}

object papa inherits Dibujable{
    method cuantoQuere(){
        return 10
   }
    
    override method nombre(){
        return "papa"
    }
}



class Ave{
    var comida = manzana
    var energia = 100
    
    method volar(){
        energia -= self.reduccion()
    }

    method comer(){
        energia += comida.cuantoQuere()
    }

    method reduccion() = 100


}

class AveFuertes inherits Ave{


    override method reduccion() = 10


}