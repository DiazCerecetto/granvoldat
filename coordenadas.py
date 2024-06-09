import pandas as pd
from pyproj import Proj

def utm_to_latlon(x, y):
    utm_proj = Proj(proj='utm', zone=21, south=True, ellps='WGS84', datum='WGS84')
    lon, lat = utm_proj(x, y, inverse=True)
    return lat, lon

def pasar_a_latlon(ruta_entrada, ruta_salida):
    df = pd.read_excel(ruta_entrada)
    df[['latitud', 'longitud']] = df.apply(lambda row: pd.Series(utm_to_latlon(row['x'], row['y'])), axis=1)
    df['latitud'] = df['latitud'].apply(lambda x: '{:.6f}'.format(x))
    df['longitud'] = df['longitud'].apply(lambda x: '{:.6f}'.format(x))
    df.to_excel(ruta_salida, index=False)

archivo_escuelas = "entrada/CEIP.xlsx"
archivo_escuelas_latlon = "entrada/CEIP-2024.xlsx"

pasar_a_latlon(archivo_escuelas, archivo_escuelas_latlon)

archivo_liceos = "entrada/CES.xlsx"
archivo_liceos_latlon = "entrada/CES-2024.xlsx"

pasar_a_latlon(archivo_liceos, archivo_liceos_latlon)