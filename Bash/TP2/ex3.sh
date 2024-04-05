if [ $# -ne 3 ]
then
    echo "Erreur, veuillez spécifier un nom de dossier, le caractère à remplacer et celui de remplacement"
    exit 1
fi

dir=$1
search=$2
replace=$3

# remplace ' ' par $search et '-' par $replace
# utilise if [[ $file == *"$search"* ]] pour vérifier si le fichier contient $search
for file in "$dir"/*; do
    if [[ $file == *"$search"* ]]; then
        mv "$file" "${file//$search/$replace}"
    fi
done