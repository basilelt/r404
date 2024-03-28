echo "1. vérifie l'existence d'un utilisateur
2. vérifie l'existence d'un groupe
3. vérifie si un utilisateur appartient à un groupe
4. liste l'ensemble des utilisateur à un groupe"

echo "Choisissez une option: "
read option

if [ $option -eq 1 ]
then
    echo "Entrez le nom de l'utilisateur: "
    read user
    if [ $(grep -c "^$user:" /etc/passwd) -eq 1 ]
    then
        echo "L'utilisateur $user existe"
    else
        echo "L'utilisateur $user n'existe pas"
    fi
elif [ $option -eq 2 ]
then
    echo "Entrez le nom du groupe: "
    read group
    if [ $(grep -c "^$group:" /etc/group) -eq 1 ]
    then
        echo "Le groupe $group existe"
    else
        echo "Le groupe $group n'existe pas"
    fi
elif [ $option -eq 3 ]
then
    echo "Entrez le nom de l'utilisateur: "
    read user
    echo "Entrez le nom du groupe: "
    read group
    if [ $(grep -c "^$user:" /etc/passwd) -eq 1 ]
    then
        if [ $(grep -c "^$group:" /etc/group) -eq 1 ]
        then
            if [ $(groups $user | grep -c $group) -eq 1 ]
            then
                echo "L'utilisateur $user appartient au groupe $group"
            else
                echo "L'utilisateur $user n'appartient pas au groupe $group"
            fi
        else
            echo "Le groupe $group n'existe pas"
        fi
    else
        echo "L'utilisateur $user n'existe pas"
    fi
elif [ $option -eq 4 ]
then
    echo "Entrez le nom du groupe: "
    read group
    if [ $(grep -c "^$group:" /etc/group) -eq 1 ]
    then
        echo "Les utilisateurs du groupe $group sont: "
        grep "^$group:" /etc/group | cut -d: -f4
    else
        echo "Le groupe $group n'existe pas"
    fi
else
    echo "Option invalide"
fi