
# Terminal Commands 

## Basic commands

* `ls` list files in directory
  * `ls -als` in a list format including hidden files/dirs
* `cd` change current working directory
* `pwd` print working directory
* `mkdir` create an empty directory/folder
* `rm` remove files
  * `rm -r` remove files or directories recursive
* `touch` create files or update latest open date
* `cp` copy files or directories
* `mv` move files or directories
* `clear` cleans the terminal output
* `open` opens file manager
* `source` reads and executes text files
* `echo` format strings or prints text
* `which` show where command is placed in directory tree
* `man` show command manual
* `chmod +x <file>` give execute permissions to file

## CLI - Command line interface programs

* `vim` terminal based text editor
* `pip3` install python packages
* `git` source code version control
* `say` text to speech in MAC
* `cat` prints text file in terminal
* `head` shows first 10 lines from stdout when piped
* `tail` shows last 10 lines from stdout when piped

## Some bash commands

Pipe:

1. `cat data/vehicles/vehicles.csv | head -n 5`
  Print first 5 lines from vehicles.csv file
2. `cat data/vehicles/vehicles.csv | head | cut -d "," -f1 -f2 -f3`
  Cuts the file and print columns 1 to 3

Output redirection:

1. `cat data/vehicles/vehicles.csv | head | cut -d "," -f1 -f2 -f3 > out.csv`
  Remove columns from csv file
2. `cat data/vehicles/vehicles.csv | grep "Ferrari" | cut -d "," -f1 -f2 -f3 > ferrari.csv`
  Get the ferrari cars in a separate csv file
3. `cat data/vehicles/vehicles.csv | grep "Audi" | wc -l`
  Count the number of audis
4. `cat data/vehicles/vehicles.csv | grep "Auto*" | wc -l`
  Count the automatic cars
5. `cat data/nombres.txt | xargs -L1 say "hola $1"`
  Say hi to all Instructors

6. `cat ../youtube.txt | xargs -L1  youtube-dl -x --audio-format mp3 $1`
  Download videos from youtube

## References

- [https://youtube-dl.org/]
 