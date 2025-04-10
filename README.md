# EDO Euler

Este proyecto es una aplicación web sencilla que resuelve ecuaciones diferenciales utilizando el método de Euler. La aplicación cuenta con:

- **Backend:** Desarrollado con Flask en Python.
- **Cálculos numéricos:** Realizados con Octave mediante un script que implementa el método de Euler.
- **Frontend:** Interfaz HTML que permite ingresar la función y los parámetros de la EDO, mostrando los resultados en una tabla.
- **Docker (opcional):** Para empaquetar y distribuir la aplicación de forma aislada.

> **Nota:** Esta versión no incluye imágenes, pero muestra los resultados numéricos.

## Tabla de Contenidos

- [Características](#características)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Docker](#docker)

## Características

- Resuelve la EDO:
   dy
  ---- = f(x,y)
   dx  
  mediante el método de Euler.
- Permite ingresar la función y parámetros: x_0, y_0, paso (h) y x_n.
- Muestra los resultados en una tabla.
- Integración con Octave para el cálculo numérico.

## Estructura del Proyecto
euler-app/ 
├── app.py # Backend Flask que coordina la ejecución y el cálculo 
├── euler_solver.m # Script Octave que implementa el método de Euler 
├── requirements.txt # Dependencias de Python (Flask, pandas, matplotlib) 
├── Dockerfile # Archivo para construir la imagen Docker 
├── .gitignore # Archivos y carpetas a ignorar en Git 
├── README.md # Este archivo 
├── templates/ 
    │ └── index.html # Plantilla HTML para la interfaz gráfica 
└── static/ # Archivos estáticos

## Requisitos

- **Python 3.x**  
- **Octave**: Asegúrate de tener Octave instalado y de que el ejecutable se encuentre en el PATH (o de usar la ruta completa en `app.py`).
- **Docker** (opcional): Si deseas empaquetar la aplicación en un contenedor.

## Instalación

1. **Clona el repositorio:**
   ```
   git clone https://github.com/tu_usuario/tu_repositorio.git
   cd tu_repositorio
   ```

2. **Crea y activa un entorno virtual (opcional, pero recomendado):**
   python -m venv venv
   # En Windows:
   venv\Scripts\activate
   # En Linux/Mac:
   source venv/bin/activate

3. **Instala las dependencias de Python:**
   pip install -r requirements.txt

## Uso

1. **Ejecuta la aplicación Flask:**
  ```
  python app.py
  Abre tu navegador y visita:
  http://localhost:5001
  ```
  
2. **Ingresa los datos en el formulario:**
  - Ecuación dy/dx = f(x,y): Ejemplo: y - x^2 + 1
  - x₀: Ejemplo: 0
  - y₀: Ejemplo: 0.5
  - h (paso): Ejemplo: 0.2
  - xₙ (hasta x): Ejemplo: 2

3. **Haz clic en "Resolver".**
  - La app llamará a Octave para ejecutar el método de Euler y, una vez finalizado, se mostrará una tabla con los resultados.

## Docker

- Si deseas ejecutar el proyecto en un contenedor Docker, sigue estos pasos:

1. **Construye y ejecuta la imagen Docker:**

  ```
  docker-compose up --build
  ```

2. **Accede a la app en:**
  - http://localhost:5001
  
