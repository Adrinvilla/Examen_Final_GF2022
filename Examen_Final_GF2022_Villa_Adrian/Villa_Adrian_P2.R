

###########################
###### PROBLEMA 2 ########
##########################

# Adrian Villa


## Elabora un programa que a partir de un objeto de tipo phyloseq generado de un analisis  de 
# identificación taxonomica  a partir del gen 16S ribosomal elabora un programa que:

## Librerias que podria usar para este ejercicio. 

library (phyloseq)

library (Biostrings)
library (ggplot2)

library("biomformat")
library (microbiome)

## Son tantas librerias porque este ejercicio particular me costo mucho, entonces conforme fui encontrando informacion o guias, las fui agregando


## (a) Calcule distintas medidas de diversidad.

help ("soilrep")
data ("soilrep") ## Uso de base de datos, por "Jizhong Zhou, et al.". 

help ("estimate_richness")
phyloseq::estimate_richness (soilrep) ## Estimado de la diversidad alfa de la base de datos

plot_richness (soilrep, measures = c ("Observed", "Chao1", "ACE", "Shannon", "Simpson", "InvSimpson", "Fisher"))
## Plot de los valores de distintos indices de diversidad, uno por columna


## (b) Elabore una grafica de barras de abundancias por muestras.

phyloseq::plot_bar (soilrep) ## Correr esta linea costo mucho a mi PC, pero en ella se muestran todas las abundancias de los distintos
# muestras usadas en el estudio
## Me colapsó la sesion de R 2 veces, no pude ver a profundidad los ejes o analizar mas a profundidad la grafica 


## (c) Elabore un analisis de reduccion de dimensionalidad.

help ("ordinate")
phyloseq::ordinate (soilrep, method = "DCA")
## Metodo "DCA" porque es default y hace un analisis de correspondencia 


## (d) Muestre el microbioma core de las muestras.

core_abundance <- sample_sums (core(soilrep, detection = .01, prevalence = .95))
core_abundance
## Filtrado de las taxa prevalentes

## (Opcional) Genere redes de co-abundacia por muestra.
