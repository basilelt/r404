read -p 'Utilisateur: ' uservar
read -sp 'Mot de passe: ' passvar
echo
# lower case
uservar_lower=$(echo "$uservar" | tr '[:upper:]' '[:lower:]')
passvar_lower=$(echo "$passvar" | tr '[:upper:]' '[:lower:]')
if [[ $passvar_lower =~ $uservar_lower ]]
then
    echo "Le mot de passe contient le nom d'utilisateur"
    exit 1
# # permet d'avoir la longueur de la variable
elif [[ ${#passvar} -lt 8 ]]
then
    echo "Le mot de passe doit contenir au moins 8 caractères"
    exit 1
elif ! [[ $passvar =~ [0-9] ]]
then
    echo "Le mot de passe doit contenir au moins un chiffre"
    exit 1
elif ! [[ $passvar =~ [A-Z] ]]
then
    echo "Le mot de passe doit contenir au moins une lettre majuscule"
    exit 1
elif ! [[ $passvar =~ [a-z] ]]
then
    echo "Le mot de passe doit contenir au moins une lettre minuscule"
    exit 1
# matche les caractères spéciaux
elif ! [[ $passvar =~ [\\+*/!\$^-] ]]
then
    echo "Le mot de passe doit contenir au moins un caractère spécial"
    exit 1
else
    echo "Mot de passe valide"
    exit 0
fi