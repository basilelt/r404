if [ $# -ne 1 ]
then
    echo "Erreur, veuillez spécifier un nom de dossier"
    exit 1
fi


for file in "$1"/*" "*; do
    mv "$file" "${file// /-}"
done
