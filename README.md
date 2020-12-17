# Tarea2_FOR_LOOP
Tarea 2 Big Data

# Tarea2_FOR_LOOP
Tarea 2 Big Data

######          Respuesta número 1          #####
#Una vez cargadas los data frame se procede a agregar la variable tamnio de la siguiente manera

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


######          Respuesta número 2          #####

#Una vez igualado los nombres de todos los data framme se procede a unificar en una sola data todos los data frame.

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

#####         Respuesta numero 3        ######

El total de empresas peruanas son 260 conformadas por 65 grandes 65 medianas 65 micro y 0 pequenas empresas. Por su parte, las empresas chilenas se conforman por empresas 65 grandes 65 medianas 65 micro y 0 pequenas.

#####         Respuesta numero 4        ######


#####         Respuesta numero 5        ######


#####         Respuesta numero 6        ######


#####         Respuesta numero 7        ######

basefinal <- mutate(basefinal, ingreso_factor = factor(basefinal$ingreso, 
                                                           labels = c("chile", "colombia")))
hist(basefinal$tasa_interes)
hist(gran_chile$tasa_interes)
hist(media_chile$tasa_interes)
hist(microe_chile$tasa_interes)
hist(peque_chile$tasa_interes)
