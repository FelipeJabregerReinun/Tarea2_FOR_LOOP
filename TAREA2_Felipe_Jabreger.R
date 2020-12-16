# 1) Una vez cargada las bases de datos se procedera a incorporar a cada una de las
# bases la variable "tamaño" de las empresas de sus respectivos países. 

library(tidyverse)
library(tidyr)


# Agregar la Variable "tamanio" a cada base

gran_chile = grandes_chile %>% mutate(tamanio = "grande")
gran_colombia = grandes_colombia %>% mutate(tamanio = "grande")
gran_peru = grandes_peru %>% mutate(tamanio = "grande")

media_chile = medianas_chile %>% mutate(tamanio = "mediana")
media_colombia = medianas_colombia %>% mutate(tamanio = "mediana")
media_peru = medianas_peru %>% mutate(tamanio = "mediana")

microe_chile = micro_chile %>% mutate(tamanio = "micro")
microe_colombia = micro_colombia %>% mutate(tamanio = "micro")
microe_peru = micro_peru %>% mutate(tamanio = "micro")

peque_chile = pequena_chile %>% mutate(tamanio = "pequena")
peque_colombia = pequena_colombia %>% mutate(tamanio = "pequena")
peque_peru = pequena_peru %>% mutate(tamanio = "pequena")


# 2) Unir todas las bases en una sola, para lo cual primero
# renombraremos todas las variables de todas las bases de datos

names(gran_chile) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(gran_colombia) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(gran_peru) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(media_chile) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(media_colombia) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(media_peru) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(microe_chile) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(microe_colombia) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(microe_peru) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(peque_chile) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(peque_colombia) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")
names(peque_peru) = c("fecha", "pais", "ingresos", "costos", "porcentaje_mujeres", "exportaciones", "importaciones", "endeudamiento", "morosidad", "reservas", "spread", "tasa_interes", "tamanio")

# Unir las bases de datos en una sola y definir la tipologia de los datos

gran_chi_co = rbind(gran_chile, gran_colombia)
gran_chi_co_pe = rbind(gran_chi_co, gran_peru)

media_chi_co = rbind(media_chile, media_colombia)
media_chi_co_pe = rbind(media_chi_co, media_peru)

microe_chi_co =rbind(microe_chile, microe_colombia)
microe_chi_co_pe = rbind(microe_chi_co, microe_peru)

peque_chi_co = rbind(peque_chile, peque_colombia)
peque_chi_co_pe =rbind(peque_chi_co, peque_peru)

gran_media_chi_co_pe = rbind(gran_chi_co_pe, media_chi_co_pe)

microe_peque_chi_co_pe = rbind(microe_chi_co_pe, peque_chi_co_pe)

basefinal = rbind(gran_media_chi_co_pe, microe_peque_chi_co_pe)

# identificar la tipologia 

str(basefinal)

# fecha               : caracter 
# pais                : caracter
# ingresos            : numerico
# costos              : numerico
# procentaje_mujeres  : numerico
# exportaciones       : numerico
# importaciones       : numerico
# endeudamiento       : numerico
# morosidad           : numerico
# reservas            : numerico
# spread              : numerico
# tasa_interes        : numerico
# tamanio             : caracter

# 3) Determine a través del uso de condicionales y/o for cuántas obervaciones tiene Peru versus Chile.(2 pto)

observaciones = "chile_peru"

if(observaciones == "chile_peru"){
  peru = nrow(basefinal %>% filter(pais == "peru"))
  gran_peru = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "grande"))
  media_peru = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "mediana"))
  microe_peru = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "micro"))
  peque_peru = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "pequeña"))
  chile = nrow(basefinal %>% filter(pais == "peru"))
  gran_chile = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "grande"))
  media_chile = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "mediana"))
  microe_chile = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "micro"))
  peque_chile = nrow(basefinal %>% filter(pais == "peru") %>% filter(tamanio == "pequeña"))
  
print(paste("El total de empresas peruanas son", peru, "conformadas por",
            gran_peru, "grandes", media_peru, "medianas", microe_peru, "micro y",
            peque_peru, "pequenas empresas.", "Por su parte, las empresas chilenas se conforman por empresas",
            gran_chile, "grandes", media_chile, "medianas", microe_chile, "micro y",
            peque_chile, "pequenas"))
}

# 4) Determine a través del uso de condicionales y/o for ¿cuál es el país con mayor
# ingresos de explotación para los años que considera la muestra.

ingresos = c(basefinal$ingresos)

input = "ingreso"

if(input == "ingreso"){
  peru = basefinal %>% filter (pais == "peru")
  chile = basefinal %>% filter (pais == "chile")
  colombia = basefinal %>% (pais == "colombia")
  
  ingre_peru = c(peru$ingresos)
  ingre_chile = c(chile$ingreso)
  ingre_colombia = c(colombia$ingresos)
  
  ing_peru = sum(ingre_peru)
  ing_chile = suma(ingre_chile)
  ing_colombia = suma(ingre_colombia)
  
  pro_peru = mean(ingre_peru)
  pro_chile = mean(ingre_chile)
  pro_colombia = mean(ingre_colombia)
  
  if(ing_colombia > ing_chile && ing_colombia > ing_peru){
    print(paste("El país con mayores ingresos en el periodo es Colombia, con" 
                ing_colombia, "unidades monetarias"))
  } else if (ing_peru > ing_chile && ing_peru > ing_colombia){
    print(paste("El país con mayores ingresos en el periodo es Peru, con" 
                ing_peru, "unidades monetarias"))
  } else if (ing_chile > ing_peru && ing_chile > ing_colombia){
    print(paste("El país con mayores ingresos en el periodo es Chile, con" 
                ing_chile, "unidades monetarias"))
  }
}


# 5) Genere una variable(columna) , donde si el país es Chile multiplique la tasa de interes
# por 0,1, cuando sea Peru le sume 0,3 y, y finalmente si es Colombia divida por 10.
# Use condicionales y/o for.

# Se creara un nuevo data frame "final" con la nueva variable(columna)

datafinal = 


# 6) Reemplace en la columna exportaciones con 1 cuando es mayor a 2,1, con un 2
# cuando es menor 2,1y un 3 cuando es igual a 2,1, redondee al primer decimal la
# variable. Use condicionales y/o for.

exportaciones_1 = basefinal %>% filter(round(basefinal[6], [1]) > 2.1) %>% muate(exportaciones = 1)
                                       
exportaciones_2 = basefinal %>% filter(round(basefinal[6], [1]) < 2.1) %>% muate(exportaciones = 2)

exportaciones_3 = basefinal %>% filter(round(basefinal[6], [1]) = 2.1) %>% muate(exportaciones = 3)





