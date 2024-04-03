if [ $# = 0 ]
then
    echo "Erreur, pas d'argument"
    exit 1
elif [ $# = 1 ]
then
    # Perl est inclu par défaut dans la plupart des distributions GNU/Linux
    # Ceci permet d'utiliser la librairie Regexp::Common pour valider les
    # adresses IP avec {net}{IPv4} (également possible pour IPv6)

    # say est équivalent à print mais ajoute un retour à la ligne
    
    # [a-zA-Z0-9\-\.]+\.[a-zA-Z]+ matche les noms de domaines
    # (sous domaines, tirets)
    perl -MRegexp::Common -nE 'say $1 if /($RE{net}{IPv4})/;
        say $& if /([a-zA-Z0-9\-\.]+\.[a-zA-Z]+)/' $1
else
    echo "Erreur, trop d'arguments"
    exit 1
fi