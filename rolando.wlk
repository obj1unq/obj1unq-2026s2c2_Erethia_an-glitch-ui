object rolando {
    const mochila = #{}
    var capacidadMochila = 2
    var vivienda = castillo
    const historial = []


    method capacidadMochila(_nuevaCap){
        capacidadMochila = _nuevaCap
    }

    //method capacidadMochila() = capacidadMochila

    method mochila() = mochila

    method recolectar(elemento) {
        historial.add(elemento)
        self.validarIngreso()
        mochila.add(elemento)
    }

    method validarIngreso(){
        if(capacidadMochila <= mochila.size()){
            self.error("Se supera el límite de la mochila..")
        }
    } 

    method vivienda(_vivienda) {
        vivienda = _vivienda
    }

    method llegarALaVivienda() {
        mochila.forEach({e => vivienda.ingresar(e)})
        mochila.clear()
    }

    method posesiones() = mochila.union(vivienda.inventario())

    method posesionDe(objeto) = mochila.find(objeto)

    method historial() = historial
}


// =========== OBJETOS ===========
object espadaDelDestino {
    
}

object libroDeHechizos {
    
}

object collarDivino {
    
}

object armaduraDeAceroValyrio {
    
}

// =========== LUGAR ============
object castillo {
    const inventario = #{}


    method inventario() = inventario

    method ingresar(elemento) {
        inventario.add(elemento)
    }
}



