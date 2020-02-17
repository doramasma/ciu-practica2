# Ciu práctica 2
Making Solid of revolution

## Autor 
**Doramas Báez Bernal** <br/>
Correo: doramas.baez101@alu.ulpgc.es

## Gif
<div align="center">
  <img src="/main/animacion.gif" alt="gif de la practica 2">
  <p align="center">
    Figura 1: Ejemplo de ejecucion
  </p>
</div>

## Índice
* [Introducción](#introducción)
* [Dependencias](#dependencias) 
* [Desarrollo](#desarrollo)
    * [Información general](#informaciónGeneral)
    * [capturar puntos](#capturar)
    * [Conversion 3D](#conversion)
    * [Rotación](#rotación)
* [Referencias](#referencias)

## Introducción
El objetivo de esta práctica es diseñar figuras 3D a partir de una serie de puntos en dos dimensiones. Estos puntos, se corresponden con el perfil de la figura que vamos a crear, sobre el cual realizaremos las transformaciones necesarias para llegar a la figura 3D. Para ello se ha utilizado generación de mallas en triángulos, mediante un algoritmo de rotación de los puntos iniciales.

## Dependencias
Para el desarrollo de la práctica se ha utilizado la siguiente librería:
* La librería **GifAnimation** que se utilizó para la obtención del gif. Sin embargo, ya que no es necesario para el funcionamiento de la aplicación en este caso todo el código relacionado se encuentra comentado. No obstante, por si fuera necesario, en el siguiente [enlace](https://github.com/extrapixel/gif-animation) se encuentra la guía de instalación.

## Desarrollo

### Información general <a id="informaciónGeneral"></a>

Cuando iniciamos la aplicación, aparecerá la vista principal, en la que se nos explicarán los controles. En este caso, estamos tratando con la vista de 2 dimensiones.
- Convertir a objeto 3D: R
- Nueva figura: E
- Añadir puntos: click izquierdo 

Si realizamos una figura y pulsamos el botón R, entonces accederemos a la siguiente vista (3D). Nuevamente, aparecerán nuevas indicaciones para saber como utilizar la aplicacion.
- Convertir a forma 2D: T
- Nueva figura: E
- Rotar izquierda: click izquierdo
- Rotar derecha: click derecho


### Capturar puntos <a id="capturar"></a>
Se ha creado una clase auxiliar, que nos permitirá crear instancias de puntos. Estos objetos, disponen de unos getter para obtener la coordenada x e y de dicho punto. Por lo tanto, crearemos un ArrayList<puntos> que nos servirá para el almacenamiento de dichos puntos. Para capturar los puntos, nos apoyaremos en la funcion mousePressed(), mientras el ratón esté presionado, estaremos obteniendo las coordenadas x e y del mouse y las guardaremos en nuestro ArrayList.

### Conversion 3D <a id="conversion"></a>
Básicamente, para realizar la transformación de los puntos a una figura en 3D. Aplicaremos las formulas de rotación que aparecen en los apuntes:

*x2 = x1 · cosθ − z1 ·senθ* <br/>
*y2 = y1* <br/>
*z2 = x1 ·senθ + z1 · cosθ* <br/>

Donde el ángulo, serán sucesivas interaciones de PI/4 en PI/4 hasta alcanzar 2PI

### Rotación
Cuando hablamos de rotaciones, estamos hablando de rotar la figura sobre su propio eje. En este caso, he optado por dar la posibilidad de realizar una rotacion sobre el eje y de la figura. Lo que provocará, que veamos al objeto girar hacia la derecha o izquierda sobre su propio eje. Para ello, he habilitado el click derecho e izquierdo del ratón.


## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [GifAnimation](https://github.com/extrapixel/gif-animation)
* [Flaticon](https://www.flaticon.com/free-icon/mouse-left-button_32041?term=mouse%20left&page=1&position=32)
* [Adobe xd](https://www.adobe.com/es/products/xd.html)
