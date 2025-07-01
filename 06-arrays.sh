#!/bin/bash

# index starts from 0, and size of array is 4
Dry_fruits=("Almonds" "Walnuts" "Raisins" "Anjeer") #give values with spaces
# NO_OF_FRUITS=$#

echo "1st dryfruit is : ${Dry_fruits[0]}"
echo "2nd dryfruit is : ${Dry_fruits[1]}"
echo "2nd dryfruit is : ${Dry_fruits[2]}"

echo "all dryfruits are : ${Dry_fruits[@]}"

# echo "4th dryfruit is : ${Dry_fruits[$3]}"
# echo " total no of fruits : ${NO_OF_FRUITS[$#]}"

#echo "all dryfruits are : ${Dry_fruits[@]}"