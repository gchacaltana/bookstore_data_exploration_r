# Importando base de datos en formato .CSV
dataBookStore <- read.csv("datasets/datos_ventas_libreria.csv")

# Mostrando primeros registros del dataframe
head(dataBookStore)

# Mostrando estructura de dataframe (DF)
str(dataBookStore)

# Devuelve
# $ Genero     : Factor w/ 2 levels "Hombre","Mujer": 1 1 2 1 2 2 2 1 2 2 ...
# $ Edad       : int  52 34 42 26 59 60 58 32 18 58 ...
# $ RangoEdad  : Factor w/ 2 levels "Adulto","Joven": 1 1 1 2 1 1 1 1 2 1 ...
# $ EstadoCivil: Factor w/ 2 levels "Casado","Soltero": 2 1 1 1 2 2 1 1 2 1 ...
# $ Tienda     : Factor w/ 12 levels "Centro de Lima",..: 3 3 7 3 12 2 2 4 7 4 ...
# $ Categoria  : Factor w/ 13 levels "Academico","Autoayuda",..: 6 10 3 10 5 5 3 13 9 1 ...
# $ Precio     : num  24 19.2 166 20 64 ...

# Ordenar variables categóricas ordinales de nuestro DF.
dataBookStore$RangoEdad = factor(dataBookStore$RangoEdad, levels=c("Joven", "Adulto"), ordered = TRUE)

str(dataBookStore)
# Devuelve
# $ Genero     : Factor w/ 2 levels "Hombre","Mujer": 1 1 2 1 2 2 2 1 2 2 ...
# $ Edad       : int  52 34 42 26 59 60 58 32 18 58 ...
# $ RangoEdad  : Ord.factor w/ 2 levels "Joven"<"Adulto": 2 2 2 1 2 2 2 2 1 2 ...
# $ EstadoCivil: Factor w/ 2 levels "Casado","Soltero": 2 1 1 1 2 2 1 1 2 1 ...
# $ Tienda     : Factor w/ 12 levels "Centro de Lima",..: 3 3 7 3 12 2 2 4 7 4 ...
# $ Categoria  : Factor w/ 13 levels "Academico","Autoayuda",..: 6 10 3 10 5 5 3 13 9 1 ...
# $ Precio     : num  24 19.2 166 20 64 ...

# Construir Tabla de Frecuencia por el Rango de Edad del Cliente

# ni = Frecuencia Absoluta
ni <- table(dataBookStore$RangoEdad)

# fi = Frecuencia Relativa
fi <- prop.table(table(dataBookStore$RangoEdad))

# pi = Frecuencia Porcentual
pi <- fi*100

ageRangeTable <- t(rbind(ni,fi,pi))
ageRangeTable

# Devuelve
#         ni        fi       pi
# Joven  3027 0.3027303 30.27303
# Adulto 6972 0.6972697 69.72697