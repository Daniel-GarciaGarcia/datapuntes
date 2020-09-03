import app
print("SEGUNDA importacion")
from saluda import saludaNombre

def main():
    print("Hola Main",__name__)
    app.app()
    saludaNombre()

main()