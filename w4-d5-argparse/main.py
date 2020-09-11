#!/usr/bin/env python3
import sys
import argparse

# https://docs.python.org/3/library/argparse.html


def onlyYears(yearStr, minYear=1980, maxYear=2010):
    year = 2020
    try:
       year = int(yearStr)
    except Exception:
         raise argparse.ArgumentTypeError(f"{yearStr} is an invalid positive int value")
     
    if year > minYear and year < maxYear:
        return year
    else:
        raise argparse.ArgumentTypeError(f"year must be between {minYear} and {maxYear}")



def main():
    parser = argparse.ArgumentParser(description='Saluda a un vecino')
    parser.add_argument('-a', dest='apellidos',
                        default="Garcia",
                        help='los apellidos de la persona a la que saludar')
    parser.add_argument('-n', dest='nombre',
                        default="Pepe",
                        help='el nombre de la persona a la que saludar')
    parser.add_argument('-y', dest='year',
                        default=2020,
                        type=onlyYears,
                        help="Año de nacimiento")
                        
    args = parser.parse_args()
    #print(args)
    nombre = args.nombre
    apellidos = args.apellidos
    print(f"Hola que tal estas {nombre} {apellidos} naciste el {args.year}")

if __name__ == "__main__":
    main()