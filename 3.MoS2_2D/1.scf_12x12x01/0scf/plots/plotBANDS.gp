set terminal postscript eps enhanced color font "Helvetica" 18 size 6.0,3.3

ofile="fig0-MoS2_2D"
epsfile=ofile.".eps"
set output epsfile

ymax=4.9
ymin=-3.9
Efermi= 0.37
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
klabel02=0.5774
klabel03=0.9107
klabel04=1.5774
klabel05=1.6753
klabel06=2.2527
klabel07=2.5860
klabel08=3.2527
klabel09=3.3506
klabel10=3.4486

set xtics(\
"{/Symbol G}" klabel01,\
"M" klabel02,\
"K" klabel03,\
"{/Symbol G}" klabel04,\
"A" klabel05,\
"L" klabel06,\
"H" klabel07,\
"A" klabel08,\
)
#"{/Helvetica=12 A|L}" klabel08,\
#"{/Helvetica=12 M|H}" klabel09,\
#"K" klabel10,\
#)

set xrange [0 to klabel10]
unset key
set label at screen 0.01,0.95 "MoS_2 2D"

set arrow  from klabel01,graph 0 to first klabel01,graph 1 nohead
set arrow  from klabel02,graph 0 to first klabel02,graph 1 nohead
set arrow  from klabel03,graph 0 to first klabel03,graph 1 nohead
set arrow  from klabel04,graph 0 to first klabel04,graph 1 nohead
set arrow  from klabel05,graph 0 to first klabel05,graph 1 nohead
set arrow  from klabel06,graph 0 to first klabel06,graph 1 nohead
set arrow  from klabel07,graph 0 to first klabel07,graph 1 nohead
set arrow  from klabel08,graph 0 to first klabel08,graph 1 nohead
set arrow  from klabel09,graph 0 to first klabel09,graph 1 nohead

plot \
  '../1bands/bands_MoS2_2D.gnu' u 1:($2-Efermi) w lp ls 4 ps 0.5 pt 7

# Convert eps to pdf for portability
cmd = "pstopdf ".epsfile
sys cmd
cmd = "rm ".epsfile
sys cmd
