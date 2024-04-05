read -p 'Nombre: ' nb

if [[ $nb -lt 0 ]]
then
    echo $nb "est un nombre négatif"
else
    echo $nb "est un nombre positif"
fi