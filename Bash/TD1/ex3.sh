if [ "$1" = "" ]
then
    echo "Erreur, pas d'argument"
    exit 1
else
    result=$1
    for ((i=1 ; $1 - $i ; i++))
    do
        let "result=$result * $1"
    done
    echo $result
fi