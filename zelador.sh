#!/bin/bash

# Aqui começa pela configuração dos logs
DIR_LOGS="/var/log/app"

echo "Iniciando o Zelador de Logs"

# Nessa parte eu verifico se existe
if [ ! -d "$DIR_LOGS" ]; then
    echo "Diretorio nao encontrado. Criando $DIR_LOGS..."
    mkdir -p "$DIR_LOGS"
fi

# Aqui começa a compactar os logs com mais de 7 dias 
echo "Compactando logs antigos (7 dias)..."
find "$DIR_LOGS" -name "*.log" -mtime +7 -exec tar -rvf "$DIR_LOGS/archive.tar" {} \;

# Aqui começa a apagar logs com mais de 30 dias 
echo "Apagando logs com mais de 30 dias..."
find "$DIR_LOGS" -name "*.log" -mtime +30 -delete

echo "Faxina concluída com sucesso!"
