#!/bin/bash

Dry_fruits=("Almonds" "Walnuts" "Raisins" "Anjeer")
NO_OF_FRUITS=$#

echo "1st dryfruit is : ${Dry_fruits[$0]}"
echo "2nd dryfruit is : ${Dry_fruits[$1]}"
echo "3rd dryfruit is : ${Dry_fruits[2]}"
echo "4th dryfruit is : ${Dry_fruits[3]}"

echo "all dryfruits are : ${Dry_fruits[@]}"