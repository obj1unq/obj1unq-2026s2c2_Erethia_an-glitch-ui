// =============== ERETHIA ==================
object erethia {
    const enemigos = #{caterina, archibaldo, astra}

    method enemigos() = enemigos

    method esElPJPoderoso(pj) = self.enemigosQuePuedeVencer(pj).size() == enemigos.size()

    method enemigosQuePuedeVencer(pj) = enemigos.filter({e => pj.puedeVencerA(e)})

    method agregarEnemigo(e) {
        enemigos.add(e)
    }
}

// ================ PERSONAJES =================
object rolando {
    const mochila = #{}
    var capacidadMochila = 2
    var vivienda = castillo
    const historial = []
    var poderBase = 5
    const viveEn = erethia
    //const enemigos = {}



    method poderBase(_poderBase) {
        poderBase = _poderBase
    }

    method poderDeBase() = poderBase

    method capacidadMochila(_nuevaCap){
        capacidadMochila = _nuevaCap
    }

    //method capacidadMochila() = capacidadMochila

    method mochila() = mochila

    method encontrar(elemento) {
        historial.add(elemento)
        //self.validarIngreso()   ahora el  enunciado no pide explícitamente que tire un error en caso de que falle, así que el validador no debería de estar
        if(capacidadMochila > mochila.size()){
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

    //method poderDePelea() = poderBase + (mochila.map({p => p.poderDePelea(self)})).sum()
    method poderDePelea() = poderBase + mochila.sum({p => p.poderDePelea(self)})

    method pelearBatalla() {
        //self.poderBase(poderBase+1)
        poderBase += 1
        mochila.forEach({p => p.usar()})
    }

    method artefactoMasPoderoso() = mochila.max({a => a.poderDePelea(self)})    // sirve para el 2.5, el artefacto fatal

    method artefactoMasPodersoDelCastilloSinEfectos() = vivienda.inventario().max({a => a.poderSinEfectoBatalla(self)})

    method losQuePuedeVencer() = viveEn.enemigosQuePuedeVencer(self)

    method moradasConquistables() = self.losQuePuedeVencer().map({e => e.vivienda()})

    //method esPoderoso() = erethia.enemigos().size() == self.losQuePuedeVencer().size()
    method esPoderoso() = viveEn.esElPJPoderoso(self)

    method puedeVencerA(e) = self.poderDePelea() > e.poderDePelea()

    method artefactoFatalPara(enemigo) = self.artefactoMasPoderoso().poderDePelea(self) > enemigo.poderDePelea()
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
        pj.poderDeBase() / 2
    }

    method poderSinEfectoBatalla(pj) = pj.poderDeBase()

    method usar() {
        //fueUsado = !fueUsado
        if(!fueUsado){
            fueUsado = !fueUsado
        }
    }
}

object libroDeHechizos {
    const hechizos = []

    method poderDePelea(pj) = if (hechizos.isEmpty()) 0 else hechizos.get(0).poderQueBrinda(pj)

    method ingresarHechizo(h) {
        hechizos.add(h)
    }

    method usar() {
        if (!hechizos.isEmpty()) {
            hechizos.remove(hechizos.get(0))
        }
    }
}

object collarDivino {
    var puntosPorUso = 0


    method poderDePelea(pj) = if (!(pj.poderDeBase() >= 6)){
        3
    } else{
        3 + puntosPorUso
    }

    method poderSinEfectoBatalla(pj) = if (!(pj.poderDeBase() >= 6)){
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

    method poderSinEfectoBatalla(pj) = 6

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
    method poderQueBrinda(pj) = pj.artefactoMasPodersoDelCastilloSinEfectos().poderSinEfectoBatalla(pj)
}

/* 
Apartado de reflexión   -   2.6 Reflexionar sobre los conceptos

Elegir un polimorfismo e indicar: 
- ¿Qué nombre le pondrías al tipo de los objetos polimórficos?
    el nombre del objeto polimórfico sería 'hechizos'
- ¿Qué mensajes componen ese tipo?
    los mensajes que debería tener ese tipo es, en este caso, un mensaje de consulta 'poderQueBrinda(personaje)' para devolver un valor en base a X pj que se le pase como parámetro
- ¿Quiénes usan los mensajes polimórficos?
    quienes usan el mensaje 'poderQueBrinda(pj)' es el objeto 'libroDeHechizos'

Respecto de las colecciones definidas:
- ¿Qué tipo de elementos contienen?
    *conjuntos: el objeto 'rolando' usa un set como mochila, para guardar los diferentes artefactos ('espadaDelDestino', 'armaduraDeAceroValyrio', etc.)
    *listas: el objeto 'rolando' usa una lista para tener un registro de aquellos artefactos que se haya encontrado (y los haya levantado o no) manteniendo el orden de c/u
    *        el objeto 'libroDeHechizos' ocupa una lista para guardar los hechizos que puede tener, siguiendo un orden específico para poder usarlos/eliminarlos ordenadamente
-¿Qué mensaje polimórfico (perteneciente al tipo mencionado) utilizaste dentro de un bloque?
    el mensaje polimórfico que se usó dentro del bloque fue el de obtener el valor númerico que brinda el hechizo en la primera posición de la lista de hechizos (?

*/