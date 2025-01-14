# Use uma imagem base com Python
FROM python

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo de requisitos para o contêiner
COPY requirements.txt .

# Instale as dependências da aplicação
RUN pip install -r requirements.txt

# Copie o código da aplicação para o contêiner
COPY . /app/

# Exponha a porta na qual a aplicação irá rodar (caso esteja usando um servidor como Flask)
EXPOSE 5000

# Defina o comando padrão para iniciar a aplicação
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]