# Etapa 1: Usar uma imagem base oficial do Python.
# A versão 'slim' é uma boa escolha para manter a imagem final menor.
FROM python:3.13.5-alpine3.22

# Etapa 2: Definir o diretório de trabalho dentro do contêiner.
# Todos os comandos subsequentes serão executados a partir deste diretório.
WORKDIR /app

# Etapa 3: Copiar o arquivo de dependências para o diretório de trabalho.
COPY requirements.txt .

# Etapa 4: Instalar as dependências.
# --no-cache-dir: Desabilita o cache do pip, reduzindo o tamanho da imagem.
# --upgrade pip: Garante que estamos usando a versão mais recente do pip.
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 5: Copiar o restante do código da aplicação para o contêiner.
COPY . .

# Etapa 6: Expor a porta em que a aplicação será executada.
EXPOSE 8000

# Etapa 7: Definir o comando para iniciar a aplicação com Uvicorn.
# O host '0.0.0.0' é necessário para que a aplicação seja acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]