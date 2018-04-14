i=1
arr=($(<ioblockarg.txt))

for j in {2..6}
do
f="ioblock$j.v"
cp ioblock1.v ioblock$j.v
sed -i 's/ioblock1/ioblock'$j'/' $f
done

for i in {1..6}
do
file="ioblock$i.v"
var=${arr[$i-1]}
sed -i 's/D=1.*/D=1'\''b'${var:0:1}';/' $file
sed -i 's/TSMUX=2.*/TSMUX=2'\''b'${var:1:2}';/' $file
sed -i 's/DORREG=1.*/DORREG=1'\''b'${var:3:1}';/' $file
done
