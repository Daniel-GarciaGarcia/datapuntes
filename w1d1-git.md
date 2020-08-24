# GIT & Github

## Repository

Es una carpeta "controlada" por git, que gestionará las versiones y los cambios a los ficheros. Cada rama es como una copia completa de el repositorio, con los ficheros segun los commits de esa rama.

# Comandos Basicos:

- `git init` : Inicializa un repositorio, i.e.: Convierte una carpeta en un repositório gestionado por git. Solo es necesário cuando creamos un repo desde el cero, no debemos hacerlo en un repositorio que clonamos.
- `git status` : Enseña el estado del repositório.
    - Untracked files : ficheros que git no está controlando
    - Tracked files : ficheros que git sigue para verificar los cambios
    - Changes to be committed : cambios preparados para el commit

- `git add <file>` : Añade ficheros a tracked, empieza a seguirles
- `git commit -m <message>` : Guarda los cambios y crea un commit
- `git restore <file>` : Deshace cambios no commiteados de un fichero
- `git restore --staged <file>` : Mueve un fichero de tracked a untracked

- `git checkout -b <branch_name>` : Crea una nueva rama
- `git checkout <branch_name>` : Cambia la rama activa

- `git remote -v` : Enseña todos los repositórios remotos relacionados con el local
- `git remote add <name> <url>` : Añade una nueva relación con un repositório remoto

- `git push <remote> <branch>` : Sube cambios a un repositório remoto

- `git log` : Enseña el histórico de commits en una rama

- `git clone <url>` : Crea una copia local de un repositório existente remoto

# Gold RULES:
Queremos siempre el siguiente output al hacer `git status`:
## nothing to commit, working tree clean

## Hacemos commits y push frecuentes para asegurar nuestro codigo.