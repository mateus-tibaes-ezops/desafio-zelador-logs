# Zelador de Logs (Log Sweeper) 

Desafio tecnico de automacao para SRE/DevOps focado em gerenciamento de espaco em disco e manutencao de logs. 

## Objetivo 
Automaticar a limpeza e o monitoramento da past '/var/log/app', garantindo que logs antigos sejam compactados ou removidos para evitar que o disco encha.

## Funcionalidades 
- Verifica a existencia do diretorio de logs.
- compactacao: Arquivos '.Log'com mais de 7 dias sao agrupados em '.tar,gz'.
- Limpeza: Arquivos '.log' com mais de 30 dias sao deletados.
- Relatorio: Gera um log de utilizacao de espaco apos a execucao 

## Como rodar 
1. De permissao de execucao: 
   '''bash
   chmod +x zelador.sh
