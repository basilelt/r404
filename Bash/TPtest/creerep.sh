if [ $# -ne 2 ]
then
    echo "Erreur, veuillez spécifier un nombre de répertoires ainsi qu'un nombre de fichiers à créer."
    exit 1
fi

function convertir {
    a=$1
    lettre=`printf "\x$(printf %x $a)"`
}

out=""
count=$1+65
for ((i=65; i < $count; i++)); do
    convertir $i
    if [[ $i -eq $(($count-1)) ]]
        then
            out=$out$lettre
        else
            out=$out$lettre", "
    fi
done
echo $out

out=""
count=$1+97
for ((i=97; i < $count; i++)); do
    convertir $i
    for ((j=1; j <= $2; j++)); do
        if [[ $i -eq $(($count-1)) && $j -eq $2 ]]
            then
                out=$out$lettre$lettre$j
            else
                out=$out$lettre$lettre$j", "
        fi
    done
done
echo $out