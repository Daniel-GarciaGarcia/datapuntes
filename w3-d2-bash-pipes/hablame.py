#!/usr/bin/env python3

"""
Run this command: ./hablame.py en pepe juan marta ana
"""


import sys
from subprocess import check_output

def bash_command(cmd):
    """
    Ejectuta un commando en la terminal
    """
    return check_output(["/bin/bash","-c",cmd])

languages = {
    "es":"Monica",
    "en":"Moira",
    "pt":"Joana"
}

def sayText(text, voiceLang="es"):
    """
    Compon el comando say con el texto que sea
    """
    cmd = f"say --voice \"{languages[voiceLang]}\" \"{text}\""
    print("running command ->",cmd)
    bash_command(cmd)


def saluda_es(nombre):
    return f"Hola {nombre}"

def saluda_en(nombre):
    return f"Hello {nombre}"

def saluda_pt(nombre):
    return f"Bemvido {nombre}"

saludo = {
    "es":saluda_es,
    "en":saluda_en,
    "pt":saluda_pt
}

def main(nombres, lang="es"):
    """
    Itera y saluda
    """
    print(f"Saludando en {lang}")
    for nombre in nombres:
        saludoFn = saludo[lang]
        txt = saludoFn(nombre)
        print(txt)
        sayText(txt,lang)

# Run main fn
if __name__ == "__main__":
    lang = sys.argv[1]
    nombres = sys.argv[2:]
    main(nombres,lang)


