if [ $# = 0 ]
then
    echo "Erreur, pas d'argument"
    exit 1
else
    names=$(ls $1 | cut -d" " -f1)
    type=$(ls -l $1 | grep "^d")
    files=""
    folders=""
    for name in $names
    do 
        # Match name dans type avec regex
        if [[ $type == *"$name"* ]]
        then
            folders=$folders" "$name
        else
            files=$files" "$name
        fi
    done
    echo "————– Fichiers dans $1 ——————–"
    echo $files | tr " " "\n"
    echo "————– Répertoires dans $1 ——————–"
    echo $folders | tr " " "\n"
fi