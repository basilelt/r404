if [ $# = 0 ]
then
    echo "Erreur, pas d'argument"
    exit 1
else
    result=0
    for value in $@
    do
        let "result=$result + $value"
    done
    echo "scale=2; $result / $#" | bc
    # Division non entière
fi