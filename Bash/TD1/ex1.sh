if [ "$1" = "" ]
then
    echo "Erreur, pas d'argument"
elif [ $1 -ge 16  ] && [ $1 -le 20 ]
then
    echo "Très bien"
elif [ $1 -ge 14 ]
then
    echo "bien"
elif [ $1 -ge 12 ]
then
    echo "assez bien"
elif [ $1 -ge 10 ]
then
    echo "moyen"
elif [ $1 -ge 8 ]
then
    echo "insuffisant"
elif [ $1 -lt 8 ] && [ $1 -ge 0 ]
then
    echo "médiocre"
else
    echo "Erreur, entrée erronée"
fi