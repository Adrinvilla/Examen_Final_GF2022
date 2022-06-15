

###########################
###### PROBLEMA 3 ########
##########################

# Adrian Villa


## A partir de la red booleana cargada en BoolNet llamada cellcycle escribe un programa en R que:

library (BoolNet) # Cargar la libreria para este problema


## (a) Encuentre los atractores.

data ("cellcycle") ## Datos a usar de la libreria
cellcycle ## Ver datos

cellatr <- getAttractors (cellcycle) ## Obtener los atractores de la base de datos y ponerlos en el objeto "cellatr"
cellatr ## Ver a los atractores 

plotAttractors (cellatr) ## Se obtienen dos atractores, uno de 1 solo estado
                        # y otro atractor ciclico de 7 estados 


## (b) Discuta el significado de los atractores.

## Discusion de los atractores: podemos observar en el primer atractor de un solo estado, esto
# ya en primera instancia indica nos habla de un estado en el que la red se quedara estatica

## Observando los genes activos podemos asumir que se trata de genes que arrestan el ciclo celular, por ejemplo
# Rb que se trata de un supresor de tumores, por lo que el primer estado puede tratarse de una celula con 
# su ciclo celular detenido, mientras que para el segundo atractor de 7 estados 
# por lo tanto es un atractor ciclico se puede inferir que es una celula en bucle de division celular constante


## (c) Describe  verbalmente al menos un par de reglas, (¡distintas a las que estan en la ayuda-manual!).

help ("cellcycle") ## Ver la ayuda de la base de datos.

# 1.  Rb = (! CycA & ! CycB & ! CycD & ! CycE) | (p27 & ! CycB & ! CycD)

## Por ejemplo, para Rb, que es un supresor tumoral,
# lo que podemos ver de su conjunto de condiciones es que esten inactivas, las ciclinas 

## A,B, C y D, lo cual hace sentido debido a que estas estan relacionadas a la activacion del crecimiento celular, 
# o que p27 se encuentre activo y las ciclinas B y D esten inactivas. 


# 2. E2F = (! Rb & ! CycA & ! CycB) | (p27 & ! Rb & ! CycB)

## Para el caso de E2F esta condicionado a dos situaciones en particular, que pueden suceder de manera independiente 
# La primera es que Rb, el supresor tumoral este inactivo, sumadoa a la inactivacion de la Ciclina A y B,

## Mientras que la segunda condiconante es que p27 este activo, Rb inactivo y la ciclina B tambien 
# E2F es un factor de transcripcion, que permite que la celula entre en fase S para la division celular


## (d) Selecciona distintas condiciones iniciales y determina a que atractor se van.

plotStateGraph (cellatr) ## Plot de todos los estados que puede tener la red, y ver a que atractor pueden llegar


getTransitionTable (cellatr) ## Ver textualmente la transición de cada estado inicial posible y los estados que le toma llegar al
                            # atractor 1 o 2 