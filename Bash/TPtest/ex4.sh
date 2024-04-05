read -p 'x: ' x
read -p 'p: ' p

result=$x
for ((i=1 ; $p - $i ; i++))
do
    let "result=$result * $x"
done
echo $result