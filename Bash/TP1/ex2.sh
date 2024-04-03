if [ $# = 0 ]
then
    echo "Erreur, pas d'argument"
    exit 1
elif [ $# = 1 ]
then
    while [ true ]
    do
        # Sélectionne la dernière ligne, extrait le 4ème champ et sépare
        # celui-ci par '/' pour récupérer le 2ème champ, le temps moyen
        time=$(ping -c 3 $1 | tail -1 | awk '{print $4}' | cut -d '/' -f 2)
        date=$(date +"%D %H:%M")
        if [ $time == 0 ]
        then
            echo $1 $date "KO" >> log.txt
        else
            echo $1 $date $time >> log.txt
        fi
        sleep 1
    done
else
    echo "Erreur, trop d'arguments"
    exit 1
fi