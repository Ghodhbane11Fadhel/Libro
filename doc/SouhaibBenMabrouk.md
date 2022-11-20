# Suivi Personnel 
###### <span style="color:red"> `Souheib Ben Mabrouk` `INDP2E`</span>
---
## Déroulement du travail:


###  Du 22 Novembre jusqu'au 1 Décembre 
Découverte du Framework <strong>Flask</strong> via des tutoriels sur Youtube 
</br>

###  Du 2 Décembre jusqu'au 10 Décembre  
<strong> models.py et site.bd </strong> </br>
   
 Conception et création de la base de donnée en se basant sur le diagramme de classes et en effectuant des commandes au terminal de python (exemple: db.session.add()) 


###  Du 11 Décembre jusqu'au 13 Décembre 
 <strong> fonctions.py </strong> </br>
 Création des fonctions: de Reglar expressions pour l'insertion: du mail (de la forme ******@****.***) et Username (Longueur entre 4 et 20 / contient que des valeurs alphanumériques et/ou des tirets) et  pour le password (longueur >=7) 
</br> </br>
 Gestion de JWT Token : Creation d'un token par la fonction Craft_JWT de durée de vie 7 jours permettant l'authetification sans avoir l'obligation de se connecter à chaque fois. </br> La vérification du token est faite par la fonction Check au cas de réutilisation .
</br>

###   14 Décembre
 <strong> prediction.py </strong> </br>
Céation d'un modèle de ML basé sur la regression linéaire permettant à partir de des données (nombre de pages lues par semaine) de prédire le nombre de pages à lire durant une année en suivant le même rythme.
</br>
</br>
<strong>NB:</strong> Je n'ai pas ajouté cette partie à l'API vu que j'ai pas pu adapter les données de la forme JSON avec les bibliothèques pandas et sklearn de Python. Vous pouvez consulter cette partie indépendamment dans le dossier ToImprove
