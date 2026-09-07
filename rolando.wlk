// ================ PERSONAJES =================
object rolando {
    const mochila = #{}
    var capacidadMochila = 2
    var vivienda = castillo
    const historial = []
    var poderBase = 5
    const enemigos = #{}



    //method poderBase(_poderBase) {
    //    poderBase = _poderBase
    //}

    method poderDeBase() = poderBase

    method capacidadMochila(_nuevaCap){
        capacidadMochila = _nuevaCap
    }

    //method capacidadMochila() = capacidadMochila

    method mochila() = mochila

    method encontrar(elemento) {
        historial.add(elemento)
        //self.validarIngreso()   ahora el  enunciado no pide explícitamente que tire un error en caso de que falle, así que el validador no debería de estar
        if(capacidadMochila <= mochila.size()){
            mochila.add(elemento)
        }
    }

    //method validarIngreso(){
    //    if(capacidadMochila <= mochila.size()){
    //        self.error("Se supera el límite de la mochila..")
    //    }
    //} 

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

    method poderDePelea() = poderBase + (mochila.map({p => p.poderDePelea(self)}).sum())

    method pelearBatalla() {
        //self.poderBase(poderBase+1)
        poderBase += 1
        mochila.forEach({p => p.usar()})
    }

    method artefactoMasPoderoso() = mochila.max({a => a.poderDePelea()})

    method agregarEnemigo(e) {
        enemigos.add(e)
    }

    method losQuePuedeVencer() = enemigos.filter({e => e.poderDePelea() < self.poderDePelea()})

    method moradasConquistables() = self.losQuePuedeVencer().map({e => e.vivienda()})
}

object caterina {
    method poderDePelea() = 28
    method vivienda() = fortalezaDeAcero
}

object archibaldo {
    method poderDePelea() = 16
    method vivienda() = palacioDeMarmol
}

object astra {
    method poderDePelea() = 14
    method vivienda() = torreDeMarfil
}


// =========== OBJETOS ===========
object espadaDelDestino {
    var fueUsado = false


    method poderDePelea(pj) = if (!fueUsado){
        pj.poderDeBase()
    } else{
        pj.poderDeBase()*50/100
    }

    method usar() {
        fueUsado = !fueUsado
    }
}

object libroDeHechizos {
    const hechizos = []


    method poderDePelea(pj) = (hechizos.map({h => h.poderQueBrinda(pj)})).sum()
    // Si el libro de hechizos no tiene ningún hechizo, entonces su aporte es nulo. <----------------------------mirar

    method ingresarHechizo(h) {
        hechizos.add(h)
    }

    method usar() {
        hechizos.remove(hechizos.get(0))
    }
}

object collarDivino {
    var puntosPorUso = 0


    method poderDePelea(pj) = if (pj.poderDeBase() >= 6){
        3
    } else{
        0
    }

    method usar() {
        puntosPorUso += 1
    }
}

object armaduraDeAceroValyrio {
    method poderDePelea(pj) = 6

    method usar() {
        //nada
    }
}

// =========== LUGAR ============
object castillo {
    const inventario = #{}


    method inventario() = inventario

    method ingresar(elemento) {
        inventario.add(elemento)
    }
}

object fortalezaDeAcero {
    
}

object palacioDeMarmol {
    
}

object torreDeMarfil {
    
}

// =============== HECHIZOS ===============
object bendicion {
    method poderQueBrinda(pj) = 4
}

object invisibilidad {
    method poderQueBrinda(pj) = pj.poderDeBase()
}

object invocacion {
    method poderQueBrinda(pj) = pj.artefactoMasPoderoso().poderDePelea()
}

