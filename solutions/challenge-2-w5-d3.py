"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.
The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
import sys
import random
from string import ascii_lowercase, digits

#defaultPopulation = [*ascii_lowercase, *[str(i) for i in range(10)]]
defaultPopulation = [*ascii_lowercase, *digits]

def randomStringGenerator(stringLength=12, pop=defaultPopulation):
    return ''.join(random.choices(pop, k=stringLength))


def batchStringGenerator(numStrings, minLength=8, maxLength=12):
    if minLength >= maxLength:
        print('Incorrect min and max string lengths. Try again.')
        sys.exit(1)

    randomLength = lambda: int(random.random()*(maxLength-minLength) + minLength)
    return [randomStringGenerator(randomLength()) for i in range(numStrings)]

#minLength = input('Enter minimum string length: ')
#maxLength = input('Enter maximum string length: ')
#numStrings = input('How many random strings to generate? ')
minLength = 10
maxLength = 50
numStrings = 4

generatedData = batchStringGenerator(numStrings,minLength,maxLength)
[print(f"{i+1} - {data}") for i,data in enumerate(generatedData)]