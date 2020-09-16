import sys
sys.path.append("..")
print(sys.path)

from modulo_a.hola import hola

def adios():
    hola()
    print("adios")

if __name__ == "__main__":
    adios()