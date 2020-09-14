from modules.pokedex import get
from modules.parser import parser
from modules.generate_pdf import pokepdf

# Parsing the arguments from the shell
args = parser()
name, id = args.pokemon, args.id

# Getting data from API
pokemon = get(name,id)

# Generating the pdf output
pokepdf(pokemon)