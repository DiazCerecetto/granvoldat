# Para borrar rapido todos los archivos de las ejecuciones para subir a git

# Borra todos los archivos que no sean carpetas de forma recursiva
# en el directorio salida a partir del directorio actual.

# python borrar_archivos.py


import os

def borrar_archivos_recursivamente(directorio):
    for root, dirs, files in os.walk(directorio):
        for file in files:
            ruta_completa = os.path.join(root, file)
            if os.path.isfile(ruta_completa):
                os.remove(ruta_completa)

directorio_salida = os.getcwd() + "/salida"
borrar_archivos_recursivamente(directorio_salida)
