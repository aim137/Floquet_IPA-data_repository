set terminal postscript eps enhanced color font "Helvetica" 18 size 6.0,3.3

ofile="fig0-AlAs"
epsfile=ofile.".eps"
set output epsfile

ymax=4.9
ymin=-3.9
Efermi= 4.597
set xzeroaxis

set ylabel 'Energy (eV)'
set yrange [ymin to ymax]
set format y "%1.1f"
set format x "%1.1f"
set mxtics 2
set mytics 2
set ytics 2

#K-Labels
klabel01=0.0000
klabel02=1.0000
klabel03=1.3536
klabel04=2.4142
klabel05=3.2802
klabel06=3.9873
klabel07=4.4873

set xtics(\
"{/Symbol G}" klabel01,\
"X" klabel02,\
"U|K" klabel03,\
"{/Symbol G}" klabel04,\
"L" klabel05,\
"W" klabel06,\
"X" klabel07,\
)

set xrange [0 to klabel07]
unset key
set label at screen 0.01,0.95 "AlAs bulk"

set arrow  from klabel01,graph 0 to first klabel01,graph 1 nohead
set arrow  from klabel02,graph 0 to first klabel02,graph 1 nohead
set arrow  from klabel03,graph 0 to first klabel03,graph 1 nohead
set arrow  from klabel04,graph 0 to first klabel04,graph 1 nohead
set arrow  from klabel05,graph 0 to first klabel05,graph 1 nohead
set arrow  from klabel06,graph 0 to first klabel06,graph 1 nohead
set arrow  from klabel07,graph 0 to first klabel07,graph 1 nohead

plot \
  '../1bands/bands_AlAs.gnu' u 1:($2-Efermi) w lp ls 4 ps 0.5 pt 7

# Convert eps to pdf for portability
cmd = "pstopdf ".epsfile
sys cmd
cmd = "rm ".epsfile
sys cmd
