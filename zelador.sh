#!/bin/bash

# aqui vou definir o local dos logs
DIR_LOGS="/var/log/app/"

# Aqui a verificacao se o diretorio exite 
if [ ! -d "$DIR_LOGS" ]; then
    echo "Erro: O diretorio $DIR_LOGS nao foi encontrado!"
    exit 1
fi

echo "Diretorio encontrado. Iniciando a limpeza..."
