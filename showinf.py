# para los campos latitud y longitud de un xslx, si el campo es "inf", imprimir la linea


import pandas as pd
ruta_entrada = "entrada/CES-2024.xlsx"
df = pd.read_excel(ruta_entrada)
print(df[df['latitud'] == "inf"])