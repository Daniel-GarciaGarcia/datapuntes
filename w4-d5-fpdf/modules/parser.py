import argparse

def parser():
    # Argparse rulez
    parser = argparse.ArgumentParser(description='Generate some pokemon pdfs')
    parser.add_argument('-p', dest='pokemon', type=str, help='Chose a Pokemon', default=None)
    parser.add_argument('-n', dest='id', type=int, help='Chose a pokemon id', default=None)
    args = parser.parse_args()
    return args