create database peliculas;
\c peliculas;

create table peliculas(
id int not null,
nom_peli varchar(255) not null,
año int not null,
nom_direct varchar(255),
primary key (id));

create table reparto(
id_peli int not null,
nom_actor varchar(255),
foreign key (id_peli) references peliculas (id));

\copy peliculas from 'peliculas.csv' csv header;

\copy reparto from 'reparto.csv' csv;

select id from peliculas where (nom_peli) = 'Titanic';

select nom_actor as actor from reparto where id_peli = 2;

select nom_actor as actor, count(nom_actor) as peliculas from reparto where nom_actor = 'Harrison Ford' group by nom_actor;

select nom_peli from peliculas where año between 1990 and 1999 order by nom_peli;

select nom_peli as títulos, length(nom_peli) as longitud_titulo from peliculas;

select char_length(nom_peli) as largo_titulo, nom_peli from peliculas order by largo_titulo desc limit 1;
