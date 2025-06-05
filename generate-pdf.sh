#!/bin/bash

# Instala dependências necessárias
npm install -g http-server decktape

# Inicia o servidor web em segundo plano
http-server -p 8000 . &
SERVER_PID=$!

# Aguarda o servidor iniciar
sleep 3

# Gera o PDF
decktape reveal http://localhost:8000/index.html design-for-failure.pdf

# Encerra o servidor
kill $SERVER_PID

echo "PDF gerado com sucesso: design-for-failure.pdf"
