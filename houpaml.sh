#!/bin/bash

action=$1
filename=$2
mlModel=$3

createProject(){

    if [ "$mlModel" = "regression" ]; then
        cp scripts/Modelo-regression.ipynb application/"$filename".ipynb
        echo "Projeto ML criado com sucesso!"
    elif [ "$mlModel" = "classification" ]; then
        cp scripts/Modelo-classification.ipynb application/"$filename".ipynb
        echo "Projeto ML criado com sucesso!"
    else
        cp scripts/Modelo-vazio.ipynb application/"$filename".ipynb
        echo "Projeto criado com sucesso!"
    fi

}

installDep(){
    pip install pipenv
    pipenv run pip freeze
    pipenv install
    pipenv check
}

actionSelected(){

if [ "$action"  = "create" ]; then
    createProject
elif [ "$action" = "install" ]; then
    installDep
else
    echo "Açao não permitida"
fi
}

actionSelected