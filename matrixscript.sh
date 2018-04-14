i=1
arr=($(<matrixarg.txt))

for j in {1..2}
do
for k in {1..2}
do
f="matrix${j}_${k}.v"
cp matrix1.v matrix${j}_${k}.v
sed -i 's/matrix1/matrix'$j'_'$k'/' $f
done 
done
