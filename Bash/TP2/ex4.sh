recursive=0

# getopts permet de gérer les options
while getopts ":r" option; do
  case $option in
    r ) # récursif
      recursive=1
      ;;
  esac
done
# shift l'index des arguments pour ne pas prendre en compte l'option
shift $((OPTIND -1))

if [ $# -ne 3 ]
then
    echo "Erreur, veuillez spécifier un nom de dossier, le caractère à remplacer et le caractère de remplacement"
    exit 1
fi

dir=$1
search=$2
replace=$3

if [ $recursive -eq 1 ]
then
    # si récursif, on utilise find pour trouver les fichiers/dossiers en profondeur
    find "$dir" -depth -name "*$search*" -execdir bash -c 'mv "$0" "${0//'"$search"'/'"$replace"'}"' {} \;
    # -depth fait que les fichiers et dossiers les bas de l'arbre sont renommés en premier
    # bash -c permet d'exécuter une commande bash
    # déplace le fichier/dossier source vers ${0//'"$search"'/'"$replace"'} -> remplace tous les espaces par des tirets
else
    for file in "$dir"/*"$search"*; do
        mv "$file" "${file//$search/$replace}"
    done
fi
