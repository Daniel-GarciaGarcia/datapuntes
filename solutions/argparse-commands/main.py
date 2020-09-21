from argparse import ArgumentParser
from suma_command import suma
from resta_command import resta

def main():
    parser = ArgumentParser()
    subparsers = parser.add_subparsers()

    # Commando suma
    parser_suma = subparsers.add_parser('suma', description="Suma dos numeros")
    parser_suma.add_argument('x', type=int, default=1)
    parser_suma.add_argument('y', type=int, default=1)
    parser_suma.set_defaults(func=suma)


    # Commando resta
    parser_resta = subparsers.add_parser('resta', description="Resta dos numeros")
    parser_resta.add_argument('x', type=int, default=1)
    parser_resta.add_argument('y', type=int, default=1)
    parser_resta.set_defaults(func=resta)
    
    # Parse args
    args = parser.parse_args()
    args.func(args)

if __name__ == "__main__":
    main()
