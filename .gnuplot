#----ENABLE MACROS----
set macros

#----COLOR PALETTES----
MATLAB = "defined (0  0.0 0.0 0.5, \
                   1  0.0 0.0 1.0, \
                   2  0.0 0.5 1.0, \
                   3  0.0 1.0 1.0, \
                   4  0.5 1.0 0.5, \
                   5  1.0 1.0 0.0, \
                   6  1.0 0.5 0.0, \
                   7  1.0 0.0 0.0, \
                   8  0.5 0.0 0.0 )"
DEFAULT = "rgbformulae 7,5,15"
HOT = "rgbformulae 21,22,23"

#----LINE COLORS----
set style line 1 lc rgb '#D53E4F' # red
set style line 7 lc rgb '#F46D43' # orange
set style line 8 lc rgb '#FDAE61' # pale orange
set style line 4 lc rgb '#FEE08B' # pale yellow-orange
set style line 5 lc rgb '#E6F598' # pale yellow-green
set style line 6 lc rgb '#ABDDA4' # pale green
set style line 3 lc rgb '#66C2A5' # green
set style line 2 lc rgb '#3288BD' # blue

#https://github.com/aschn/gnuplot-colorbrewer/blob/master/diverging/Spectral.plt

#----BORDER----
set border linewidth 2

#----SET DEFAULT LINE WIDTH----
set termoption lw 3

#----LEGEND----
set key bottom right

#----AXES---- 
set xlabel 'x'
set ylabel 'y'

#----FORTRAN INPUT----
set datafile fortran

#----TERMINALS----
PS = "set terminal postscript eps size 3,3 enhanced color font 'Helvetica,15' linewidth 2"
  
