#!/bin/bash

# Configurando as variaveis
DIR_LOGS="/var/log/app"
RELATORIO="relatorio_limpeza.txt"

echo "Iniciando Zelador de Logs"

# 1. VERIFICAR DIRETORIO: Se não existir, avisa e para o script (exit 1)
if [ ! -d "$DIR_LOGS" ]; then
    echo "❌ ERRO: O diretorio $DIR_LOGS nao existe!"
    exit 1
fi

# Conta os arquivos antes de agir
# wc -l conta as linhas que o comando 'find' retorna
QTD_PARA_DELETAR=$(find "$DIR_LOGS" -name "*.log" -mtime +30 | wc -l)
QTD_PARA_COMPACTAR=$(find "$DIR_LOGS" -name "*.log" -mtime +7 ! -mtime +30 | wc -l)

# Deleta arquivos .log com mais de 30 dias
find "$DIR_LOGS" -name "*.log" -mtime +30 -delete

# Compacta os logs amtigos Entre 7 e 30 dias
# O comando tar -czvf cria o arquivo comprimido (.tar.gz)
if [ "$QTD_PARA_COMPACTAR" -gt 0 ]; then
    find "$DIR_LOGS" -name "*.log" -mtime +7 -exec tar -czvf "$DIR_LOGS/logs_antigos_$(date +%F).tar.gz" {} +
    echo "Arquivos de 7+ dias compactados com sucesso."
fi

#  Salva o tamanho da pasta no arquivo .txt
echo "Relatorio gerado em: $(date)" > "$RELATORIO"
echo "Tamanho da pasta $DIR_LOGS apos limpeza:" >> "$RELATORIO"
du -sh "$DIR_LOGS" >> "$RELATORIO"

# Exibe o resumo no terminal
echo "Processo concluido!"
echo "Arquivos deletados (>30 dias): $QTD_PARA_DELETAR"
echo "Arquivos compactados (>7 dias): $QTD_PARA_COMPACTAR"
echo "Relatorio salvo em: $RELATORIO"
