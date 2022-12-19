#!/bin/bash
set -x
pw=$(gopass cat /databases/pg/$1)

set -e
if [[ $pw == "" ]]; then 
	x=$(gopass generate -g xkcd -xs - databases/pg/$1)
        pw=$(gopass cat /databases/pg/$1)
fi
c1="create user $1 password '$pw'"
c2="create database $1"
c3="grant all privileges on database $1 to $1"
docker exec -it data_db_1 psql -U postgres -c "$c1"
docker exec -it data_db_1 psql -U postgres -c "$c2"
docker exec -it data_db_1 psql -U postgres -c "$c2"
