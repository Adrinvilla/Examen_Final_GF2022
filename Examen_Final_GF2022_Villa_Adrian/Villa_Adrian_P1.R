

###########################
###### PROBLEMA 1 ########
##########################

# Adrian Villa


## Las redes de interaccion proteina-proteina del paper Evolution of resilience in protein interactomes across the tree of life. Marinka Zitnik, 
# Rok Sosic, Marcus W Feldman, and Jure Leskovec. Proceedings of the National Academy of
# Sciences (PNAS), 2019, 116 (10) 4426-4433  Se encuentran en el archivo treeoflife.interactomes.networks.zip en formato de lista de adyacencia.

## Cada archivo tiene como nombre un identificador numerico que se puede consultar en el
# archivo treeoflife.species.tsv para identificar a la especie correspondiente. Selecciona tres
# redes pequenas, alrededor de 200 proteinas, y elabora un programa en R que:

library (igraph) ## Libreria a usar 

## (a) Lea las redes en R y determine la distribucion de conectividades.

red_1 <- read.table("Data/882.txt", header = TRUE) ## Cargar base de datos
head(red_1) ## Ver solo los primeros 

red_1 <- graph_from_data_frame (red_1) ## Crear red
red_1 ## Imprimir

red_2 <- read.table("Data/883.txt", header = TRUE) ## Cargar base de datos
head(red_2) ## Ver solo los primeros 

red_2 <- graph_from_data_frame (red_2) ## Crear red
red_2 ## Imprimir

red_3 <- read.table("Data/394.txt", header = TRUE) ## Cargar base de datos
head(red_3) ## Ver solo los primeros 

red_3 <- graph_from_data_frame (red_3) ## Crear red
red_3 ## Imprimir

Dist_conectividades_1 <- degree_distribution (red_1) ## Calcular la distribucion de conectividades
plot (Dist_conectividades_1, main = "Distribución de conectividades", xlab = "Conexiones", ylab = "Frecuencia") ## Plotea la distribucion de conectividades

Dist_conectividades_2 <- degree_distribution (red_2) ## Calcular la distribucion de conectividades
plot (Dist_conectividades_2, main = "Distribución de conectividades", xlab = "Conexiones", ylab = "Frecuencia") ## Plotea la distribucion de conectividades

Dist_conectividades_3 <- degree_distribution (red_3) ## Calcular la distribucion de conectividades
plot (Dist_conectividades_3, main = "Distribución de conectividades", xlab = "Conexiones", ylab = "Frecuencia") ## Plotea la distribucion de conectividades


## (b) Calcule el promedio de conectividades de cada red.

Promedio_1 <- mean (degree (red_1)) ## Promedio de conectividades
Promedio_1 ## 14.6999

Promedio_2 <- mean (degree (red_2)) ## Promedio de conectividades
Promedio_2 ## 17.63412

Promedio_3 <- mean (degree (red_3)) ## Promedio de conectividades
Promedio_3 ## 17.74635


## (c) Calcule la densidad de cada red.

Densidad_1 <- edge_density (red_1) ## Calcular la densidad
Densidad_1 ## 0.007191733

Densidad_2 <- edge_density (red_2) ## Calcular la densidad
Densidad_2 ## 0.0109122

Densidad_3 <- edge_density (red_3) ## Calcular la densidad
Densidad_3 ## 0.008103356


## (d) Escribe una funcion que muestre el numero de componentes de la red cuando se desconectan los 10 nodos mas conectados. 
    # La funcion de igraph components() puede ser  util.

Diez_1 <- degree (red_1) ## Ver Degree
Diez_1 <- delete.vertices (red_1, c(sort (Diez_1, decreasing = TRUE) [1:10])) ## Remover los 10 mas conectados
Diez_1 ## Imprimir
## Son 1019 nodos y 7507 conexiones

Diez_2 <- degree (red_2) ## Ver Degree
Diez_2 <- delete.vertices (red_2, c(sort (Diez_2, decreasing = TRUE) [1:10])) ## Remover los 10 mas conectados
Diez_2 ## Imprimir
## Son 804 nodos y 6951 conexiones

Diez_3 <- degree (red_3) ## Ver Degree
Diez_3 <- delete.vertices (red_3, c(sort (Diez_3, decreasing = TRUE) [1:10])) ## Remover los 10 mas conectados
Diez_3 ## Imprimir
## Son 1088 nodos y 9549 conexiones


## (e) Calcule la robustez de las redes quitando los 10 proteinas mas conectadas.

hist (degree (Diez_1)) ## Genera un histograma de los degree

hist (degree (Diez_2)) ## Genera un histograma de los degree

hist (degree (Diez_3)) ## Genera un histograma de los degree

## Todas las redes son robustas, porque se mantiene la propiedad de cola-larga


## (f) Selecciona las 10 proteinas  mas importantes y determina su funcion usando gene ontology 
      # (debido al tamano de la muestra podria no salirte nada significativo en ese caso pon ese resultado).

head (sort(Degree_1, decreasing = TRUE),10) # Seleccionar las 10 mas importantes

head (sort(Degree_2, decreasing = TRUE),10) # Seleccionar las 10 mas importantes
 
head (sort(Degree_3, decreasing = TRUE),10) # Seleccionar las 10 mas importantes

## La parte del GO no la pude hacer, pero pude seleccionar sola las 10 mas importantes.