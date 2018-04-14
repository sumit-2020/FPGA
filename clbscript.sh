i=1
arr=($(<clbarg.txt))

for j in {2..3}
do
f="clb$j.v"
cp clb1.v clb$j.v
sed -i 's/clb1/clb'$j'/' $f
done

for i in {1..3}
do

file="clb$i.v"
var=${arr[$i-1]}
sed -i 's/mux2select=2.*/mux2select=2'\''b'${var:0:2}';/' $file
sed -i 's/mux3select=2.*/mux3select=2'\''b'${var:2:2}';/' $file
sed -i 's/mux4select=2.*/mux4select=2'\''b'${var:4:2}';/' $file
sed -i 's/mux5select=2.*/mux5select=2'\''b'${var:6:2}';/' $file
sed -i 's/mux6select=2.*/mux6select=2'\''b'${var:8:2}';/' $file
sed -i 's/mem=16.*/mem=16'\''b'${var:10:16}';/' $file
sed -i 's/comboption=2.*/comboption=2'\''b'${var:26:2}';/' $file
sed -i 's/o2m1_0=1.*/o2m1_0=1'\''b'${var:28:1}';/' $file
sed -i 's/o2m2_0=1.*/o2m2_0=1'\''b'${var:29:1}';/' $file
sed -i 's/o2m3_0=1.*/o2m3_0=1'\''b'${var:30:1}';/' $file
sed -i 's/o2m1_1=1.*/o2m1_1=1'\''b'${var:31:1}';/' $file
sed -i 's/o2m2_1=1.*/o2m2_1=1'\''b'${var:32:1}';/' $file
sed -i 's/o2m3_1=1.*/o2m3_1=1'\''b'${var:33:1}';/' $file
sed -i 's/DQmux1=1.*/DQmux1=1'\''b'${var:34:1}';/' $file
sed -i 's/DQmux2=1.*/DQmux2=1'\''b'${var:35:1}';/' $file
sed -i 's/floporlatch=1.*/floporlatch=1'\''b'${var:36:1}';/' $file
sed -i 's/Q=1.*/Q=1'\''b'${var:37:1}';/' $file
done
