
#----ENABLE MACROS----
set macros

#----LINE COLORS----
#load '/home/melt/.gnuplot-palettes/set1.pal'

#----SET DEFAULT LINE WIDTH----
set term wxt size 800,800
set termoption lw 2

#----LEGEND----
set key top right

#----AXES---- 
set xlabel 'x'
set ylabel 'y'

#----FORTRAN INPUT----
set datafile fortran

#----TERMINALS----
PNG = "set terminal pngcairo size 350,262 enhanced font 'Verdana,10'"
