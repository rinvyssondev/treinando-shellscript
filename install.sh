#!/usr/bin/env bash
#
# install.sh - instalações de ferramentas usual de um devops/sre.
#
# Autor:     rinvysson.dev@hotmail.com
#
# ------------------------------------------------------------------------ #
#  Descrição
#   
#
#   Instalações de ferramentas básicas para o dia a dia do profissional de qualquer profissional de TI. 
#   Ainda tá em construção... 
#   
#    
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.17.5
# ------------------------------------------------------------------------ #
source libs/functions_deps.sh

# ------------------------------- VARIÁVEIS ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ -z "`which curl`" ]      && _install_curl
[ -z "`which kind`" ]      && _install_kind
[ -z "`which kubectl`" ]   && _install_kubectl
[ -z "`which docker`" ]    && _install_docker
[ -z "`which terraform`" ] && _install_terraform

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #