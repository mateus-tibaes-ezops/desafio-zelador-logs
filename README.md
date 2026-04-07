# Zelador de Logs (Log Sweeper) 

Desafio tecnico de automação para SRE/DevOps focado em gerenciamento de espaço em disco e manutenção de logs. 

## Objetivo 
Automatizar a limpeza e o monitoramento da pasta '/var/log/app', garantindo que logs antigos sejam compactados ou removidos para evitar que o disco encha.

## Funcionalidades 
- Verifica a existencia do diretorio de logs.
- compactação: Arquivos '.Log'com mais de 7 dias são agrupados em '.tar,gz'.
- Limpeza: Arquivos '.log' com mais de 30 dias são deletados.
- Relatório: Gera um log de utilização de espaço após a execução 

## Como rodar 
1. De permissao de execução: 
   ```bash
   chmod +x zelador.sh
