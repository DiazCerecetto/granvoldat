import openpyxl

def check_commas_in_specific_fields(file_path, field_indices):
    try:
        # Cargar el archivo xlsx
        wb = openpyxl.load_workbook(file_path)
        sheet = wb.active

        # Iterar sobre cada fila y revisar los campos especificados
        for row in sheet.iter_rows(min_row=2, values_only=True):
            for index in field_indices:
                if index >= len(row):
                    print(f"El índice {index} está fuera del rango de la fila.")
                    continue
                field = row[index]
                if isinstance(field, str) and ',' in field:
                    print(f"Se encontró una coma en el campo {index + 1}:", field)
                    return True
        
        print("No se encontraron comas en los campos especificados de ninguna fila.")
        return False
    
    except FileNotFoundError:
        print("El archivo no fue encontrado.")
        return False
    except Exception as e:
        print("Ocurrió un error:", e)
        return False

# Ejemplo de uso
file_path = "entrada/CES-2024.xlsx"  # Cambia "ejemplo.xlsx" con la ruta a tu archivo xlsx
fields_to_check = [9, 10, 32]  # Índices de los campos que deseas revisar
check_commas_in_specific_fields(file_path, fields_to_check)
