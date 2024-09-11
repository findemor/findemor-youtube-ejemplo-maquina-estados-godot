# Ejemplo de máquina de estados

Este repositorio contiene varios ejemplos de implementación de máquina de estados finitos en Godot.
La explicación completa la puedes encontrar en el video tutorial del enlace: https://youtu.be/bX-C6C03Jnc

## Explicación del contenido

La escena principal está en level\\test_level.tscn  

### Escena Player

El personaje (escena player\\player.tscn) se controla mediante un componente llamado PlayerControl.  
En este proyecto encontrarás 3 implementaciones diferentes de ese componente:

### Implementación 1: Código spaghetti

Lo encontrarás en la carpeta player_control\\spaghetti

Este es solo un ejemplo de control basico, y el codigo enrevesado de flags que podría ocurrir si no usas ningún patrón de programación (ej. sin máquina de estados).
En el video lo puedes encontrar explicado a partir del minuto 2:51

Para usarlo, simplemente reemplaza el componente PlayerControl de la escena del Player, por este: player_control\\spaghetti\\player_control.tscn

### Implementación 2: Máquina de estados simple

Lo encontrarás en la carpeta player_control\\fsm\\simple  

Este es un ejemplo de máquina de estados finitos muy básica, en un unico fichero.
En el video lo puedes encontrar explicado a partir del minuto 7:31

Para usarlo, simplemente reemplaza el componente PlayerControl de la escena del Player, por este: player_control\\fsm\\simple\\player_control.tscn

### Implementacion 3: Máquina de estados avanzada

Lo encontrarás en la carpeta player_control\\fsm\\avanzado

Este es un ejemplo de máquina de estados finitos más avanzada.  
Tiene tanto el código del componente reutilizable, que puedes usar como máquina de estados para cualquier cosa (player_control\\fsm\\avanzado\\state_machine.tscn) como la implementacion de algunos estados concretos para controlar al player (player_control\\fsm\\avanzado\\player_states)

Utiliza herencia como ejemplo sencillo de máquina de estados jerarquica, separando en distintas clases los elementos comunes.
En el video lo puedes encontrar explicado a partir del minuto 11:49

Es el componente PlayerControl que encontrarás preparado al ejecutar el proyecto. Verás que se trata de la máquina de estados generica reutilizable, y dentro (como nodos hijos) se colocan los estados especificos que quieras crear.

## Posibles mejoras

* **Feeling del movimiento del personaje**: Este tutorial es para explicar las maquinas de estado. Controlar al personaje es solo una forma de poner el ejemplo. No pretende ser un ejemplo de movimiento de juego plataformero, por eso no deberias tomarte muy en serio como se controla el personaje (faltan muchas cosas por hacerle).
* **Input**: Para no liar más la explicación del cómo detectar los eventos del teclado, en el vídeo simplemente arrastro el código desde physics_process a la funcion _input, pero no uso el parametro event de esta funcion para identificar el evento y decidir, que seguramente sería mejor idea. Está al hilo del punto anterior.
* **Organización de carpetas**: La organización de carpetas y escenas de este proyecto esta orientada reunir en la misma carpeta las explicaciones segun el orden en que se han visto en el video. No es la mejor organización para un proyecto real. Por ejemplo, recomendaría poner los estados especificos del personaje, dentro de la carpeta Personaje junto con el resto de su código.
* **Herencia**: En el video no me quise enredar en temas de herencia más allá de lo que me parecia imprescindible. Por ejemplo seria posible mover la llamada de handle_gravity a la clase padre (player_state_gravity_base), para que se ejecute ahí y no repetir la llamada en todas las clases hijas. Ese tipo de cosas.


## Atribuciones

El personaje de este proyecto es diferente (es una versión simplificada) del que se muestra en el video.
El sprite que se usa en este proyecto es obra de Kenney, y lo puedes encontrar en su web: https://www.kenney.nl/

## Licencia

Puedes usar este código para lo que te de la gana sin necesidad de atribución de ningún tipo.