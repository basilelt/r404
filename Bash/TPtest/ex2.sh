read -p 'Nombre: ' nb

out=""
i=0
while [[ $i -lt $nb ]]
do
    j=$(($nb-$i))
    if [[ $i -eq $(($nb-1)) ]]
    then
        out=$out$j
    else
        out=$out$j", "
    fi
    ((i++))
done

echo $out