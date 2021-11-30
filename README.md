# Makefile

## Tecnologías necesarias
`Java` `Maven`

## Targets
* Muestra ayuda `> make help`
* Descarga e instala dependencias: `> make deps`
* Ejecuta los tests: `> make test`
* Paquetiza la aplicación: `> make build`
* Mueve el binario al path correspondiente para poder ejecutarlo: `> make install`
* Ejecuta la aplicación: `> make & make deploy`
* Para la aplicación: `> make stop`

## Datos a tener en cuenta sobre Makefile
* Makefile es un comando que salió con el propósito de compilar aplicaciones en C entre otras cosas. En este caso se va a usar para abstraer, encapsular, y centralizar los comandos y tareas que se van a ejecutar en el código.
* El goal por defecto será el primero definido. Se puede alterar este funcionamiento añadiendo la variable `.DEFAULT_GOAL :=${NOMBRE_GOAL}` (Para lanzar el goal por defecto se tiene ejecutar `make`).
* Añadir una `@` antes de lanzar un comando hace que no se muestre esa sentencia en la salida por consola.
* Cuando hay ambigüedad entre el nombre de un target y de un directorio hay que añadir lo siguiente `.PHONY: ${TARGET}` (Por convenio, se debe de añadir antes de definir el target).
* Un goal puede usar a otros goals `test: deps` (Al ejecutar `> make test` se ejecuta `> make deps`).
