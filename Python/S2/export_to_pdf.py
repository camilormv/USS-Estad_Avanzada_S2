import nbformat
from nbconvert import PDFExporter

# Ruta del archivo .ipynb
notebook_path = r'Camilo_Maldonado_TFS2.ipynb'

# Leer el archivo .ipynb
with open(notebook_path, 'r', encoding='utf-8') as f:
    notebook = nbformat.read(f, as_version=4)

# Configurar el exportador a PDF
pdf_exporter = PDFExporter()
pdf_exporter.exclude_input_prompt = True  # Opcional: excluir los prompts de entrada

# Convertir el notebook a PDF
pdf_data, resources = pdf_exporter.from_notebook_node(notebook)

# Ruta del archivo PDF de salida
pdf_path = r'Camilo_Maldonado_TFS2.pdf'

# Guardar el PDF
with open(pdf_path, 'wb') as f:
    f.write(pdf_data)

print(f"El archivo PDF ha sido guardado en: {pdf_path}")