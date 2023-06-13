# Eksamensopgave - af Tomas R J

This is a demo project for Containerization & Linux elective at [UCL University College](https://ucl.dk)

The frontend is based on the following template:

* https://github.com/mosaadaldeen/zay-shop

## Installationsguide
### Krav
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Git](https://git-scm.com/downloads) eller [download projektet selv som en zip fil.](https://github.com/TomasRJ/cl23e-exam-project/archive/refs/heads/main.zip) 
- Villighed til at bruge kommandoer i stedet for GUI
- Brug PowerShell eller [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701) på Windows, brug ikke cmd.

### Step 0
Husk at man skal have Docker Desktop kørende.

### Step 1
Download projektet lokal med enten `git clone https://github.com/TomasRJ/cl23e-exam-project.git` eller ved at [downloade projektet som en zip fil og udpakke det til en mappe.](https://github.com/TomasRJ/cl23e-exam-project/archive/refs/heads/main.zip)

### Step 2
Åben en terminal til den mappe hvor du har placeret projektet.
```sh
cd sted\hvor\du\har\placeret\projektet
```
### Step 3
Siden dette projekt bruger Docker Swarm så skal man have de aktiveret før at projektet virker. Det gør man ved at køre følgende kommando: 
```sh
docker swarm init
```
### Step 4
Lav en registry
```sh
docker service create --name registry --publish published=5000,target=5000 registry:2
```
### Step 5
Opret de brugerdefininerede docker images ud fra de Dockerfiles jeg har skrevet:
```sh
docker compose -f .\prod-swarm-compose.yml build
```
### Step 6
Push de images vi lige har lavet til vores lokale registry:
```sh
docker compose -f .\prod-swarm-compose.yml push
```
### Step 7
Kør så følgende kommando for at webshoppen op og køre på din egen maskine:
```sh
docker stack deploy --compose-file .\prod-swarm-compose.yml examproject
```
Denne kommando sætter automatisk op de 2 brugerdefinerede container til frontend og backend, samt en MariaDB database.

**Nu skulle webshoppen køre på din egen maksine.**
**Gå til [localhost:5555](localhost:5555) for at se den**

## Afinstallering
Kør:
```sh
docker stack rm examproject
docker service rm registry
docker volume rm examproject_db
docker image prune
docker swarm leave --force
```