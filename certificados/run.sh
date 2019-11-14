#!/bin/bash

# verifica se falta algum arquivo de certificado
if [[ ! -f /certificados/microservicos.crt || ! -f /certificados/microservicos.key || ! -f /certificados/microservicos.pfx ]]; then

    # gera a chave e o certificado
    openssl req \
        -newkey rsa:4096 \
        -nodes \
        -sha256 \
        -keyout /certificados/microservicos.key \
        -x509 \
        -days 3650 \
        -out /certificados/microservicos.crt \
        -subj "/C=BR/ST=Sergipe/L=Aracaju/O=Serveloja/OU=TI-Desenvolvimento/CN=microservicos.ti.redeserveloja.com/emailAddress=suporte@serveloja.com.br"

    # gera o arquivo PFX com a chave e o certificado juntos
    openssl pkcs12 \
        -export \
        -out /certificados/microservicos.pfx \
        -inkey /certificados/microservicos.key \
        -in /certificados/microservicos.crt \
        -passout pass:

fi
