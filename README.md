# Erethia

Este ejercicio está diseñado para aprender sobre colecciones. La parte 1 incluye todo lo referido a referencias y tipos de colecciones, y la parte 2 trabaja sobre el envío de mensajes polimórficos a los elementos (mediante el uso de bloques)


## Parte 1 (referencias)

### 1.1 Rolando

En la tierra de Erethia vive Rolando, quien va recolectando distintos artefactos mágicos. Para esta primera versión, existen 4 artefactos:

- Una espada del destino
- Un libro de hechizos 
- Un collar divino
- Una armadura de acero valyrio

En su mochila, Rolando puede llevar hasta 2 artefactos a la vez, pero se espera que a medida que se desarrolle el juego pueda incrementar esa capacidad. Entonces, cada vez que Rolando se encuentra con un artefacto, analiza si tiene capacidad para llevarlo, y en caso de que sea posible, lo recolecta. 

#### Requerimientos

Diseñar los objetos con un comportamiento que permita representar:

- Que Rolando encuentre un artefacto
- Configurar el tamaño de la mochila de Rolando
- Conocer los artefactos que Rolando lleva en su mochila

Desarrollar **tests** siguiendo el ejemplo.

#### Ejemplo:

 1. Rolando tiene la mochila vacía y encuentra la espada del destino (la recolecta)
 2. Rolando encuentra el libro de hechizos (la recolecta) 
 3. Rolando encuentra el collar divino pero no lo recolecta, ya que tiene la espada y el libro encima y la capacidad de su mochila es de 2. 
 4. Si se consultan los artefactos que tiene Rolando se obtienen la espada del destino y el libro de hechizos.
   

### 1.2 Castillo de piedra

El castillo de piedra es donde Rolando vive. Es tan grande que allí no hay límite para almacenar artefactos. Cuando Rolando llega al castillo de piedra, guarda en él todos los artefactos que lleva consigo, liberando espacio para poder recolectar nuevos. 

#### Requerimientos

Incorporar a los objetos el comportamiento que permita:

- Hacer que rolando llegue a su hogar (el castillo)
- Saber qué artefactos hay en el castillo


Desarrollar **tests** siguiendo el ejemplo.

#### Ejemplo:
 1. Rolando encuentra la espada del destino (la recolecta)
 2. Rolando encuentra el libro de hechizos (la recolecta)
 3. Rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 4. Rolando encuentra el collar divino (ahora si lo puede recolectar, ya que liberó espacio)
 3. Rolando llega al castillo de piedra nuevamente (deja el collar, con lo cual ahora el castillo tiene el collar, la espada y el libro)
 

### 1.3 Saber qué artefactos tiene Rolando

Hay dos preguntas interesantes que debe poder contestar Rolando, por un lado cuáles son los artefactos que tiene en la mochila (ya resuelto en el punto inicial), pero también debe saber cuáles son todos los artefactos que él posee (sus posesiones) sin importar si los tiene en la mochila o en su castillo.
 
También se quiere preguntar si posee un artefacto en particular.

#### Requerimientos

Incorporar a los objetos el comportamiento que permita:

- Saber las posesiones de Rolando
- Saber si Rolando posee un artefacto en particular


Desarrollar **tests** siguiendo el ejemplo.

#### Ejemplo: 

Suponiendo que en el castillo están el collar y la espada, y que Rolando tiene la armadura. Entonces las posesiones de Rolando son 3: el collar, la espada y la armadura. El libro no está entre sus posesiones.
 
### 1.4 Saber la historia de los encuentros con los artefactos.
 
 Se desea saber el orden en que Rolando fue encontrando los artefactos, independientemente de si los recolectó o no.

### Requerimiento

1. Incorporar a los objetos el comportamiento que permita saber la historia de los encuentros.
2. Desarrollar **tests** siguiendo el ejemplo.
 
#### Ejemplo:
 
 1. Rolando encuentra la espada del destino (la recolecta)
 2. Rolando encuentra el libro de hechizos (la recolecta)
 3. Rolando encuentra el collar divino (no lo recolecta, ya que tiene la espada y el libro encima y su capacidad es de 2)
 4. Rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 5. Rolando encuentra la armadura de acero valyrio (la recolecta)
 6. Rolando encuentra el collar divino (ahora si lo puede recolectar, ya que liberó espacio)
 
Si consultamos la historia de encuentro con los artefactos debería ser:

 1. espada del destino 
 2. libro de hechizos
 3. collar divino
 4. armadura de acero valyrio
 5. collar divino (¡nuevamente!)

 
## Parte 2 (mensajes con bloques) 

### 2.1 Comportamiento de los artefactos

Los artefactos son elementos que aportan al personaje cierto poder que puede usar en una batalla. Pero cuidado que cada vez que se combate en una batalla se sufren efectos. El poder de pelea de Rolando, dependerá de un valor base (inicialmente configurable) y de sus artefactos. **Tener en cuenta** al momento de programar los artefactos que éstos podrían ser usados por otros personajes que aún se han introducpresentado.

Poder de pelea de cada artefacto
  
- Espada del destino: La primera vez que se utiliza aporta la misma cantidad que el poder base del personaje, luego sólo el 50%. 
- Collar divino: aporta 3 puntos, pero si el personaje tiene un poder base mayor a 6, le suma también un punto por cada batalla en la que se haya usado el collar.
- Armadura de acero valyrio: Aporta 6 de poder de pelea siempre, el acero valyrio no se gasta con las batallas.

_Nota_ La regla del libro de hechizos se define más adelante.

El poder de pelea de Rolando es el resultado de sumar su poder base (que inicialmente es 5) a la sumatoria de los poderes de pelea que le aportan los artefactos que tiene en su mochila. Cuando ocurre una batalla, se utilizan todos los artefactos que rolando lleva consigo, y además se incrementa en 1 el número base del poder de pelea de rolando. 

#### Requerimientos

- Configurar el poder base de Rolando
- Conocer el poder de pelea de Rolando
- Hacer que Rolando luche una batalla   
- Desarrollar **tests** siguiendo el ejemplo.

#### Ejemplo de poder de pelea: 

- Si Rolando tiene 5 de base y capacidad de 3 artefactos. Entre sus artefactos se encuentran la *espada* (aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3). Entonces el poder de pelea de Rolando es 5 + 5 + 6 + 3 = 19

 
#### Ejemplo de batalla: 

- Hacer que Rolando tenga 5 de base y capacidad de 3 artefactos. Entre sus artefactos se encuentran la *espada* (que le aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3).
- Luego de la primer batalla Rolando tiene 6 de base, la espada (aporta 6/2 = 3), la armadura (aporta 6) y el collar (aporta 3)  
- Luego de la segunda batalla Rolando tiene 7 de base, la espada (aporta 7/2 = 3.5), la armadura 6 y el collar (3+2=5)
- Luego de la tercera batalla Rolando tiene 8 de base, la espada (aporta 8/2=4), la armadura 6 y el collar (3+3=6)


### 2.2 Libro de hechizos

El libro de hechizos contiene varios hechizos, que se utilizan en un determinado orden y de a uno a la vez. Luego de utilizar un hechizo, éste se descarta. Existen estos 3 hechizos (pero podría haber más):

- Bendición: aporta 4 unidades de poder de pelea
- Invisibilidad: el poder que aporta es el poder de pelea **base** del personaje
- Invocación: aporta el valor del artefacto más poderoso para el héroe que posee en su morada (y el artefacto del castillo no sufre ningún efecto por la batalla)

Si el libro de hechizos no tiene ningún hechizo, entonces su aporte es nulo.

#### Requerimiento

- Programar el libro de hechizo para que sea polimórfico con el resto de los artefactos
- Desarrollar **tests** siguiendo el ejemplo.

#### Ejemplo

Suponer que Rolando (con 5 de poder de pelea) solo tiene consigo el libro de hechizos, mientras que en su castillo tiene 
la espada, la armadura y el collar (todo sin haber sido usado antes). Además, suponer que el libro de hechizos contiene estos tres hechizos en este orden: bendición, invisibilidad e invocación.

- Antes de la primera batalla, el libro de hechizos aporta 4 de la bendición.
- Luego de la primera batalla el libro de hechizos aporta 6 por la invisibilidad.
- Luego de la segunda batalla, el libro aporta 7, ya que la invocación otorga los 7 puntos de la espada.
- Luego de la tercera batalla, ya no quedan más hechizos, por lo que el aporte del libro es 0


### 2.3 Enemigos

En la tierra de Erethia existen 3 poderosos enemigos y de cada uno interesa saber su poder de pelea y su morada.

- Caterina tiene 28 de poder de pelea y vive en la fortaleza de acero
- Archibaldo tiene 16 de poder de pelea y vive en el palacio de mármol. 
- Astra tiene 14 de poder pelea y vive en la torre de marfil

Los enemigos en Erethia que Rolando puede vencer son aquellos que tienen un poder de batalla menor al suyo. A su vez, las moradas que Rolando podría conquistar son las moradas de los enemigos a los cuales puede vencer.

#### Requerimientos
- Saber cuales son los enemigos que Rolando **puede vencer**
- Conocer las moradas **conquistables** por Rolando
- Desarrollar **tests** siguiendo el ejemplo.


#### Ejemplo
 
Suponiendo que Rolando tiene 5 de base y capacidad de 3 artefactos. Entre sus artefactos se encuentran la *espada* (que le aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3). Su poder de batalla es 19, por lo tanto, puede vencer a Archibaldo y a Astra. 
Las moradas conquistables son el palacio de mármol y la torre de marfil.

### 2.4 Poderoso

Se considera que Rolando es poderoso en la tierra de Erethia si está en condiciones de vencer a todos los enemigos.

#### Requerimiento

- Poder determinar si Rolando es poderoso
- Desarrollar **tests** siguiendo el ejemplo.

#### Ejemplo

En el caso de ejemplo anterio Rolando no es poderoso, pero si su poder de base se establece en 10, entonces sí lo es.

### 2.5 Artefacto fatal

Un artefacto fatal es aquel que le da a Rolando un poder de pelea superior al poder de batalla de su enemigo. Es decir, un artefacto no es fatal por sí solo, sino que se calcula para un enemigo en particular.

#### Requerimiento

- Saber si Rolando posee consigo un artefacto fatal para derrotar un enemigo
- Obtener de entre los artefactos que lleva consigo rolando, un artefacto fatal para derrotar a un enemigo

#### Ejemplo

Si Rolando tiene de base 15, la espada, la armadura y el collar, entonces cuenta con un artefacto fatal, que es la espada, para derrotar a Astra. Sin embargo, no cuenta con ningún artefacto fatal para derrotar a Caterina.


### 2.6 Reflexionar sobre los conceptos

* Elegir un polimorfismo e indicar: 

   - ¿Qué nombre le pondrías al tipo de los objetos polimórficos?
   - ¿Qué mensajes componen ese tipo?
   - ¿Quiénes usan los mensajes polimórficos?
   
* Respecto de las colecciones definidas:

    - ¿Qué **tipo** de elementos contienen?
    - ¿Qué mensaje polimórfico (perteneciente al tipo mencionado) utilizaste dentro de un bloque?