# Usa Ubuntu
FROM ubuntu:22.04

# Actualiza e instala dependencias
RUN apt-get update && \
    apt-get install -y octave python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configurar directorio de trabajo
WORKDIR /app

COPY . /app

# Instalar dependencias de Python
RUN python3 -m pip install --upgrade pip && \
    pip install -r requirements.txt

# Exponer el puerto 5001
EXPOSE 5001

# Inicia la app
CMD ["python3", "app.py"]